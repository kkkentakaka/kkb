{extends file="admin/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <ul class="breadcrumb">
    <li><a href="{$admin_file}">Home</a></li>
    <li class="active">Setting</li>
    <li class="active">業者管理【一覧】</li>
  </ul>
  <div class="panel panel-info">
    <div class="panel-heading"><h4 class="panel-title">業者管理【一覧】</h4></div>
      <div class="panel-body">
        <div class="panel panel-default">
  			  <div class="panel-body">
            <form class="form-inline" role="form" action="{$admin_file}?task=KW0990" method="GET" style="padding: 1px 0px 12px 1px;">
              <input type="hidden" name="task" value="KW0990">
              <div class="btn-group">
                <a href="{$admin_file}?task=KW0990&amp;action=kw0990_form" class="btn btn-primary" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample">
                  <i class="fa fa-plus-square-o"></i> 追加
                </a>
                <a href="" id="KW99_ENDYMD" class="btn btn-success" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample" disabled>
                  <i class="fa fa-edit"></i> 修正
                </a>
                <button class="btn btn-danger collapsed" id="passmodal" type="button" data-toggle="modal" data-target="" aria-expanded="false" aria-controls="collapseExample" disabled>
                  <i class="fa fa-trash-o"></i> 削除
                </button>
              </div>
              <div class="input-group" style="float: right;">
                <input type="text" class="form-control" name="kwd" value="{$smarty.get.kwd}" placeholder="Search by key...">
                <span class="input-group-btn">
                  <button class="btn btn-info" type="submit"><i class="fa fa-search"></i> 検索</button>
                </span>
              </div>
            </form>
            <div class="table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr bgcolor="#eeeeee">
                    <th></th>
                    <th>KW99_KUBUN</th>
                    <th>KW99_CODE</th>
                    <th>KW99_MEISYO</th>
                    <th>KW99_RYAKU</th>
                    <th>KW99_SETTEI</th>
                    <th>KW99_SUUTI</th>
                    <th>KW99_STRYMD</th>
                    <th>KW99_ENDYMD</th>
                  </tr>
                </thead>
                {if $listkw0990|@count gt 0}
                {foreach from=$listkw0990 item=s}
                <tbody>
                  <tr>
                    <td>
                      <input type="hidden" class="comhidden" id="com{$s.KW99_ENDYMD}" value="0" />
                      <label><input type="checkbox" name="checkbox" class="onecheck" value="{$s.KW99_ENDYMD}"></label>
                      <!-- Modal -->
                      <div class="modal fade" id="{$s.KW99_ENDYMD}" role="dialog">
                        <div class="modal-dialog">
                          <!-- Modal content-->
                          <div class="panel panel-primary modal-content">
                            <div class="panel-heading modal-header">
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                              <h4 class="panel-title modal-title"><i class="fa fa-trash-o"></i> Delete</h4>
                            </div>
                            <div class="modal-body">
                              <p>Are you sure want to delete <b>{$s.KW99_ENDYMD}</b>?</p>
                            </div>
                            <div class="modal-footer">
                              <a href="{$index_file}?task=KW0990&amp;action=delete&amp;next={$smarty.get.next}&amp;KW99_ENDYMD={$s.KW99_ENDYMD}" class="btn btn-danger btn-md"><i class="fa fa-trash-o"> Delete</i></a>
                              <button type="button" class="btn btn-primary collapsed" data-dismiss="modal"><i class="fa fa-remove"> Close</i></button>
                            </div>
                          </div>
                        </div>
                      </div>
                    <!-- Modal -->
                    </td>
                    <td>{$s.KW99_KUBUN}</td>
                    <td>{$s.KW99_CODE}</td>
                    <td><a href="admin.php?task=KW0990&amp;action=view&amp;KW99_ENDYMD={$s.KW99_ENDYMD}">{$s.KW99_MEISYO} </a></td>
                    <td>{$s.KW99_RYAKU|truncate:20:"...":true|escape}</td>
                    <td>{$s.KW99_SETTEI|truncate:20:"...":true|escape}</td>
                    <td>{$s.KW99_SUUTI|truncate:20:"...":true|escape}</td>
                    <td>{$s.jpstartyear}</td>
                    <td>{$s.jpendyear}</td>
                  </tr>
                </tbody>
                  {/foreach}
                  {else}
                  <tbody>
                    <tr>
                      <td class="text-center" colspan="8">
                      <h4>There is no record.</h4>
                      </td>
                    </tr>
                  </tbody>
                  {/if}
              </table>
            </div>
            <div style="text-align:center">{include file="common/paginate.tpl"}</div>
          </div>
        </div>
      </div>
  </div>
{/block}
{block name="javascript"}
  <script>
  $('[data-toggle="popover"]').popover();
  $(function () {
     $('[data-toggle1="tooltip"]').tooltip()
   });
   </script>
  <script>
   function NumAndTwoDecimals(e , field)
      {
       var val = field.value;
       var reg = /^([0-9]+[\.]?[0-9]?[0-9]?|[0-9]+)/g;
       val = reg.exec(val);
       if (val) {
        field.value = val[0];
       }
       else
       {
        field.value = "";
       }
     }
     $('.onecheck').click(function() {
       $('.onecheck').not(this).prop('checked', false);
       if($('.onecheck:checked').length > 0){
        disableBtn($('.onecheck:checked:first').val(), false);
       }else{
        disableBtn(null, true);
       }
     });

     if($('.onecheck:checked').length > 0){
       disableBtn($('.onecheck:checked:first').val(), false);
     }else{
       disableBtn(null, true);
     }
     //check disable and anable
     function disableBtn(id, disable_flg){
       $("#passmodal").prop("disabled", disable_flg);
       $('#KW99_ENDYMD').attr("disabled", disable_flg);
       $('#KW99_ENDYMD').unbind('click');
       if(disable_flg){
         $('#KW99_ENDYMD').bind('click', function(e){
           e.preventDefault();
         });
       }else{
         $("#KW99_ENDYMD").attr("href","admin.php?task=KW0990&action=kw0990_form&next={$next}&KW99_ENDYMD="+id.slice(0,9));
         $('#KW99_ENDYMD').bind('click');
      $("#passmodal").attr("data-target", "#"+id);
       }
     }
  </script>
{/block}

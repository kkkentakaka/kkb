{extends file="admin/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <ol class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Setting</li>
    <li class="active">KWCONFIG</li>
  </ol>
  <div class="panel panel-info">
    <div class="panel-heading"><h4 class="panel-title">KWCONFIG</h4></div>
    <div class="panel-body">
      <div class="panel panel-default">
        <div class="panel-body">
          <form class="form-inline" role="form" action="{$admin_file}?task=KWCONFIG&amp;method="GET" style="padding: 1px 0px 12px 1px;">
            <input type="hidden" name="task" value="KWCONFIG">
            <div class="btn-group">
              <a href="{$admin_file}?task=KWCONFIG&amp;action=KWCONFIG_form" class="btn btn-primary" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample">
                <i class="fa fa-plus-circle"></i> 追加
              </a>
              <a href="" id="ID" class="btn btn-success" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample" disabled>
                <i class="fa fa-edit"></i> 修正
              </a>
              <button class="btn btn-danger collapsed" id="passmodal" type="button" data-toggle="modal" data-target="" aria-expanded="false" aria-controls="collapseExample" disabled>
                <i class="fa fa-trash-o"></i> 削除
              </button>
            </div>
            <div class="input-group" style="float: right;">
              <input type="text" class="form-control" name="kwd" value="{$smarty.get.kwd}" placeholder="Search by key...">
              <span class="input-group-btn">
                <button class="btn btn-info" type="submit"><i class="fa fa-search"></i> Search</button>
              </span>
            </div>
          </form>
          <div class="table-responsive">
            <table class="table table-hover">
              <thead>
                <tr bgcolor="#eeeeee">
                  <th></th>
                  <th>No</th>
                  <th>TITLE</th>
                  <th>VALUE</th>
                  <th>DESCRIPTION</th>
                  <th>CREATED_AT</th>
                  <th>UPDATED_AT</th>
                </tr>
              </thead>
              {if $listKWCONFIG|@count gt 0}
              {foreach from=$listKWCONFIG item=s}
              <tbody>
                <tr>
                  <td>
                    <label><input type="checkbox" name="checkbox" class="onecheck" onclick="anablebtn({$s.ID})" value="{$s.ID}" /></label>
                    <input type="hidden" class="comhidden" value="0" id="com{$s.ID}"/>
                    <div class="modal fade" id="{$s.ID}" role="dialog">
                      <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="panel panel-primary modal-content">
                          <div class="panel-heading modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="panel-title modal-title"><i class="fa fa-trash-o"></i> Delete</h4>
                          </div>
                          <div class="modal-body">
                            <p>Are you sure want to delete <b>{$s.ID}</b>?</p>
                          </div>
                          <div class="modal-footer">
                            <a href="{$admin_file}?task=KWCONFIG&amp;action=delete&amp;ID={$s.ID}&amp;next={$smarty.get.next|escape}" class="btn btn-danger btn-md"><i class="fa fa-trash-o"> Delete</i></a>
                            <button type="button" class="btn btn-primary collapsed" data-dismiss="modal"><i class="fa fa-remove"> Close</i></button>
                          </div>
                        </div>
                      </div>
                    </div>
                  <!-- Modal -->
                  </td>
                  <td>{$s.ID}</td>
                  <td>{$s.TITLE}</td>
                  <td>{$s.VALUE}</td>
                  <td>{$s.DESCRIPTION}</td>
                  <td>{$s.CREATED_AT}</td>
                  <td>{$s.UPDATED_AT}</td>
                </tr>
                {/foreach}
              </tbody>
                {else}
                <tbody>
                  <tr>
                    <td class="text-center" colspan="5">
                    <h4>There is no record.</h4>
                    </td>
                  </tr>
                </tbody>
                {/if}
            </table>
          </div><!--table-responsive  -->
            <div style="text-align:center;">{include file="common/paginate.tpl"}</div>
        </div><!--panel panel-body-->
      </div><!--panel panel-default-->
    </div><!--end panel-body-->
  </div><!--panel panel-primary-->
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
     $('#ID').attr("disabled", disable_flg);
     $('#ID').unbind('click');
     if(disable_flg){
       $('#ID').bind('click', function(e){
         e.preventDefault();
       });
     }else{
       $("#ID").attr("href","{$admin_file}?task=KWCONFIG&action=KWCONFIG_form&next={$smarty.get.next|escape}&ID="+id.slice(0,9));
       $('#ID').bind('click');
    $("#passmodal").attr("data-target", "#"+id);
     }
   }
</script>
{/block}

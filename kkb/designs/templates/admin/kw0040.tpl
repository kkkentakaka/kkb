{extends file="index/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <ul class="breadcrumb">
    <li><a href="{$index_file}">Home</a></li>
    <li class="active">Setting</li>
    <li class="active">業者管理【一覧】</li>
  </ul>
  <div class="panel panel-info">
    <div class="panel-heading"><h4 class="panel-title">業者管理【一覧】</h4></div>
      <div class="panel-body">
        <div class="panel panel-default">
  			  <div class="panel-body">
            <form class="form-inline" role="form" action="{$index_file}?task=kw0040" method="GET" style="padding: 1px 0px 12px 1px;">
              <input type="hidden" name="task" value="kw0040">
              <div class="btn-group">
                <a href="{$index_file}?task=kw0040&amp;action=kw0040_form" class="btn btn-primary" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample">
                  <i class="fa fa-plus-square-o"></i> 追加
                </a>
                <a href="" id="KW04_GYOCD" class="btn btn-success" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample" disabled>
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
          </div>
        </div>
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr bgcolor="#eeeeee">
                <th></th>
                <th>業者コード</th>
                <th>業者名</th>
                <th>業者名カナ</th>
                <th>郵便番号</th>
                <th>住所</th>
                <th>代表者</th>

              </tr>
            </thead>
            {if $KW0040|@count gt 0}
            {foreach from=$KW0040 item=s key=id}
            <tbody>
              <tr>
                <td>
                  <input type="hidden" class="comhidden" id="com{$s.KW04_GYOCD}" value="0" />
                  <label><input type="checkbox" name="checkbox" class="onecheck" value="{$s.KW04_GYOCD}"></label>
                  <!-- Modal -->
                  <div class="modal fade" id="{$s.KW04_GYOCD}" role="dialog">
                    <div class="modal-dialog">
                      <!-- Modal content-->
                      <div class="panel panel-primary modal-content">
                        <div class="panel-heading modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="panel-title modal-title"><i class="fa fa-trash-o"></i> Delete</h4>
                        </div>
                        <div class="modal-body">
                          <p>Are you sure want to delete <b>{$s.KW04_GYOCD}</b>?</p>
                        </div>
                        <div class="modal-footer">
                          <a href="{$index_file}?task=kw0040&amp;action=delete&amp;next={$smarty.get.next}&amp;KW04_GYOCD={$s.KW04_GYOCD}" class="btn btn-danger btn-md"><i class="fa fa-trash-o"> Delete</i></a>
                          <button type="button" class="btn btn-primary collapsed" data-dismiss="modal"><i class="fa fa-remove"> Close</i></button>
                        </div>
                      </div>
                    </div>
                  </div>
                <!-- Modal -->
                </td>
                <td>{$s.KW04_GYOCD}</td>
                <td><a href="{$index_file}?task=kw0040&amp;action=view&amp;KW04_GYOCD={$s.KW04_GYOCD}">{$s.KW04_GYOMEI|truncate:20:"...":true|escape}</a></td>
                <td>{$s.KW04_GYOKAN|truncate:20:"...":true|escape}</td>
                <td>{$s.KW04_YUUBIN|truncate:20:"...":true|escape}</td>
                <td>{$s.KW04_JYUSYO|truncate:20:"...":true|escape}</td>
                <td>{$s.KW04_DAIHYOU|truncate:20:"...":true|escape}</td>
                <!-- <td>{$s.KW04_TEL|truncate:20:"...":true|escape}</td> -->
                <!-- <td>{$s.KW04_INSINF}</td>
                <td>{$s.KW04_UPDINF}</td> -->
              </tr>
            </tbody>
              {/foreach}
              {else}
              <tbody>
                <tr>
                  <td class="text-center" colspan="10">
                  <h4>There is no record.</h4>
                  </td>
                </tr>
              </tbody>
              {/if}
          </table>
        </div>
      </div>
          <div style="text-align:center">{include file="common/paginate.tpl"}</div>
  </div>
{/block}
{block name="javascript"}
<script>

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
   $('#KW04_GYOCD').attr("disabled", disable_flg);
   $('#KW04_GYOCD').unbind('click');
   if(disable_flg){
     $('#KW04_GYOCD').bind('click', function(e){
       e.preventDefault();
     });
   }else{
     $("#KW04_GYOCD").attr("href","index.php?task=kw0040&action=kw0040_form&next={$next}&KW04_GYOCD="+id.slice(0,9));
     $('#KW04_GYOCD').bind('click');
  $("#passmodal").attr("data-target", "#"+id);
   }
 }
</script>
{/block}

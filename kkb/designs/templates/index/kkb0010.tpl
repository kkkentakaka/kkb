{extends file="index/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <div class="panel panel-info">
    <div class="panel-heading"><h4 class="panel-title">出入金一覧</h4></div>
    <div class="panel-body">
      <div class="panel panel-default">
        <div class="panel-body">
          <form class="form-inline" role="form" action="{$index_file}?task=kkb0010" method="GET" style="padding: 1px 0px 12px 1px;">
            <div class="btn-group">
              <a href="{$index_file}?task=kkb0010&amp;action=kkb0010_form" class="btn btn-primary" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample">
                <i class="fa fa-plus-square-o"></i> 追加
              </a>
              <a href="" id="ID" class="btn btn-success" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample" disabled>
                <i class="fa fa-edit"></i> 修正
              </a>
              <button class="btn btn-danger collapsed" id="passmodal" type="button" data-toggle="modal" data-target="" aria-expanded="false" aria-controls="collapseExample" disabled>
                <i class="fa fa-trash-o"></i> 削除
              </button>
            </div>
            <div class="input-group" style="float: right;">
              <input type="text" class="form-control" name="kwd" value="{$smarty.get.kwd}">
              <span class="input-group-btn">
                <button class="btn btn-info" type="submit"><i class="fa fa-search"></i> 検索</button>
              </span>
            </div>
          </form>
          <div class="table-responsive">
            <table class="table table-hover">
              <thead>
                <tr bgcolor="#eeeeee">
                  <th></th>
                  <th>ID</th>
                  <th>日付</th>
                  <th>支出</th>
                  <th>収入</th>
                  <th>差</th>
                  <th>挿入日</th>
                  <th>更新日</th>
                </tr>
              </thead>
              {if $listkkb0010|@count gt 0}
              <tbody>
              {foreach from=$listkkb0010 item=s}
                <tr>
                  <td>
                    <label><input type="checkbox" name="checkbox" class="onecheck" value="{$s.ID}"></label>
                    <input type="hidden" class="comhidden" value="0" id="com{$s.ID}"/>
                    <div class="modal fade" id="{$s.ID}" role="dialog">
                      <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="panel panel-primary modal-content">
                          <div class="panel-heading modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="panel-title modal-title"><i class="fa fa-trash-o"></i>削除</h4>
                          </div>
                          <div class="modal-body">
                            <p>削除しますか？</p>
                          </div>
                          <div class="modal-footer">
                            <a href="{$index_file}?task=kkb0010&amp;action=delete&amp;ID={$s.ID}&amp;next={$smarty.get.next|escape}" class="btn btn-danger btn-md"><i class="fa fa-trash-o">削除</i></a>
                            <button type="button" class="btn btn-primary collapsed" data-dismiss="modal"><i class="fa fa-remove">キャンセル</i></button>
                          </div>
                        </div>
                      </div>
                    </div>
                  <!-- Modal -->
                  </td>
                  <td>{$s.ID}</td>
                  <td>{$s.DATE}</td>
                  <td>{$s.OUTGO}</td>
                  <td>{$s.INCOME}</td>
                  <td>{$s.DIFF}</td>
                  <td>{$s.INSINF}</td>
                  <td>{$s.UPDINF}</td>
                </tr>
              </tbody>
              {/foreach}
              {else}
              <tbody>
                <tr>
                  <td class="text-center" colspan="8">
                    <h4>データがありません。</h4>
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

$('.onecheck').click(function() {
  $('.onecheck').not(this).prop('checked', false);
  if($('.onecheck:checked').length > 0){
    disableBtn($('.onecheck:checked:first').val(), false);
  }
  else
  {
    disableBtn(null, true);
  }
});

if($('.onecheck:checked').length > 0){
  disableBtn($('.onecheck:checked:first').val(), false);
}
else
{
  disableBtn(null, true);
}
//check disable and anable
function disableBtn(id, disable_flg)
{
  $("#passmodal").prop("disabled", disable_flg);
  $('#ID').attr("disabled", disable_flg);
  $('#ID').unbind('click');
  if(disable_flg){
    $('#ID').bind('click', function(e){
      e.preventDefault();
    });
  }
  else
  {
    $("#ID").attr("href","index.php?task=kkb0010&action=kkb0010_form&next={$smarty.get.next|escape}&ID="+id);
    $('#ID').bind('click');
    $("#passmodal").attr("data-target", "#"+id);
  }
}
</script>
{/block}

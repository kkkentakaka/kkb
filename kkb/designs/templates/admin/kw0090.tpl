{extends file="admin/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <ol class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="#">Setting</a></li>
    <li class="active">KW0090</li>
  </ol>
  <div class="panel panel-info">
    <div class="panel-heading"><h4 class="panel-title">KW0090</h4></div>
    <div class="panel-body">
      <div class="panel panel-default">
        <div class="panel-body">
          <form class="form-inline" role="form" action="{$admin_file}?task=KW0090" method="GET" style="padding: 1px 0px 12px 1px;">
            <input type="hidden" name="task" value="KW0090">
          <div class="form-group">
            <button class="btn btn-primary collapsed" type="button" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample">
              <i class="fa fa-plus-circle"></i>&nbsp;追加
            </button>
          </div>
            <div class="input-group" style="float: right;">
              <input type="text" class="form-control" name="kwd" value="{$smarty.get.kwd|escape}" placeholder="Search by KW09_NAME...">
              <span class="input-group-btn">
                <button class="btn btn-info" type="submit"><i class="fa fa-search"></i> 検索</button>
              </span>
            </div>
          </form>
          {if $error or $edit_KW0090.KW09_USRID}
            <div id="demo" class="collapse in">
              <form class="form" action="{$admin_file}?task=KW0090&amp;KW09_USRID={$edit_KW0090.KW09_USRID}" method="post">
          {else}
            <div id="demo" class="collapse">
              <form class="form" action="{$admin_file}?task=KW0090" method="post">
          {/if}
            {if $edit_KW0090.KW09_USRID}
            {else}
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="KW09_USRID">KW09_USRID:
                    {if $error.KW09_USRID eq 1}<font style="color:red;">*&nbsp;Please Input KW09_USRID</font>{/if}
                    {if $error.duplicate eq 1}<font style="color:red;">*&nbsp;Data duplicate please check again. </font>{/if}
                  </label>
                  <input type="text" class="form-control" id="KW09_USRID" name ="KW09_USRID" value="{if $smarty.session.S_KW0090.KW09_USRID}{$smarty.session.S_KW0090.KW09_USRID}{/if}" maxlength="10" placeholder="Enter KW09_USRID" autofocus>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="KW09_SYOKNO">KW09_SYOKNO:{if $error.KW09_SYOKNO eq 1}<font style="color:red;">*&nbsp;Please Input KW09_SYOKNO</font>{/if}</label>
                  <input type="text" class="form-control" id="KW09_SYOKNO"name="KW09_SYOKNO" value="{if $smarty.session.S_KW0090.KW09_SYOKNO}{$smarty.session.S_KW0090.KW09_SYOKNO}{/if}" maxlength="10" placeholder="Enter KW09_SYOKNO">
                </div>
              </div>
            </div>
            {/if}
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="KW09_PASS">KW09_PASS:
                    {if $error.KW09_PASS eq 1}<font style="color:red;">*&nbsp;Please Input KW09_PASS</font>{/if}
                    <!-- {if $error.is_KW09_PASS_exist eq 1}<font style="color:red;">*&nbsp;Data duplicate please check again.</font>{/if} -->
                  </label>
                  <input type="text" class="form-control" id="KW09_PASS" name="KW09_PASS" value="{$edit_KW0090.KW09_PASS}{if $smarty.session.S_KW0090.KW09_PASS}{$smarty.session.S_KW0090.KW09_PASS}{/if}" maxlength="10" placeholder="Enter KW09_PASS">
                </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                    <label for="KW09_NAME">KW09_NAME:{if $error.KW09_NAME eq 1}<font style="color:red;">*&nbsp;Please Input KW09_NAME</font>{/if}</label>
                    <input type="text" class="form-control" id="KW09_NAME"name="KW09_NAME" value="{$edit_KW0090.KW09_NAME}{if $smarty.session.S_KW0090.KW09_NAME}{$smarty.session.S_KW0090.KW09_NAME}{/if}" maxlength="30" placeholder="Enter KW09_NAME">
                  </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="KW09_KA">KW09_KA:{if $error.KW09_KA eq 1}<font style="color:red;">*&nbsp;Please Input KW09_KA</font>{/if}</label>
                  <input type="text" class="form-control" id="KW09_KA"name="KW09_KA" value="{$edit_KW0090.KW09_KA}{if $smarty.session.S_KW0090.KW09_KA}{$smarty.session.S_KW0090.KW09_KA}{/if}" maxlength="4" placeholder="Enter KW09_KA">
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group"style="margin-top:25px;">
                  {if $edit_KW0090.KW09_USRID}
                    <input type="hidden" name="KW_USRID" value="{$edit_KW0090.KW09_USRID}"/>
                    <input type="hidden" name="KW_PASS" value="{$edit_KW0090.KW09_PASS}"/>
                    <button type="submit" class="btn btn-success"><i class="fa fa-pencil-square-o"></i> 更新</button>
                    <a href="{$admin_file}?task=KW0090" class="btn btn-danger" style="color: white;"><i class="fa fa-close"></i> キャンセル</a>
                  {else}
                    <button type="submit" name="butsubmit"class="btn btn-danger"><i class="fa fa-floppy-o"></i> 保存</button>
                  {/if}
                </div>
              </div>
            </div>
          </form>
       </div>
      </div><!--end class panel panel-body-->
      </div><!--end class panel panel-default-->
      <div class="table-responsive">
        <table class="table table-striped">
          <thead>
            <tr bgcolor="#eeeeee">
            <th>KW09_USRID</th>
            <th>KW09_PASS</th>
            <th>KW09_SYOKNO</th>
            <th>KW09_NAME</th>
            <th>KW09_KA</th>
            <th>Action</th>
            </tr>
          </thead>
          {if $kw0090|@count gt 0}
          {foreach from=$kw0090 item=list_kw0090 key=i}
          <tbody>
            <tr>
              <td>{$list_kw0090.KW09_USRID}</td>
              <td>{$list_kw0090.KW09_PASS}</td>
              <td>{$list_kw0090.KW09_SYOKNO}</td>
              <td>{$list_kw0090.KW09_NAME}</td>
              <td>{$list_kw0090.KW09_KA	}</td>
              <td width="100px;">
                <a href="{$admin_file}?task=KW0090&amp;action=view&amp;KW09_USRID={$list_kw0090.KW09_USRID}&amp;KW09_PASS={$list_kw0090.KW09_PASS}" class="btn btn-info btn-xs" data-toggle1="tooltip" data-placement="top" title="view"><i class="fa fa-eye"></i></a>
                <a href="{$admin_file}?task=KW0090&amp;KW09_USRID={$list_kw0090.KW09_USRID}&amp;KW09_PASS={$list_kw0090.KW09_PASS}" class="btn btn-success btn-xs" id="hide_blog" data-toggle1="tooltip" data-placement="top" title="Edit"><i class="fa fa-edit"></i></a>
                <!-- Trigger the modal with a button -->
                <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal_{$list_kw0090.KW09_USRID}{$list_kw0090.KW09_PASS}" data-toggle1="tooltip" data-placement="top" title="Delete"><i class="fa fa-trash-o"></i></button>
                <!-- Modal -->
                <div class="modal fade" id="myModal_{$list_kw0090.KW09_USRID}{$list_kw0090.KW09_PASS}" role="dialog">
                  <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="panel panel-primary modal-content">
                      <div class="panel-heading modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <center><h4 class="panel-title modal-title"><i class="fa fa-trash-o"></i> Delete</h4></center>
                      </div>
                      <div class="modal-body">
                        <p style="text-align:center;">Are you sure want to delete  KW0090 from KW09_NAME <b>{$list_kw0090.KW09_NAME}</b>?</p>
                      </div>
                      <div class="modal-footer">
                        <a href="{$admin_file}?task=KW0090&amp;action=delete&amp;KW09_USRID={$list_kw0090.KW09_USRID}&amp;KW09_PASS={$list_kw0090.KW09_PASS}" class="btn btn-danger btn-md" style="color: white;"><i class="fa fa-trash-o"> Delete</i></a>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-remove"> Close</i></button>
                      </div>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
          </tbody>
          {/foreach}
          {else}
            <tr>
              <td colspan="5"><h4 style="text-align:center">There is no record</h4></td>
            </tr>
          {/if}
        </table>
      </div><!--table-responsive  -->
      {include file="common/paginate.tpl"}
    </div><!--end class panel-body-->
  </div><!--end class panel panel-info-->
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
</script>
{/block}

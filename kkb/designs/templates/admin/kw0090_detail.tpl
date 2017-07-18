{extends file="admin/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <ol class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="#">Setting</a></li>
    <li><a href="{$khemarak_index_file}?task=KW0090">KW0090</a></li>
    <li class="active">{$list_view.KW09_USRID}</li>
  </ol>
  <div class="panel panel-info">
    <div class="panel-heading"><h4 class="panel-title">KW0090</h4></div>
    <div class="panel-body">
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="table-responsive">
  					<table class="table">
  						<tr>
  							<th width="300">KW09_USRID</th>
  							<td>:&nbsp;{$list_view.KW09_USRID}</td>
  						</tr>
  						<tr>
  							<th width="300">KW09_PASS</th>
  							<td>:&nbsp;{$list_view.KW09_PASS}</td>
  						</tr>
  						<tr>
  							<th width="300">KW09_SYOKNO</th>
  							<td>:&nbsp;{$list_view.KW09_SYOKNO}</td>
  						</tr>
  						<tr>
  							<th width="300">KW09_NAME</th>
  							<td>:&nbsp;{$list_view.KW09_NAME}</td>
  						</tr>
  						<tr>
  							<th width="300">KW09_KA</th>
  							<td>:&nbsp;{$list_view.KW09_KA}</td>
  						</tr>
              <tr>
                <th width="300">KW09_INSINF</th>
                <td>:&nbsp;{$list_view.KW09_INSINF}</td>
              </tr>
              <tr>
                <th width="300">KW09_UPDINF</th>
                <td>:&nbsp;{$list_view.KW09_UPDINF}</td>
              </tr>
  					</table>
  				</div>
        </div><!--panel panel-body-->
      </div><!--panel panel-default-->
    </div><!--end panel-body-->
  </div><!--panel panel-primary-->
{/block}

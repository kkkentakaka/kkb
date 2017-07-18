{extends file="admin/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <ul class="breadcrumb">
    <li><a href="{$_admin_file}">Home</a></li>
    <li class="active">Setting</li>
    <li><a href="{$_admin_file}?task=KWCONFIG">KWCONFIG</a></li>
    <li class="active">{$KWCONFIG.title}</li>
  </ul>
<div class="panel panel-success">
	<div class="panel-heading"><h4 class="panel-title">KWCONFIG</h4></div>
	<div class="panel-body">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-condensed">
						<tr>
							<th>No</th>
							<td>{$KWCONFIG.ID}</td>
						</tr>
						<tr>
							<th>Title</th>
							<td>{$KWCONFIG.TITLE}</td>
						</tr>
						<tr>
							<th>Value</th>
							<td>{$KWCONFIG.VALUE}</td>
						</tr>
						<tr>
							<th>Discription</th>
							<td>{$KWCONFIG.DESCRIPTION}</td>
						</tr>
            <tr>
							<th>Created_At</th>
							<td>{$KWCONFIG.CREATED_AT}</td>
						</tr>
						<tr>
							<th>Updated_At</th>
							<td>{$KWCONFIG.UPDATED_AT}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div><!--end panel-body-->
</div>
{/block}
{block name="javascript"}
{/block}

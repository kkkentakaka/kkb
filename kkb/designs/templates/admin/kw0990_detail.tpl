{extends file="admin/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <ul class="breadcrumb">
    <li><a href="{$admin_file}">Home</a></li>
    <li class="active">Setting</li>
    <li><a href="{$admin_file}?task=KW0990">設定</a></li>
    <li class="active">{$listKW0990ByKW99_ENDYMD.KW99_ENDYMD}</li>
  </ul>

<div class="panel panel-info">
	<div class="panel-heading"><h4 class="panel-title">設定【詳細】</h4></div>
	<div class="panel-body">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="table-responsive">
          {if $detailKW0990|@count gt 0}
					<table class="table">
						<tr>
							<th width="300px">区分</th>
							<td>{$detailKW0990.KW99_KUBUN}</td>
						</tr>
						<tr>
							<th>コード</th>
							<td>{$detailKW0990.KW99_CODE}</td>
						</tr>
						<tr>
							<th>名称</th>
							<td>{$detailKW0990.KW99_MEISYO}</td>
						</tr>
            {if $detailKW0990.KW99_RYAKU}
						<tr>
							<th>略</th>
							<td>{$detailKW0990.KW99_RYAKU}</td>
						</tr>
            {/if}
            {if $detailKW0990.KW99_SETTEI}
						<tr>
							<th>設定</th>
							<td>{$detailKW0990.KW99_SETTEI}</td>
						</tr>
            {/if}
						<tr>
							<th>数値</th>
							<td>{$detailKW0990.KW99_SUUTI}</td>
						</tr>
						<tr>
							<th>開始</th>
							<td>{$detailKW0990.jpstartyear}</td>
						</tr>
						<tr>
							<th>終了</th>
							<td>{$detailKW0990.jpendyear}</td>
						</tr>
						<tr>
							<th>作成日</th>
							<td>{$detailKW0990.KW99_INSINF}</td>
						</tr>
            <tr>
							<th>更新日</th>
							<td>{$detailKW0990.KW99_UPDINF}</td>
						</tr>
					</table>
          {/if}
				</div>
			</div>
		</div>
	</div><!--end panel-body-->
</div>
{/block}
{block name="javascript"}
{/block}

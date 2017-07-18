{extends file="index/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <ul class="breadcrumb">
    <li><a href="{$index_file}">Home</a></li>
    <li class="active">Setting</li>
    <li><a href="{$index_file}?task=kw0040">業者管理</a></li>
    <li class="active">{$KW0040ByID.KW04_GYOCD}</li>
  </ul>

<div class="panel panel-info">
	<div class="panel-heading"><h4 class="panel-title">業者詳細</h4></div>
	<div class="panel-body">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th width="300px">業者コード</th>
							<td>{$KW0040ByID.KW04_GYOCD}</td>
						</tr>
						<tr>
							<th>業者名</th>
							<td>{$KW0040ByID.KW04_GYOMEI}</td>
						</tr>
						<tr>
							<th>業者名カナ</th>
							<td>{$KW0040ByID.KW04_GYOKAN}</td>
						</tr>
						<tr>
							<th>郵便番号</th>
							<td>{$KW0040ByID.KW04_YUUBIN}</td>
						</tr>
						<tr>
							<th>住所</th>
							<td>{$KW0040ByID.KW04_JYUSYO}</td>
						</tr>
						<tr>
							<th>KW04_KATAGAKI</th>
							<td>{$KW0040ByID.KW04_KATAGAKI}</td>
						</tr>
						<tr>
							<th>代表者</th>
							<td>{$KW0040ByID.KW04_DAIHYOU}</td>
						</tr>
						<tr>
							<th>電話番号</th>
							<td>{$KW0040ByID.KW04_TEL}</td>
						</tr>
						<tr>
							<th>作成日</th>
							<td>{$KW0040ByID.KW04_INSINF}</td>
						</tr>
            {if $KW0040ByID|@count gt 0}
            <tr>
              <th>更新日</th>
              <td>{$KW0040ByID.KW04_UPDINF}</td>
            </tr>
            {/if}
					</table>
				</div>
			</div>
		</div>
	</div><!--end panel-body-->
</div>
{/block}
{block name="javascript"}
{/block}

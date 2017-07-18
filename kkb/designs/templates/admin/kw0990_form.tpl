{extends file="admin/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <ol class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Setting</li>
    <li class="active">設定</li>
  </ol>
<div class="panel panel-info">
  <div class="panel-heading"><h4 class="panel-title">設定【管理】</h4></div>
  <div class="panel-body">
		<div class="panel panel-default">
			<div class="panel-body">
					<div class="col-md-12">
						<form class="form" role="form" action="{$index_file}?task=KW0990&amp;action=kw0990_form&amp;next={$smarty.get.next}&amp;KW99_ENDYMD={$listKW0990ByKW99_ENDYMD.KW99_ENDYMD}" method="post">
							<!-- Primary key not edit -->
              <!-- {if $KW0040ByID.KW04_GYOCD}
              <div class="form-group">
                <label class="sr-only" for="exampleInputAmount">品名コード </label>
                <div class="input-group col-md-3">
                  <div class="input-group-addon label-addon">品名コード</div>
                  <input type="text" class="form-control" id="exampleInputAmount" placeholder="Amount" value="{$KW0040ByID.KW04_GYOCD}" disabled >
                </div>
              </div>
              {else} -->
              <div class="form-group">
                <!-- <label class="sr-only" for="exampleInput">品名コード</label> -->
                {if $error.KW99_KUBUN eq 1} <span style="color:red">入力してください。</span>{/if}
                <div class="input-group col-md-4">
                  <div class="input-group-addon label-addon">区分<span style="color:red;">*</span></div>
                  <input type="text" id="exampleInput" class="form-control" name="KW99_KUBUN" onkeyDown="return NumOnly(event, this);" maxlength="2"
                  value="{if $listKW0990ByKW99_ENDYMD.KW99_KUBUN}{$listKW0990ByKW99_ENDYMD.KW99_KUBUN}{else}{if $smarty.session.KW0990.KW99_KUBUN}{$smarty.session.KW0990.KW99_KUBUN|escape}{/if}{/if}" autofocus>
                </div>
              </div>
              <div class="form-group">
                <!-- <label class="sr-only" for="exampleInput">品名コード</label> -->
                {if $error.KW99_CODE eq 1} <span style="color:red">入力してください。</span>{/if}
                <div class="input-group col-md-4">
                  <div class="input-group-addon label-addon">コード<span style="color:red;">*</span></div>
                  <input type="text" id="exampleInput" class="form-control" name="KW99_CODE" onkeyDown="return NumOnly(event, this);"
                  value="{if $listKW0990ByKW99_ENDYMD.KW99_CODE}{$listKW0990ByKW99_ENDYMD.KW99_CODE}{else}{if $smarty.session.KW0990.KW99_CODE}{$smarty.session.KW0990.KW99_CODE|escape}{/if}{/if}" autofocus>
                </div>
              </div>
              <!-- {/if} -->
								<div class="form-group">
									<!-- <label class="sr-only">業者名</label> -->
                  <span style="color:red">{if $error.KW99_MEISYO eq 1}入力してください。{/if}</span>
									<div class="input-group col-md-8">
										<div class="input-group-addon label-addon">名称<span style="color:red;">*</span></div>
                    <input type="text" class="form-control" name="KW99_MEISYO" maxlength="60"
                    value="{if $listKW0990ByKW99_ENDYMD.KW99_MEISYO}{$listKW0990ByKW99_ENDYMD.KW99_MEISYO}{else}{if $smarty.session.KW0990.KW99_MEISYO}{$smarty.session.KW0990.KW99_MEISYO|escape}{/if}{/if}">
									</div>
								</div>
								<div class="form-group">
									<!-- <label class="sr-only">業者名カナ</label> -->
                  <!-- <span style="color:red">{if $error.KW99_RYAKU eq 1} Please enter KW99_RYAKU.{/if}</span> -->
									<div class="input-group col-md-7">
										<div class="input-group-addon label-addon">略</div>
                    <input type="text" class="form-control" name="KW99_RYAKU" maxlength="20"
                    value="{if $listKW0990ByKW99_ENDYMD.KW99_RYAKU}{$listKW0990ByKW99_ENDYMD.KW99_RYAKU}{else}{if $smarty.session.KW0990.KW99_RYAKU}{$smarty.session.KW0990.KW99_RYAKU|escape}{/if}{/if}" placeholder="Enter Character">
									</div>
								</div>
								<div class="form-group">
									<!-- <label class="sr-only">郵便番号</label> -->
                  <!-- <span style="color:red">{if $error.KW99_SETTEI eq 1} Please enter KW99_SETTEI.{/if}</span> -->
									<div class="input-group col-md-6">
										<div class="input-group-addon label-addon">設定</div>
                    <input type="text" class="form-control" name="KW99_SETTEI"  maxlength="10"
                    value="{if $listKW0990ByKW99_ENDYMD.KW99_SETTEI}{$listKW0990ByKW99_ENDYMD.KW99_SETTEI}{else}{if $smarty.session.KW0990.KW99_SETTEI}{$smarty.session.KW0990.KW99_SETTEI|escape}{/if}{/if}" placeholder="Enter Character">
									</div>
								</div>

								<div class="form-group">
									<!-- <label class="sr-only">住所</label> -->
                  <span style="color:red">{if $error.KW99_SUUTI eq 1}入力してください。{/if}</span>
									<div class="input-group col-md-5">
										<div class="input-group-addon label-addon">数値<span style="color:red;">*</span></div>
                    <input type="text" class="form-control" name="KW99_SUUTI" maxlength="10" onkeyDown="return NumOnly(event, this);"
                    value="{if $listKW0990ByKW99_ENDYMD.KW99_SUUTI}{$listKW0990ByKW99_ENDYMD.KW99_SUUTI}{else}{if $smarty.session.KW0990.KW99_SUUTI}{$smarty.session.KW0990.KW99_SUUTI|escape}{/if}{/if}" placeholder="Enter Number">
									</div>
								</div>

                <div class="form-group">
									<!-- <label class="sr-only">代表者</label> -->
                  <span style="color:red">{if $error.KW99_STRYMD eq 1}入力してください。{elseif $error.comparedate} KW99_STRYMD can not great than KW99_ENDYMD.{/if}</span>
									<div class="input-group col-md-5">
										<div class="input-group-addon label-addon">開始<span style="color:red;">*</span></div>
                    {if $error.KW99_STRYMD eq 1}
                      <input type="text" class="form-control" name="KW99_STRYMD" maxlength="8" onkeyDown="return NumOnly(event, this);"
                      value="{if $listKW0990ByKW99_ENDYMD.jpstartyear}{$listKW0990ByKW99_ENDYMD.jpstartyear}{elseif $smarty.session.KW0990.KW99_STRYMD}{$smarty.session.KW0990.KW99_STRYMD|escape}{/if}" placeholder="Enter Number">
                    {else}
                      <input type="text" class="form-control" name="KW99_STRYMD" maxlength="8" onkeyDown="return NumOnly(event, this);"
                      value="{if $listKW0990ByKW99_ENDYMD.jpstartyear}{$listKW0990ByKW99_ENDYMD.jpstartyear}{elseif $smarty.session.KW0990.KW99_STRYMD}{$smarty.session.KW0990.KW99_STRYMD|escape}{else}{$requestdate}{/if}">
                    {/if}
                  </div>
								</div>
                <div class="form-group">
									<!-- <label class="sr-only">電話番号</label> -->
                  <span style="color:red">{if $error.KW99_ENDYMD eq 1}入力してください。{elseif $error.isExist eq 1} KW99_ENDYMD had already ind database.{elseif $error.comparedate} KW99_ENDYMD can not less than KW99_STRYMD.{/if}</span>
									<div class="input-group col-md-5">
										<div class="input-group-addon label-addon">終了<span style="color:red;">*</span></div>
                    {if $error.KW99_ENDYMD eq 1}
                      <input type="text" onkeyDown="return NumOnly(event, this);"  class="form-control" name="KW99_ENDYMD" maxlength="8"
                      value="{if $listKW0990ByKW99_ENDYMD.jpendyear}{$listKW0990ByKW99_ENDYMD.jpendyear}{elseif $smarty.session.KW0990.KW99_ENDYMD}{$smarty.session.KW0990.KW99_ENDYMD|escape}{/if}" placeholder="Enter Number">
                    {else}
                      <input type="text" onkeyDown="return NumOnly(event, this);"  class="form-control" name="KW99_ENDYMD" maxlength="8"
                      value="{if $listKW0990ByKW99_ENDYMD.jpendyear}{$listKW0990ByKW99_ENDYMD.jpendyear}{elseif $smarty.session.KW0990.KW99_ENDYMD}{$smarty.session.KW0990.KW99_ENDYMD|escape}{else}{$requestdate}{/if}">
                    {/if}
                  </div>
								</div>
                <div class="form-group">
                  {if $listKW0990ByKW99_ENDYMD.KW99_ENDYMD}
                    <input type="hidden" name="next" value="{$smarty.get.next}">
                    <button type="submit" class="btn btn-success"><i class="fa fa-check-circle-o"></i> 更新</button>
  									<a href="{$admin_file}?task=KW0990&amp;next={$smarty.get.next}" class="btn btn-danger" style="color: white;"><i class="fa fa-close"></i> キャンセル</a>
                  {else}
                    <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> 保存</button>
  									<a href="{$admin_file}?task=KW0990&amp;next={$smarty.get.next}" class="btn btn-danger" style="color: white;"><i class="fa fa-close"></i> キャンセル</a>
                  {/if}
                </div>
				    </form>
						</div><!--Close col-md-12-->
				</div>
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

     function Numberformat(e , field)
        {
         var val = field.value;
         var reg = /^([0-9]+[\-]?[0-9]?[0-9]?[0-9]?[0-9]?|[0-9]+)/g; // [0-9]{3}\-[0-9]{4}
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

{extends file="index/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <ol class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Setting</li>
    <li class="active">業者管理【一覧】</li>
  </ol>
<div class="panel panel-info">
  <div class="panel-heading"><h4 class="panel-title">{if $smarty.get.KW0040.KW04_GYOCD}業者管理【一覧】{else}業者管理【一覧】{/if}</h4></div>
  <div class="panel-body">
		<div class="panel panel-default">
			<div class="panel-body">
					<div class="col-md-12">
						<form class="form" role="form" action="{$index_file}?task=kw0040&amp;action=kw0040_form&amp;next={$smarty.get.next}&amp;KW04_GYOCD={$KW0040ByID.KW04_GYOCD}" method="post">
							<!-- Primary key not edit -->
              {if $KW0040ByID.KW04_GYOCD}
              <div class="form-group">
                <label class="sr-only" for="exampleInputAmount">品名コード </label>
                <div class="input-group col-md-3">
                  <div class="input-group-addon label-addon">品名コード</div>
                  <input type="text" class="form-control" id="exampleInputAmount" placeholder="Amount" value="{$KW0040ByID.KW04_GYOCD}" disabled >
                </div>
              </div>
              {else}
              <div class="form-group">
                <label class="sr-only" for="exampleInput">品名コード</label>
                {if $error.KW04_GYOCD eq 1} <span style="color:red"> Please enter KW04_GYOCD.</span>{/if}
                {if $error.is_exist eq 1} <span style="color:red"> KW04_GYOCD is already exist.</span>{/if}
                <div class="input-group col-md-3">
                  <div class="input-group-addon label-addon">品名コード <span style="color:red;">*</span></div>
                  <input type="text" id="exampleInput" class="form-control" name="KW04_GYOCD" onkeyup="NumAndTwoDecimals(event , this);" maxlength="8"
                  value="{if $KW0040ByID.KW04_GYOCD}{$KW0040ByID.KW04_GYOCD}{else}{if $smarty.session.kw0040.KW04_GYOCD}{$smarty.session.kw0040.KW04_GYOCD|escape}{/if}{/if}" placeholder="Enter KW04_GYOCD" autofocus>
                </div>
              </div>
              {/if}
								<div class="form-group">
									<label class="sr-only">業者名</label>
                  <span style="color:red">{if $error.KW04_GYOMEI eq 1} Please enter KW04_GYOMEI.{/if}</span>
									<div class="input-group col-md-8">
										<div class="input-group-addon label-addon">業者名 <span style="color:red;">*</span></div>
                    <input type="text" class="form-control" name="KW04_GYOMEI" maxlength="60"
                    value="{if $KW0040ByID.KW04_GYOMEI}{$KW0040ByID.KW04_GYOMEI}{else}{if $smarty.session.kw0040.KW04_GYOMEI}{$smarty.session.kw0040.KW04_GYOMEI|escape}{/if}{/if}" placeholder="Enter KW04_GYOMEI">
									</div>
								</div>
								<div class="form-group">
									<label class="sr-only">業者名カナ</label>
                  <span style="color:red">{if $error.KW04_GYOKAN eq 1} Please enter KW04_GYOKAN.{/if}</span>
									<div class="input-group col-md-6">
										<div class="input-group-addon label-addon">業者名カナ <span style="color:red;">*</span></div>
                    <input type="text" class="form-control" name="KW04_GYOKAN" maxlength="30"
                    value="{if $KW0040ByID.KW04_GYOKAN}{$KW0040ByID.KW04_GYOKAN}{else}{if $smarty.session.kw0040.KW04_GYOKAN}{$smarty.session.kw0040.KW04_GYOKAN|escape}{/if}{/if}" placeholder="Enter KW04_GYOKAN">
									</div>
								</div>
								<div class="form-group">
									<label class="sr-only">郵便番号</label>
                  <span style="color:red">{if $error.KW04_YUUBIN eq 1} Please enter KW04_YUUBIN.{elseif $error.format} Please follow format in field.{/if}</span>
									<div class="input-group col-md-4">
										<div class="input-group-addon label-addon">郵便番号 <span style="color:red;">*</span></div>
                    <input type="text" class="form-control" name="KW04_YUUBIN" onkeyup="Numberformat(event , this);" maxlength="8"
                    value="{if $KW0040ByID.KW04_YUUBIN}{$KW0040ByID.KW04_YUUBIN}{else}{if $smarty.session.kw0040.KW04_YUUBIN}{$smarty.session.kw0040.KW04_YUUBIN|escape}{/if}{/if}" placeholder="000-0000">
									</div>
								</div>

								<div class="form-group">
									<label class="sr-only">住所</label>
                  <span style="color:red">{if $error.KW04_JYUSYO eq 1} Please enter KW04_JYUSYO.{/if}</span>
									<div class="input-group col-md-8">
										<div class="input-group-addon label-addon">住所 <span style="color:red;">*</span></div>
                    <input type="text" class="form-control" name="KW04_JYUSYO" maxlength="60"
                    value="{if $KW0040ByID.KW04_JYUSYO}{$KW0040ByID.KW04_JYUSYO}{else}{if $smarty.session.kw0040.KW04_JYUSYO}{$smarty.session.kw0040.KW04_JYUSYO|escape}{/if}{/if}" placeholder="Enter KW04_JYUSYO">
									</div>
								</div>
                <!-- <div class="form-group">
									<label class="sr-only">KW04_KATAGAKI: <span style="color:red">* {if $error.KW04_KATAGAKI eq 1} Please enter KW04_KATAGAKI.{/if}</span></label>
									<div class="input-group col-md-8">
										<div class="input-group-addon label-addon">KW04_KATAGAKI: <span style="color:red;">*</span></div>
                    <input type="text" class="form-control" name="KW04_KATAGAKI" maxlength="60"
                    value="{if $KW0040ByID.KW04_KATAGAKI}{$KW0040ByID.KW04_KATAGAKI}{else}{if $smarty.session.kw0040.KW04_KATAGAKI}{$smarty.session.kw0040.KW04_KATAGAKI|escape}{/if}{/if}" placeholder="Enter KW04_KATAGAKI">
									</div>
								</div> -->
                <div class="form-group">
									<label class="sr-only">代表者</label>
                  <!-- <span style="color:red">{if $error.KW04_DAIHYOU eq 1} Please enter KW04_DAIHYOU.{/if}</span> -->
									<div class="input-group col-md-8">
										<div class="input-group-addon label-addon">代表者 <span style="color:red;">*</span></div>
                    <input type="text" class="form-control" name="KW04_DAIHYOU" maxlength="60"
                    value="{if $KW0040ByID.KW04_DAIHYOU}{$KW0040ByID.KW04_DAIHYOU}{else}{if $smarty.session.kw0040.KW04_DAIHYOU}{$smarty.session.kw0040.KW04_DAIHYOU|escape}{/if}{/if}" placeholder="Enter KW04_DAIHYOU">
									</div>
								</div>
                <div class="form-group">
									<label class="sr-only">電話番号</label>
                  <!-- <span style="color:red">{if $error.KW04_TEL eq 1} Please enter KW04_TEL.{/if}</span> -->
									<div class="input-group col-md-5">
										<div class="input-group-addon label-addon">電話番号 <span style="color:red;">*</span></div>
                    <input type="text" onkeyup="NumAndTwoDecimals(event , this);"  class="form-control" name="KW04_TEL" maxlength="15"
                    value="{if $KW0040ByID.KW04_TEL}{$KW0040ByID.KW04_TEL}{else}{if $smarty.session.kw0040.KW04_TEL}{$smarty.session.kw0040.KW04_TEL|escape}{/if}{/if}" placeholder="Enter KW04_TEL">
									</div>
								</div>
                <div class="form-group">

                  {if $KW0040ByID.KW04_GYOCD}
                    <input type="hidden" name="next" value="{$smarty.get.next}">
                    <button type="submit" class="btn btn-success"><i class="fa fa-check-circle-o"></i> 更新</button>
  									<a href="{$index_file}?task=kw0040&amp;next={$smarty.get.next}" class="btn btn-danger" style="color: white;"><i class="fa fa-close"></i> キャンセル</a>
                  {else}
                    <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> 保存</button>
  									<a href="{$index_file}?task=kw0040&amp;next={$smarty.get.next}" class="btn btn-danger" style="color: white;"><i class="fa fa-close"></i> キャンセル</a>
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
   function NumAndTwoDecimals(e , field)
      {
       var val = field.value;
       var reg = /^([0-9]+[\.]?[0-9]?[0-9]?|[0-9]+)/g; // [0-9]{3}\-[0-9]{4}
       val = reg.exec(val);
       if (val) {
        field.value = val[0];
       }
       else
       {
        field.value = "";
       }
     }

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

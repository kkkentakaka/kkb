{extends file="admin/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
  <ol class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">KWCONFIG</li>
  </ol>
  <div class="panel panel-info">
    <div class="panel-heading"><h4 class="panel-title">KWCONFIG</h4></div>
    <div class="panel-body">
      <div class="panel panel-default">
        <div class="panel-body">
          {if $KWCONFIG.ID}
          <form class="form" role="form" action="{$admin_file}?task=KWCONFIG&amp;action=KWCONFIG_form&amp;next={$smarty.get.next}&amp;ID={$KWCONFIG.ID}" method="post">

          {else}
          <form class="form" role="form" action="{$admin_file}?task=KWCONFIG&amp;action=KWCONFIG_form" method="post">
          {/if}

            <!-- Primary key not edit -->
              {if $smarty.get.ID}
              <div class="form-group">
                <label class="sr-only" for="exampleInput">ID</label>
                <div class="input-group">
                  <div class="input-group-addon label-addon">ID</div>
                  <input type="text" class="form-control" value="{$KWCONFIG.ID}" disabled>
                </div>
              </div>
              {/if}
                  <div class="row">
                    <div class="form-group col-md-6">
                      <label class="sr-only" for="exampleInput">Title </label>
                      {if $error.TITLE eq 1} <span style="color:red"> Please enter TITLE.</span>{/if}
                      <div class="input-group">
                        <div class="input-group-addon label-addon">TITLE <span style="color:red;">*</span></div>
                        <input type="text"  class="form-control" name="TITLE" maxlength="64"
                          value="{if $KWCONFIG.TITLE}{$KWCONFIG.TITLE}{else}{if $smarty.session.KWCONFIG.TITLE}{$smarty.session.KWCONFIG.TITLE|escape}{/if}{/if}" placeholder="Enter TITLE">
                      </div>
                    </div>

                    <div class="form-group col-md-7">
                      <label class="sr-only" for="exampleInput">Value </label>
                      {if $error.VALUE eq 1} <span style="color:red"> Please enter VALUE.</span>{/if}
                      <div class="input-group">
                        <div class="input-group-addon label-addon">VALUE <span style="color:red;">*</span></div>
                        <input type="text"  class="form-control" name="VALUE" maxlength="11" onkeyup="NumAndTwoDecimals(event , this);"
                          value="{if $KWCONFIG.VALUE}{$KWCONFIG.VALUE}{else}{if $smarty.session.KWCONFIG.VALUE}{$smarty.session.KWCONFIG.VALUE|escape}{/if}{/if}" placeholder="Enter value">
                      </div>
                    </div>
                    <div class="form-group col-md-12">
                      {if $error.DESCRIPTION  eq 1} <span style="color:red"> Please enter DESCRIPTION.</span>{/if}
                     <label for="comment">DESCRIPTION<span style="color:red;">*</span>:</label>
                     <textarea name="DESCRIPTION" class="form-control" cols="50" rows="4" id="DESCRIPTION">{if $KWCONFIG.DESCRIPTION}{$KWCONFIG.DESCRIPTION}{else}{if $smarty.session.KWCONFIG.DESCRIPTION}{$smarty.session.KWCONFIG.DESCRIPTION|escape}{/if}{/if}</textarea>
                    </div>


                  </div>

                </div><!-- close sub panel body-->
              </div><!-- close sub panel default-->

              <div class="form-group">
              {if $KWCONFIG.ID}
                <!-- <input type="hidden" name="KW02_HINCD" value="{$kw0020.KW02_HINCD}" /> -->
                <button type="submit" class="btn btn-success"><i class="fa fa-check-circle-o"></i> 更新</button>
                <a href="{$admin_file}?task=KWCONFIG&amp;next={$smarty.get.next|escape}" class="btn btn-danger" style="color: white;"><i class="fa fa-close"></i> キャンセル</a>
              {else}
                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> 保存</button>
                <a href="{$admin_file}?task=KWCONFIG&amp;next={$smarty.get.next|escape}" class="btn btn-danger"><i class="fa fa-close"></i>  キャンセル</a>
              {/if}
            </div>
        </form>
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
     var reg = /^([0-9]+[\.]?[0-9]?[0-9]?[0-9]?|[0-9]+)/g;
     val = reg.exec(val);
     if (val) {
      field.value = val[0];
     }
     else
     {
      field.value = "";
     }
   }
  // Select2 script
  $(document).ready(function() {
    $(".js-example-basic-single").select2();
  });

  // Convert japan date
  function ConvertDate(e, field)
  {
    var qi;
    var headname;
    // get value from input field
    var val = field.value;
    // substr the first value of japan year
    var head = val.substr(0, 1);
    // substr the year of japan year
    var year = val.substr(1, 2);
    // substr the month
    var month = val.substr(3,2);
    if(month ==04) qi = "1";
    if(month ==05) qi = "2";
    if(month ==06) qi = "3";
    if(month ==07) qi = "4";
    if(month ==08) qi = "5";
    if(month ==09) qi = "6";
    if(month ==10) qi = "7";
    if(month ==11) qi = "8";
    if(month ==12) qi = "9";
    if(month ==01) qi = "10";
    if(month ==02) qi = "11";
    if(month == 03) qi ="12";

    if(head == 3) headname = "Ex";
    if(head == 4) headname = "平成";
    document.getElementById("headyear").textContent=headname+" "+year;
    document.getElementById("month").textContent=month;
    document.getElementById("qi").textContent=qi;
  }
  function NumAndCalculateFee(e, field)
  {
    $.ajax({
    type: "POST",
    url: "index.php?task=ship_parking_fee&action=calShipParkingFee",
    data: { KW03_KOURKBN : 'abc', KW03_SENPKBN : 'def', KW03_SENSEKI : 'ghi', KW03_TONSU : 'jkl', KW20_SYURUI : 'mno' },
    success: function(data) {
      $('input[name="KW20_ZEIKOM1"]').val(data);
       }
  })
    // $.ajax({
    // 	'url' : 'index.php?task=ship_parking_fee&action=calShipParkingFee',
    // 	'method' : 'post',
    // 	'data' : { KW03_KOURKBN : 'abc', KW03_SENPKBN : 'def', KW03_SENSEKI : 'ghi', KW03_TONSU : 'jkl', KW20_SYURUI : 'mno' },
    // 	'dataType' : 'json',
    // 	sucess : function（return_data）｛
    //   alert(return_data);
    // 	}
    // })
  }
</script>
{/block}

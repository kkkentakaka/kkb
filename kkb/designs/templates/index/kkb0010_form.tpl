{extends file="index/layout.tpl"}
{block name="main"}
<div class="row" style="padding: 10px 12px;">
<div class="panel panel-info">
  <div class="panel-heading"><h4 class="panel-title">Report[management]</h4></div>
  <div class="panel-body">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="col-md-12">
          <form class="form" role="form" action="{$index_file}?task=ggfm0030&amp;action=ggfm0030_form&amp;next={$smarty.get.next|escape}&amp;ID={$smarty.get.ID}" method="post">
            <!-- Primary key not edit -->

              {if $smarty.get.ID}
              <div class="form-group">
                <label class="sr-only" for="exampleInputAmount">DATE</label>
                <div class="input-group col-md-4">
                  <div class="input-group-addon label-addon">DATE</div>
                  <input type="DATE" class="form-control" id="exampleInputAmount" value="{$smarty.get.ID}" readonly >
                </div>
              </div>
              {/if}

              <input type="hidden" id="exampleInput" class="form-control" name="USER_ID" maxlength="10" value="{$smarty.session.is_index_login}" >
              <div class="form-group">
                <label class="sr-only" for="exampleInput">Date</label>
                <div class="input-group col-md-4">
                  <div class="input-group-addon label-addon">Date</div>
                  <input type="text" id="exampleInput" class="form-control datepicker" name="YMD" maxlength="8" value="{if $getReport.YMD}{$getReport.YMD}{else}{if $smarty.session.YMD}{$smarty.session.YMD|escape}{/if}{/if}" >
                </div>
              </div>

              <div class="form-group">
                <label class="sr-only" for="exampleInput">Plan</label>
                <div class="input-group col-md-9">
                  <div class="input-group-addon label-addon">Plan</div>
                  <textarea id="exampleInput" class="form-control" name="PLAN">{if $getReport.PLAN}{$getReport.PLAN}{/if}</textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="sr-only" for="exampleInput">Result</label>
                <div class="input-group col-md-9">
                  <div class="input-group-addon label-addon">Result</div>
                  <textarea id="exampleInput" class="form-control" name="RESULT">{if $getReport.RESULT}{$getReport.RESULT}{/if}</textarea>
                </div>
              </div>

              <div class="form-group">
              {if $getReport.ID}
                <input type="hidden" name="ID" value="{$getReport.ID}" />
                <button type="submit" class="btn btn-success"><i class="fa fa-check-circle-o"></i> Update</button>
                <a href="{$index_file}?task=ggfm0030&amp;next={$smarty.get.next|escape}" class="btn btn-danger" style="color: white;"><i class="fa fa-close"></i> Back</a>
              {else}
                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> Save</button>
                <a href="{$index_file}?task=ggfm0030&amp;next={$smarty.get.next|escape}" class="btn btn-danger" style="color: white;"><i class="fa fa-close"></i> Back</a>
              {/if}
              </div>
          </form>
        </div><!--Close col-md-12-->
      </div>
    </div>
  </div>
</div>
<div style="font-size: 13px;text-align:right;" class="text-muted">{$smarty.template}</div>
</div>
{/block}
{block name="javascript"}
<script>

$(function() {
  $('.datepicker').datepicker({
    format: 'yyyymmdd',
    language: 'ja',
    autoclose: true,
    todayBtn: true,
    todayHighlight: true,
    minDate: 0
  });
});

</script>
{/block}

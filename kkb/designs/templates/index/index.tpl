{extends file="index/layout.tpl"}
{block name="main"}
<div class="panel panel-primary margin-top">
  <div class="panel-heading hd-center">
    家計簿　メニュー
  </div>
</div>
<div class="row">
  <div class="col-md-4">
    <div class="panel panel-info">
      <div class="panel-heading hd-center">
        <h3 class="panel-title">＜メニュー＞</h3>
      </div>
      <div class="btn-group-vertical btn-block">
        <a type="button" href="{$index_file}?task=kkb0010" class="btn btn-default btn-image btn-border">入出金管理</a>
      </div>
    </div>
  </div>
</div>
{/block}

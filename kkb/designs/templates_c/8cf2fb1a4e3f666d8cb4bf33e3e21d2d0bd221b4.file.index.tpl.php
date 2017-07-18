<?php /* Smarty version Smarty-3.1.14, created on 2017-07-16 09:24:02
         compiled from "designs/templates/index/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1125085221590ac86494f8d7-28103949%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8cf2fb1a4e3f666d8cb4bf33e3e21d2d0bd221b4' => 
    array (
      0 => 'designs/templates/index/index.tpl',
      1 => 1500164639,
      2 => 'file',
    ),
    '50c07b1ef1481846f89fb578a0f18881596a5616' => 
    array (
      0 => 'designs/templates/index/layout.tpl',
      1 => 1500164417,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1125085221590ac86494f8d7-28103949',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.14',
  'unifunc' => 'content_590ac864a01c31_60897287',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_590ac864a01c31_60897287')) {function content_590ac864a01c31_60897287($_smarty_tpl) {?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content=""/>
<meta name="keywords" content="Port fee system"/>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="icon" type="image/ico" href="img/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.min.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.appendGrid-1.6.0.css" >
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
<!-- <link rel="stylesheet" type="text/css" href="/css/bootstrap.css"> -->
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<!--  search select -->
<link rel="stylesheet" type="text/css" href="css/select2.min.css" />
<!-- <link rel="stylesheet" type="text/css" href="/css/select2.css" /> -->
<link rel="stylesheet" href="css/style.css" type="text/css"/>
<link rel="stylesheet" href="css/senghak_menu.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="css/bootstrap-datepicker.min.css" />

<title>家計簿システム</title>
</head>
<body>
	<?php echo $_smarty_tpl->getSubTemplate ("index/menu.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	<div style="margin-bottom: 40px"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				
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
        <a type="button" href="<?php echo $_smarty_tpl->tpl_vars['index_file']->value;?>
?task=kkb0010" class="btn btn-default btn-image btn-border">入出金管理</a>
      </div>
    </div>
  </div>
</div>

			</div>
			<?php echo $_smarty_tpl->getSubTemplate ("common/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

		</div>
	</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.appendGrid-1.6.0.js"></script>
<script src="js/moment-with-locales.js"></script>
<!-- search select -->
<script src="js/select2.min.js"></script>
<script src="js/bootstrap-datepicker.min.js"></script>
<script src="js/bootstrap-datepicker.ja.min.js"></script>

<script src="js/commonjs.js"></script>



</body>
</html>
<?php }} ?>
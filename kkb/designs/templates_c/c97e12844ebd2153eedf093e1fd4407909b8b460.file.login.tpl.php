<?php /* Smarty version Smarty-3.1.14, created on 2017-05-04 15:21:15
         compiled from "designs/templates/index/login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2113918982590ac85b039af4-83035268%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c97e12844ebd2153eedf093e1fd4407909b8b460' => 
    array (
      0 => 'designs/templates/index/login.tpl',
      1 => 1490084215,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2113918982590ac85b039af4-83035268',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'chivey_index_file' => 0,
    'error' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.14',
  'unifunc' => 'content_590ac85b18c707_63741566',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_590ac85b18c707_63741566')) {function content_590ac85b18c707_63741566($_smarty_tpl) {?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content=""/>
  <meta name="keywords" content="KKB SYSTEM"/>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
  <link href="css/admin_login.css" rel="stylesheet">
  <title>KKB SYSTEM </title>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="center">
        <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3" style="padding-top: 66px;}">
          <div class="panel panel-success">
            <div class="panel-heading"><h4 class="panel-title text-center">家計簿</h4></div>
            <div class="panel-body">
              <form action="<?php echo $_smarty_tpl->tpl_vars['chivey_index_file']->value;?>
?task=login" id="registration-form"  method="post">
                <div class="form-group">
                  <label for="id">ユーザID<span style="color:red">* <?php if ($_smarty_tpl->tpl_vars['error']->value['id']==1){?>入力してください。<?php }elseif($_smarty_tpl->tpl_vars['error']->value['wrong']){?>ユーザID、パスワードが正しくありません。<?php }?></span></label>
                  <input type="text" class="form-control" name="id" id="id" value="<?php echo htmlspecialchars($_SESSION['index']['id'], ENT_QUOTES, 'UTF-8', true);?>
" placeholder="User ID">
                </div>
                <div class="form-group">
                  <label class="control-label" for="name">パスワード<span style="color:red">* <?php if ($_smarty_tpl->tpl_vars['error']->value['password']==1){?>入力してください。<?php }?></span></label>
                  <input type="password" class="form-control" name="password"  placeholder="Password">
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-success btn-md"><i class="fa fa-sign-in"></i> ログイン</button>
                </div>
              </form>
            </div>
          </div>
        	<div class="col-md-12">
        		
        			<center><span class="text-muted">© 2017 KKB System.</span></center>
        		
        	</div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.js"></script>
<!-- <script src="/js/login.js"></script> -->
<script>
		addEventListener('load', prettyPrint, false);
		$(document).ready(function(){
		$('pre').addClass('prettyprint linenums');
			});
</script>
</body>
</html>
<?php }} ?>
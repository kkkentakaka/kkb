<?php /* Smarty version Smarty-3.1.14, created on 2017-07-16 09:22:59
         compiled from "designs/templates/index/menu.tpl" */ ?>
<?php /*%%SmartyHeaderCode:520470548596ab1e394dda1-57725144%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b5990764c9a7540417693c2bdd38b9c6ca7118cf' => 
    array (
      0 => 'designs/templates/index/menu.tpl',
      1 => 1500164568,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '520470548596ab1e394dda1-57725144',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'index_file' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.14',
  'unifunc' => 'content_596ab1e398e237_49571720',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_596ab1e398e237_49571720')) {function content_596ab1e398e237_49571720($_smarty_tpl) {?><!-- Navbar-->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="index.php"><i class="glyphicon glyphicon-home"> <span>ホーム</span></i><span class="sr-only">(Current)</span></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<?php echo $_smarty_tpl->tpl_vars['index_file']->value;?>
?task=logout"><span class="glyphicon glyphicon-log-out"></span> ログアウト</a></li>
      </ul>
    </div>
  </div>
</nav>
<br/>
<?php }} ?>
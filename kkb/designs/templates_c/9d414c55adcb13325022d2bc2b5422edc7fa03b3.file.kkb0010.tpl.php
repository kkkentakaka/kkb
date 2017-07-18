<?php /* Smarty version Smarty-3.1.14, created on 2017-07-16 09:24:34
         compiled from "designs/templates/index/kkb0010.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2085851740596ab224178e99-91557482%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9d414c55adcb13325022d2bc2b5422edc7fa03b3' => 
    array (
      0 => 'designs/templates/index/kkb0010.tpl',
      1 => 1500164670,
      2 => 'file',
    ),
    '50c07b1ef1481846f89fb578a0f18881596a5616' => 
    array (
      0 => 'designs/templates/index/layout.tpl',
      1 => 1500164417,
      2 => 'file',
    ),
    '9a0df868eb4f1e2d86c36c71d5bbdde3452da721' => 
    array (
      0 => 'designs/templates/common/paginate.tpl',
      1 => 1465984168,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2085851740596ab224178e99-91557482',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.14',
  'unifunc' => 'content_596ab224385f49_63843784',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_596ab224385f49_63843784')) {function content_596ab224385f49_63843784($_smarty_tpl) {?><!DOCTYPE html>
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
				
<div class="row" style="padding: 10px 12px;">
  <div class="panel panel-info">
    <div class="panel-heading"><h4 class="panel-title">出入金一覧</h4></div>
    <div class="panel-body">
      <div class="panel panel-default">
        <div class="panel-body">
          <form class="form-inline" role="form" action="<?php echo $_smarty_tpl->tpl_vars['index_file']->value;?>
?task=kkb0010" method="GET" style="padding: 1px 0px 12px 1px;">
            <div class="btn-group">
              <a href="<?php echo $_smarty_tpl->tpl_vars['index_file']->value;?>
?task=kkb0010&amp;action=kkb0010_form" class="btn btn-primary" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample">
                <i class="fa fa-plus-square-o"></i> 追加
              </a>
              <a href="" id="ID" class="btn btn-success" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample" disabled>
                <i class="fa fa-edit"></i> 修正
              </a>
              <button class="btn btn-danger collapsed" id="passmodal" type="button" data-toggle="modal" data-target="" aria-expanded="false" aria-controls="collapseExample" disabled>
                <i class="fa fa-trash-o"></i> 削除
              </button>
            </div>
            <div class="input-group" style="float: right;">
              <input type="text" class="form-control" name="kwd" value="<?php echo $_GET['kwd'];?>
">
              <span class="input-group-btn">
                <button class="btn btn-info" type="submit"><i class="fa fa-search"></i> 検索</button>
              </span>
            </div>
          </form>
          <div class="table-responsive">
            <table class="table table-hover">
              <thead>
                <tr bgcolor="#eeeeee">
                  <th></th>
                  <th>ID</th>
                  <th>日付</th>
                  <th>支出</th>
                  <th>収入</th>
                  <th>差</th>
                  <th>挿入日</th>
                  <th>更新日</th>
                </tr>
              </thead>
              <?php if (count($_smarty_tpl->tpl_vars['listkkb0010']->value)>0){?>
              <tbody>
              <?php  $_smarty_tpl->tpl_vars['s'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['s']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['listkkb0010']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['s']->key => $_smarty_tpl->tpl_vars['s']->value){
$_smarty_tpl->tpl_vars['s']->_loop = true;
?>
                <tr>
                  <td>
                    <label><input type="checkbox" name="checkbox" class="onecheck" value="<?php echo $_smarty_tpl->tpl_vars['s']->value['ID'];?>
"></label>
                    <input type="hidden" class="comhidden" value="0" id="com<?php echo $_smarty_tpl->tpl_vars['s']->value['ID'];?>
"/>
                    <div class="modal fade" id="<?php echo $_smarty_tpl->tpl_vars['s']->value['ID'];?>
" role="dialog">
                      <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="panel panel-primary modal-content">
                          <div class="panel-heading modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="panel-title modal-title"><i class="fa fa-trash-o"></i>削除</h4>
                          </div>
                          <div class="modal-body">
                            <p>削除しますか？</p>
                          </div>
                          <div class="modal-footer">
                            <a href="<?php echo $_smarty_tpl->tpl_vars['index_file']->value;?>
?task=kkb0010&amp;action=delete&amp;ID=<?php echo $_smarty_tpl->tpl_vars['s']->value['ID'];?>
&amp;next=<?php echo htmlspecialchars($_GET['next'], ENT_QUOTES, 'UTF-8', true);?>
" class="btn btn-danger btn-md"><i class="fa fa-trash-o">削除</i></a>
                            <button type="button" class="btn btn-primary collapsed" data-dismiss="modal"><i class="fa fa-remove">キャンセル</i></button>
                          </div>
                        </div>
                      </div>
                    </div>
                  <!-- Modal -->
                  </td>
                  <td><?php echo $_smarty_tpl->tpl_vars['s']->value['ID'];?>
</td>
                  <td><?php echo $_smarty_tpl->tpl_vars['s']->value['DATE'];?>
</td>
                  <td><?php echo $_smarty_tpl->tpl_vars['s']->value['OUTGO'];?>
</td>
                  <td><?php echo $_smarty_tpl->tpl_vars['s']->value['INCOME'];?>
</td>
                  <td><?php echo $_smarty_tpl->tpl_vars['s']->value['DIFF'];?>
</td>
                  <td><?php echo $_smarty_tpl->tpl_vars['s']->value['INSINF'];?>
</td>
                  <td><?php echo $_smarty_tpl->tpl_vars['s']->value['UPDINF'];?>
</td>
                </tr>
              </tbody>
              <?php } ?>
              <?php }else{ ?>
              <tbody>
                <tr>
                  <td class="text-center" colspan="8">
                    <h4>データがありません。</h4>
                  </td>
                </tr>
              </tbody>
              <?php }?>
            </table>
          </div><!--table-responsive  -->
            <div style="text-align:center;"><?php /*  Call merged included template "common/paginate.tpl" */
$_tpl_stack[] = $_smarty_tpl;
 $_smarty_tpl = $_smarty_tpl->setupInlineSubTemplate("common/paginate.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0, '2085851740596ab224178e99-91557482');
content_596ab2421f4258_34558513($_smarty_tpl);
$_smarty_tpl = array_pop($_tpl_stack); /*  End of included template "common/paginate.tpl" */?></div>
        </div><!--panel panel-body-->
      </div><!--panel panel-default-->
    </div><!--end panel-body-->
  </div><!--panel panel-primary-->

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

<script>
$('[data-toggle="popover"]').popover();
$(function () {
   $('[data-toggle1="tooltip"]').tooltip()
 });
 </script>
<script>

$('.onecheck').click(function() {
  $('.onecheck').not(this).prop('checked', false);
  if($('.onecheck:checked').length > 0){
    disableBtn($('.onecheck:checked:first').val(), false);
  }
  else
  {
    disableBtn(null, true);
  }
});

if($('.onecheck:checked').length > 0){
  disableBtn($('.onecheck:checked:first').val(), false);
}
else
{
  disableBtn(null, true);
}
//check disable and anable
function disableBtn(id, disable_flg)
{
  $("#passmodal").prop("disabled", disable_flg);
  $('#ID').attr("disabled", disable_flg);
  $('#ID').unbind('click');
  if(disable_flg){
    $('#ID').bind('click', function(e){
      e.preventDefault();
    });
  }
  else
  {
    $("#ID").attr("href","index.php?task=kkb0010&action=kkb0010_form&next=<?php echo htmlspecialchars($_GET['next'], ENT_QUOTES, 'UTF-8', true);?>
&ID="+id);
    $('#ID').bind('click');
    $("#passmodal").attr("data-target", "#"+id);
  }
}
</script>


</body>
</html>
<?php }} ?><?php /* Smarty version Smarty-3.1.14, created on 2017-07-16 09:24:34
         compiled from "designs/templates/common/paginate.tpl" */ ?>
<?php if ($_valid && !is_callable('content_596ab2421f4258_34558513')) {function content_596ab2421f4258_34558513($_smarty_tpl) {?><?php if (!is_callable('smarty_function_paginate_prev')) include '/Applications/MAMP/htdocs/kkb/external_libs/Smarty-3.1.14/libs/plugins/function.paginate_prev.php';
if (!is_callable('smarty_function_paginate_first')) include '/Applications/MAMP/htdocs/kkb/external_libs/Smarty-3.1.14/libs/plugins/function.paginate_first.php';
if (!is_callable('smarty_function_paginate_middle')) include '/Applications/MAMP/htdocs/kkb/external_libs/Smarty-3.1.14/libs/plugins/function.paginate_middle.php';
if (!is_callable('smarty_function_paginate_last')) include '/Applications/MAMP/htdocs/kkb/external_libs/Smarty-3.1.14/libs/plugins/function.paginate_last.php';
if (!is_callable('smarty_function_paginate_next')) include '/Applications/MAMP/htdocs/kkb/external_libs/Smarty-3.1.14/libs/plugins/function.paginate_next.php';
?><font size="3"><b><?php echo smarty_function_paginate_prev(array('text'=>"前へ"),$_smarty_tpl);?>
</b></font>&nbsp;

<?php if ($_smarty_tpl->tpl_vars['paginate']->value['total']>$_smarty_tpl->tpl_vars['paginate']->value['limit']){?>
	<?php echo smarty_function_paginate_first(array('text'=>"最初のページ"),$_smarty_tpl);?>
&nbsp;
<?php }?>
 <?php if ($_smarty_tpl->tpl_vars['paginate']->value['total']>$_smarty_tpl->tpl_vars['paginate']->value['limit']){?>
 	<?php echo smarty_function_paginate_middle(array('page_limit'=>"15",'prefix'=>"&nbsp;",'suffix'=>"&nbsp;",'format'=>"page"),$_smarty_tpl);?>

 <?php }?>

<?php if ($_smarty_tpl->tpl_vars['paginate']->value['total']>$_smarty_tpl->tpl_vars['paginate']->value['limit']){?>
	&nbsp;<?php echo smarty_function_paginate_last(array('text'=>"最後のページ"),$_smarty_tpl);?>

<?php }?>
&nbsp;&nbsp;<font size="3"><b><?php echo smarty_function_paginate_next(array('text'=>"次へ"),$_smarty_tpl);?>
</b></font>&nbsp;
<?php if ($_smarty_tpl->tpl_vars['paginate']->value['total']>$_smarty_tpl->tpl_vars['paginate']->value['limit']){?>
<!-- [<?php echo $_smarty_tpl->tpl_vars['paginate']->value['total'];?>
/<?php echo $_smarty_tpl->tpl_vars['paginate']->value['page_total'];?>
 ページ] -->
<?php $_smarty_tpl->tpl_vars['page_num'] = new Smarty_variable($_GET['next']/10, null, 0);?>
[<?php if ($_GET['next']==''||$_GET['next']==1){?>1<?php }else{ ?><?php echo ceil($_smarty_tpl->tpl_vars['page_num']->value);?>
<?php }?>/<?php echo $_smarty_tpl->tpl_vars['paginate']->value['page_total'];?>
 ページ]
<?php }?>
<?php }} ?>
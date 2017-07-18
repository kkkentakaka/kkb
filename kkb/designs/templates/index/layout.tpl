<!DOCTYPE html>
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
	{include file="index/menu.tpl" }
	<div style="margin-bottom: 40px"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				{block name="main"}
				{/block}
			</div>
			{include file="common/footer.tpl"}
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
{block name="javascript"}
{/block}

</body>
</html>

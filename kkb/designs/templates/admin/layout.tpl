<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content=""/>
<meta name="keywords" content="Pclaw-mar-associates"/>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="icon" type="image/ico" href="img/favicon.ico">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css" type="text/css"/>

<title>PORT-ADMIN</title>
</head>
<body>
{if $mode eq "admin" }{include file="admin/menu.tpl" }{/if}
<div class="container">
	<div class="row">
		<div class="col-md-12">
			{block name="main"}
			{/block}
		</div>
	</div>
	{include file="common/footer.tpl"}
</div>
<script src="js/jquery.min.js"></script>
<script src="js/moment-with-locales.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/commonjs.js"></script>
<!-- <script src="https://raw.githubusercontent.com/digitalBush/jquery.maskedinput/1.4.1/dist/jquery.maskedinput.js"></script> -->

{block name="javascript"}
{/block}

</body>
</html>

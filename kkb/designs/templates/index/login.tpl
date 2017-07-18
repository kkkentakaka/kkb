<!DOCTYPE html>
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
  <title>KKB SYSTEM {block name="title"}{/block}</title>
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
              <form action="{$chivey_index_file}?task=login" id="registration-form"  method="post">
                <div class="form-group">
                  <label for="id">ユーザID<span style="color:red">* {if $error.id eq 1}入力してください。{elseif $error.wrong}ユーザID、パスワードが正しくありません。{/if}</span></label>
                  <input type="text" class="form-control" name="id" id="id" value="{$smarty.session.index.id|escape}" placeholder="User ID">
                </div>
                <div class="form-group">
                  <label class="control-label" for="name">パスワード<span style="color:red">* {if $error.password eq 1}入力してください。{/if}</span></label>
                  <input type="password" class="form-control" name="password"  placeholder="Password">
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-success btn-md"><i class="fa fa-sign-in"></i> ログイン</button>
                </div>
              </form>
            </div>
          </div>
        	<div class="col-md-12">
        		{block name="footer"}
        			<center><span class="text-muted">© 2017 KKB System.</span></center>
        		{/block}
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

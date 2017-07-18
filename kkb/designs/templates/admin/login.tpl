<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content=""/>
  <meta name="keywords" content="Port"/>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
  <link href="css/admin_login.css" rel="stylesheet">
  <title>PORT FEE SYSTEM {block name="title"}{/block}</title>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="center">
        <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3" style="padding-top: 66px;}">
          <ul class="breadcrumb">
            <li><a href="{$admin_file}"><span class="label label-success">PORT</span></a></li>
            <li class="active">admin</li>
          </ul>
          <div class="panel panel-success">
            <div class="panel-heading"><h4 class="panel-title text-center"> Admin Login Form</h4></div>
            <div class="panel-body">
              <form action="{$admin_file}?task=login" id="registration-form"  method="post">
                <div class="form-group">
                  <label for="username">Name:</label>
                  <input type="text" class="form-control" name="username" id="username" placeholder="Username">
                </div>
                <div class="form-group">
                  <label  for="name">Password:</label>
                  <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                </div>
                <div class="form-group">
                  <button type="submit" class="btn btn-success btn-large"><i class="fa fa-sign-in"></i> Sign In</button>
                </div>
              </form>
            </div>
          </div>
        	<div class="col-md-12">
        		{block name="footer"}
        			<span class="text-muted">© 2016 Port Fee System.</span>
        		{/block}
        	</div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- <script src="/js/jquery-1.7.1.min.js"></script> -->
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

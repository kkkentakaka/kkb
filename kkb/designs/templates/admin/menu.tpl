<!-- Navbar-->
<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
		         	<span class="icon-bar"></span>
		         	<span class="icon-bar"></span>
		         	<span class="icon-bar"></span>
	         	</button>
         		<a class="navbar-brand" href="admin.php"><span class="label label-success">PORT</a>
	  		</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li><a href="admin.php"><i class="glyphicon glyphicon-home"></i> Home<span class="sr-only">(Current)</span></a></li>
            </ul>
		  	<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog"></i>
          Setting <span class="caret"></span></a>
          <ul class="dropdown-menu">
						<li><a href="{$admin_file_name}?task=KW0090"><i class="fa fa-file"></i> KW0090</a></li>
						<li><a href="{$admin_file_name}?task=KWCONFIG"><i class="fa fa-file"></i> KWCONFIG</a></li>
						<li><a href="{$admin_file_name}?task=KW0990"><i class="fa fa-file"></i> KW0990</a></li>
          </ul>
        </li>
			    <li><a href="admin.php?task=logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		  	</ul>
		</div>
	</div>
</nav>
<br />

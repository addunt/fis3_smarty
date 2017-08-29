<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default">
  <script type="text/javascript">
    try{ace.settings.check('navbar' , 'fixed')}catch(e){}
  </script>

  <div class="navbar-container" id="navbar-container">
    <!-- #section:basics/sidebar.mobile.toggle -->
    <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
      <span class="sr-only">Toggle sidebar</span>

      <span class="icon-bar"></span>

      <span class="icon-bar"></span>

      <span class="icon-bar"></span>
    </button>

    <!-- /section:basics/sidebar.mobile.toggle -->
    <div class="navbar-header pull-left">
      <!-- #section:basics/navbar.layout.brand -->
      <a href="#" class="navbar-brand">
        <small>
          浑水广告联盟
        </small>
      </a>

      <!-- /section:basics/navbar.layout.brand -->

      <!-- #section:basics/navbar.toggle -->

      <!-- /section:basics/navbar.toggle -->
    </div>

    <!-- #section:basics/navbar.dropdown -->
    <div class="navbar-buttons navbar-header pull-right" role="navigation">
      <ul class="nav ace-nav">
        <li class="light-blue">
          <a data-toggle="dropdown" href="#" class="dropdown-toggle">
            <img class="nav-user-photo" src="<{$user_info.avatar}>" alt="<{$user_info.name}>" />
								<span class="user-info">
									<small>你好,</small>
									<{$user_info.name}>
								</span>

            <i class="ace-icon fa fa-caret-down"></i>
          </a>

          <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
            <li>
              <a href="<{$base_url}>/personalCenter">
                <i class="ace-icon fa fa-user"></i>
                个人资料
              </a>
            </li>

            <li>

              <a href="<{$base_url}>/personalCenter?tab=modifyPsw">

                <i class="ace-icon fa fa-key"></i>
                修改密码
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="<{$base_url}>/login">
                <i class="ace-icon fa fa-power-off"></i>
                安全退出
              </a>
            </li>
          </ul>
        </li>

        <!-- /section:basics/navbar.user_menu -->
      </ul>
    </div>

    <!-- /section:basics/navbar.dropdown -->
  </div><!-- /.navbar-container -->
</div>

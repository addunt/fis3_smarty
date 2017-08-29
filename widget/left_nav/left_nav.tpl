<!-- #section:basics/sidebar -->
  <div id="sidebar" class="sidebar responsive">
    <script type="text/javascript">
      try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
    </script>

    <ul class="nav nav-list" style="text-align: center">
      <li <{if $data.index == 1}>class="active"<{/if}>>
        <a href="<{$base_url}>/index">
          <i class="fa fa-bullhorn"></i>
          <span class="menu-text"> 通知公告 </span>
        </a>
      </li>

      <li <{if $data.index == 2}>class="active"<{/if}>>
        <a href="<{$base_url}>/data">
          <i class="fa fa-bar-chart-o"></i>
          <span class="menu-text"> 数据统计 </span>
        </a>
      </li>

      <li <{if $data.index == 3}>class="active"<{/if}>>
        <a href="<{$base_url}>/orderManage" class="dropdown-toggle">
          <i class="fa fa-pencil-square-o"></i>
          <span class="menu-text"> 订单管理 </span>
        </a>
      </li>

      <li <{if $data.index == 4}>class="active"<{/if}>>
        <a href="<{$base_url}>/novelLists" class="dropdown-toggle">
          <i class="fa fa-book"></i>
          <span class="menu-text"> 小说列表 </span>
        </a>
      </li>

      <li <{if $data.index == 5}>class="active"<{/if}>>
        <a href="<{$base_url}>/referralLinks" class="dropdown-toggle">
          <i class="fa fa-glass"></i>
          <span class="menu-text"> 推广链接 </span>
        </a>
      </li>

      <li <{if $data.index == 6}>class="active"<{/if}>>
        <a href="<{$base_url}>/bills">
          <i class="fa fa-bookmark-o"></i>
          <span class="menu-text"> 我的结算单 </span>
        </a>
      </li>
      <li <{if $data.index == 7}>class="active"<{/if}>>
        <a href="<{$base_url}>/personalCenter" class="dropdown-toggle">
          <i class="fa fa-users"></i>
          <span class="menu-text"> 个人中心 </span>
        </a>
      </li>

      <li <{if $data.index == 8}>class="active"<{/if}>>
        <a href="<{$base_url}>/siteSettings" class="dropdown-toggle">
          <i class="fa fa-cog"></i>
          <span class="menu-text"> 网站设置 </span>
        </a>
      </li>
    </ul><!-- /.nav-list -->

    <!-- #section:basics/sidebar.layout.minimize -->
    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
      <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <!-- /section:basics/sidebar.layout.minimize -->
    <script type="text/javascript">
      try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
    </script>
  </div>

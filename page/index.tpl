<!DOCTYPE html>
<html lang="en">
<head>
  <title><{$page_name}></title>
  <meta name="description" content="蓝鲸传媒,蓝鲸浑水" />
  <{widget name="smarty_demo:widget/header_assets/header_assets.tpl"}>
  <link rel="stylesheet" href="<{$assets_url}>/css/notices.css"/>
</head>

<body class="no-skin">
<{widget name="smarty_demo:widget/header_bar/header_bar.tpl"}>
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
  <script type="text/javascript">
    try{ace.settings.check('main-container' , 'fixed')}catch(e){}
  </script>

  <{widget name="smarty_demo:widget/left_nav/left_nav.tpl"}>
  
  <!-- /section:basics/sidebar -->
  <div class="main-content">
    <div class="main-content-inner">
      <!-- #section:basics/content.breadcrumbs -->
      
      <{widget name="smarty_demo:widget/position/position.tpl"}>

      <!-- /section:basics/content.breadcrumbs -->
      <div class="page-content">
        <!-- /section:settings.box -->
        <div class="row">
          <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <ul class="notices clearfix">
              <!--<li class="notice">-->
                <!--<span class="time">2017-08-16 |</span>-->
                <!--<a href="#" class="title">重要！再次提醒各位不要去做太过的标题！</a>-->
                <!--<span class="NEW">NEW</span>-->
              <!--</li>-->
            </ul>
            <{widget name="smarty_demo:widget/pages/pages.tpl" page_total=$data.page_total page=$data.page page_size=$data.page_size total=$data.total url=$base_url + '/index?page=' }>
            <!--通知公告模态框-->
            <div id="noticeMsg" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"></h4>
                  </div>
                  <div class="modal-body">

                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">我知道了</button>
                  </div>
                </div>
              </div>
            </div>
            <!--通知公告模态框-->
            <!-- PAGE CONTENT ENDS -->
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.page-content -->
    </div>
  </div><!-- /.main-content -->

  <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
  </a>
</div><!-- /.main-container -->

<{widget name="smarty_demo:widget/footer_assets/footer_assets.tpl"}>
<script>
  var data = <{json_encode($data)}>;
</script>
<script src="<{$assets_url}>/js/notices.js"></script>
</body>
</html>

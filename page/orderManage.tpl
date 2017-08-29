<!DOCTYPE html>
<html lang="en">
<head>
  <title><{$page_name}></title>
  <meta name="description" content="蓝鲸传媒,蓝鲸浑水"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
  <{widget name="smarty_demo:widget/header_assets/header_assets.tpl"}>
  <link rel="stylesheet" href="<{$assets_url}>/assets/css/less/tables.less"/>
  <link rel="stylesheet" href="<{$assets_url}>/assets/css/responsive.dataTables.scss"/>
  <link rel="stylesheet" href="<{$assets_url}>/css/orderManage.css"/>
  <link rel="stylesheet" href="<{$assets_url}>/assets/css/bootstrap-datetimepicker.css"/>

</head>

<body class="no-skin">
<{widget name="smarty_demo:widget/header_bar/header_bar.tpl"}>
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
  <script type="text/javascript">
    try {
      ace.settings.check('main-container', 'fixed')
    } catch (e) {
    }
  </script>
  <{widget name="smarty_demo:widget/left_nav/left_nav.tpl"}>
  <!-- /section:basics/sidebar -->
  <div class="main-content">
    <div class="main-content-inner">
      
      <{widget name="smarty_demo:widget/position/position.tpl"}>

      <!-- /section:basics/content.breadcrumbs -->
      <div class="page-content">
        <!-- /section:settings.box -->
        <div class="row">
          <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <form style="margin-bottom:10px;" class="form-inline">
              <div class="form-group">
                <div class='input-group date' id='from-date-picker'>
                  <input type='text' class="form-control" value="" placeholder="开始日期"/>
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
            </span>
                </div>
              </div>
              <div class="form-group">
                <div class='input-group date' id='to-date-picker'>
                  <input type='text' class="form-control" value="" placeholder="结束日期"/>
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
            </span>
                </div>
              </div>
              <button type="submit" class="btn btn-primary" id="btn-search">查询</button>

        <span class="text-muted" style="display: inline-block; vertical-align: bottom; margin-left: 10px">
        支付金额: &yen;1,490.00,
        支付笔数: 41    </span>
              <button type="button" class="btn btn-primary pull-right" id="btn-export"><i class="fa fa-download"></i>
                导出已支付订单
              </button>
            </form>
            <form class="form-inline search-form">
              <div class="input-group pull-right">
                <input type="text" id="orderTable_filter" placeholder="商户单号, 微信交易号">
            <span class="input-group-btn">
                <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
            </span>
              </div>
            </form>
            <table class="text-center table table-striped table-bordered table-hover responsive" width="100%" id="orderTable">
              <thead>
              <tr>
                <td>商户单号</td>
                <td>订单类型</td>
                <td>用户</td>
                <td>总额</td>
                <td>支付方式</td>
                <td id="orderStatus">
                  订单状态 <i class="arrow fa fa-angle-down"></i>

                  <div class="selectBox clearfix">
                    <label><input name="orderStatus" type="checkbox" value="1"/>已支付 </label>
                    <label><input name="orderStatus" type="checkbox" value="2"/>未支付 </label>
                    <label><input name="orderStatus" type="checkbox" value="3"/>已取消 </label>
                    <label><input name="orderStatus" type="checkbox" value="4"/>已关闭 </label>
                  </div>
                </td>
                <td id="novelStation">
                  小说站 <i class="arrow fa fa-angle-down"></i>

                  <div class="selectBox clearfix">
                    <label><input name="novelStation" type="checkbox" value="1"/>万读 </label>
                    <label><input name="novelStation" type="checkbox" value="2"/>天天搜书 </label>
                  </div>
                </td>
                <td>创建日期</td>
              </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
            <{widget name="smarty_demo:widget/pages/pages.tpl" page_total=$data.page_total page=$data.page page_size=$data.page_size total=$data.total url=$base_url + '/index?page=' }>
            <!--PAGE CONTENT ENDS -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.page-content -->
    </div>
  </div>
  <!-- /.main-content -->

  <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
  </a>
</div>
<!-- /.main-container -->
<{widget name="smarty_demo:widget/footer_assets/footer_assets.tpl"}>

<script src="<{$assets_url}>/assets/js/date-time/moment.js"></script>
<script src="<{$assets_url}>/assets/js/date-time/bootstrap-datetimepicker.js"></script>
<script src="<{$assets_url}>/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="<{$assets_url}>/assets/js/dataTables/dataTables.responsive.js"></script>
<script>
var data = <{json_encode($data.data)}>;
</script>
<script src="<{$assets_url}>/js/orderManage.js"></script>
</body>
</html>

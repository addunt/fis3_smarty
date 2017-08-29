<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta charset="utf-8" />
  <title><{$page_name}></title>
  <meta name="description" content="蓝鲸传媒,蓝鲸浑水" />
  <{widget name="smarty_demo:widget/header_assets/header_assets.tpl"}>

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

      <{widget name="smarty_demo:widget/position/position.tpl"}>

      <!-- /section:basics/content.breadcrumbs -->
      <div class="page-content">
        <!-- /section:settings.box -->
        <div class="row">
          <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
              <div class="tabbable">
                <ul class="nav nav-tabs" id="myTab">
                  <li class="active">
                    <a data-toggle="tab" href="#home">
                      <i class="green icon-home bigger-110"></i>
                      订单统计
                    </a>
                  </li>

                  <li>
                    <a data-toggle="tab" href="#profile">
                      用户统计
                    </a>
                  </li>
                </ul>

                <div class="tab-content">
                  <div id="home" class="tab-pane in active">
                    <div class="row" id="order-summary-stats-panel">
                      <div class="col-md-3">
                          <div class="well">
                              <b>
                                  今日充值 <i class="fa fa-question-circle" title="非实时, 延迟 1 分钟左右"></i>
                                  <span style="font-weight:normal;font-size:13px;color:#090" class="pull-right">
                                      <span data-bind="text: refresh_seconds_left"></span> 秒后刷新
                                  </span>
                              </b>
                              <div class="text-primary" style="font-size:32px;margin:5px 0">
                                  &yen;<span data-bind="price: stats_today.paid_amount"></span>
                              </div>
                              <div class="container-fluid">
                                  <div class="row">
                                      <div class="col-sm-6" style="padding:0">
                                          <strong>普通充值</strong>
                                          <div><b class="text-primary" data-bind="price: stats_today.welth_order_paid_amount"></b></div>
                                          <div>已支付: <b class="text-warning" data-bind="text: stats_today.welth_order_paid_count"></b> 笔</div>
                                          <div>未支付: <b class="text-warning" data-bind="text: stats_today.welth_order_unpaid_count"></b> 笔</div>
                                          <div>
                                              完成率: <b class="text-warning"><span data-bind="text: Math.round(stats_today.welth_order_completion_rate() * 100)"></span> %</b>
                                          </div>
                                      </div>
                                      <div class="col-sm-6" style="padding:0">
                                          <strong>年费VIP会员</strong>
                                          <div><b class="text-primary" data-bind="price: stats_today.vip_order_paid_amount"></b></div>
                                          <div>已支付: <b class="text-warning" data-bind="text: stats_today.vip_order_paid_count"></b> 笔</div>
                                          <div>未支付: <b class="text-warning" data-bind="text: stats_today.vip_order_unpaid_count"></b> 笔</div>
                                          <div>
                                              完成率: <b class="text-warning"><span data-bind="text: Math.round(stats_today.vip_order_completion_rate() * 100)"></span> %</b>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>

                      <div class="col-md-3">
                          <div class="well">
                              <b>昨日充值</b>
                              <div class="text-primary" style="font-size:32px;margin:5px 0">
                                  &yen;<span data-bind="price: stats_yesterday.paid_amount"></span>
                              </div>
                              <div class="container-fluid">
                                  <div class="row">
                                      <div class="col-sm-6" style="padding:0">
                                          <strong>普通充值</strong>
                                          <div><b class="text-primary" data-bind="price: stats_yesterday.welth_order_paid_amount"></b></div>
                                          <div>已支付: <b class="text-warning" data-bind="text: stats_yesterday.welth_order_paid_count"></b> 笔</div>
                                          <div>未支付: <b class="text-warning" data-bind="text: stats_yesterday.welth_order_unpaid_count"></b> 笔</div>
                                          <div>
                                              完成率: <b class="text-warning"><span data-bind="text: Math.round(stats_yesterday.welth_order_completion_rate() * 100)"></span> %</b>
                                          </div>
                                      </div>
                                      <div class="col-sm-6" style="padding:0">
                                          <strong>年费VIP会员</strong>
                                          <div><b class="text-primary" data-bind="price: stats_yesterday.vip_order_paid_amount"></b></div>
                                          <div>已支付: <b class="text-warning" data-bind="text: stats_yesterday.vip_order_paid_count"></b> 笔</div>
                                          <div>未支付: <b class="text-warning" data-bind="text: stats_yesterday.vip_order_unpaid_count"></b> 笔</div>
                                          <div>
                                              完成率: <b class="text-warning"><span data-bind="text: Math.round(stats_yesterday.vip_order_completion_rate() * 100)"></span> %</b>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>

                      <div class="col-md-3">
                          <div class="well">
                              <b>本月充值 (不含当日) <i class="fa fa-question-circle" title="不含当日，非实时，每天凌晨2:30左右更新"></i> </b>
                              <div class="text-primary" style="font-size:32px;margin:5px 0">
                                  &yen;<span data-bind="price: stats_this_month.paid_amount"></span>
                              </div>
                              <div class="container-fluid">
                                  <div class="row">
                                      <div class="col-sm-6" style="padding:0">
                                          <strong>普通充值</strong>
                                          <div><b class="text-primary" data-bind="price: stats_this_month.welth_order_paid_amount"></b></div>
                                          <div>已支付: <b class="text-warning" data-bind="text: stats_this_month.welth_order_paid_count"></b> 笔</div>
                                          <div>未支付: <b class="text-warning" data-bind="text: stats_this_month.welth_order_unpaid_count"></b> 笔</div>
                                          <div>
                                              完成率: <b class="text-warning"><span data-bind="text: Math.round(stats_this_month.welth_order_completion_rate() * 100)"></span> %</b>
                                          </div>
                                      </div>
                                      <div class="col-sm-6" style="padding:0">
                                          <strong>年费VIP会员</strong>
                                          <div><b class="text-primary" data-bind="price: stats_this_month.vip_order_paid_amount"></b></div>
                                          <div>已支付: <b class="text-warning" data-bind="text: stats_this_month.vip_order_paid_count"></b> 笔</div>
                                          <div>未支付: <b class="text-warning" data-bind="text: stats_this_month.vip_order_unpaid_count"></b> 笔</div>
                                          <div>
                                              完成率: <b class="text-warning"><span data-bind="text: Math.round(stats_this_month.vip_order_completion_rate() * 100)"></span> %</b>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="col-md-3">
                          <div class="well">
                              <b>累计充值 (不含当日) <i class="fa fa-question-circle" title="不含当日，非实时，每天凌晨2:30左右更新"></i> </b>
                              <div class="text-primary" style="font-size:32px;margin:5px 0">
                                  &yen;<span data-bind="price: stats_all_time.paid_amount"></span>
                              </div>
                              <div class="container-fluid">
                                  <div class="row">
                                      <div class="col-sm-6" style="padding:0">
                                          <strong>普通充值</strong>
                                          <div><b class="text-primary" data-bind="price: stats_all_time.welth_order_paid_amount"></b></div>
                                          <div>已支付: <b class="text-warning" data-bind="text: stats_all_time.welth_order_paid_count"></b> 笔</div>
                                          <div>未支付: <b class="text-warning" data-bind="text: stats_all_time.welth_order_unpaid_count"></b> 笔</div>
                                          <div>
                                              完成率: <b class="text-warning"><span data-bind="text: Math.round(stats_all_time.welth_order_completion_rate() * 100)"></span> %</b>
                                          </div>
                                      </div>
                                      <div class="col-sm-6" style="padding:0">
                                          <strong>年费VIP会员</strong>
                                          <div><b class="text-primary" data-bind="price: stats_all_time.vip_order_paid_amount"></b></div>
                                          <div>已支付: <b class="text-warning" data-bind="text: stats_all_time.vip_order_paid_count"></b> 笔</div>
                                          <div>未支付: <b class="text-warning" data-bind="text: stats_all_time.vip_order_unpaid_count"></b> 笔</div>
                                          <div>
                                              完成率: <b class="text-warning"><span data-bind="text: Math.round(stats_all_time.vip_order_completion_rate() * 100)"></span> %</b>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                    </div><!-- /.row #order-summary-stats-panel -->
                    <div class="panel panel-default" id="order-daily-stats-panel">
                      <div class="panel-heading">
                          <h3 class="panel-title"><i class="fa fa-calendar"></i> 近30天充值统计</h3>
                      </div>
                      <div class="loading-panel" data-bind="visible: loading">
                          <i class="fa fa-spinner fa-spin"></i>
                      </div>
                      <!-- <table class="table table-bordered table-striped" data-bind="visible: !loading()" style="display: none;"> -->
                      <table class="table table-bordered table-striped" data-bind="visible: !loading()" style="display: none;">
                          <thead>
                              <tr>
                                  <th>日期</th>
                                  <th class="text-right">充值金额</th>
                                  <th class="text-right">普通充值</th>
                                  <th class="text-right">普通充值支付订单数</th>
                                  <th class="text-right">年费VIP会员</th>
                                  <th class="text-right">年费VIP会员支付订单数</th>
                              </tr>
                          </thead>
                          <tbody data-bind="foreach: stats">
                              <tr>
                                  <td><span data-bind="text: date"></span></td>
                                  <td class="text-right">
                                      <b>&yen; <span data-bind="price: paid_amount"></span></b>
                                  </td>
                                  <td class="text-right">
                                      <b>&yen; <span data-bind="price: welth_order_paid_amount"></span></b>
                                      <div class="text-muted" style="font-size:13px;margin-top:5px">
                                          充值人数: <span data-bind="text: welth_order_paid_user_count"></span>,
                                          人均: &yen; <span data-bind="price: welth_order_avg_user_paid_amount"></span>
                                      </div>
                                  </td>
                                  <td class="text-right">
                                      <b><span data-bind="text: welth_order_paid_count"></span> 笔</b>
                                      <div class="text-muted" style="font-size:13px;margin-top:5px">
                                          <span data-bind="text: welth_order_unpaid_count"></span> 笔未支付,
                                          完成率: <span data-bind="text: Math.round(welth_order_completion_rate * 100)"></span> %
                                      </div>
                                  </td>
                                  <td class="text-right">
                                      <b>&yen; <span data-bind="price: vip_order_paid_amount"></span></b>
                                      <div class="text-muted" style="font-size:13px;margin-top:5px">
                                          充值人数: <span data-bind="text: vip_order_paid_user_count"></span>,
                                          人均: &yen; <span data-bind="price: vip_order_avg_user_paid_amount"></span>
                                      </div>
                                  </td>
                                  <td class="text-right">
                                      <b><span data-bind="text: vip_order_paid_count"></span> 笔</b>
                                      <div class="text-muted" style="font-size:13px;margin-top:5px">
                                          <span data-bind="text: vip_order_unpaid_count"></span> 笔未支付,
                                          完成率: <span data-bind="text: Math.round(vip_order_completion_rate * 100)"></span> %
                                      </div>
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                    </div>
                  </div><!-- #home-->

                  <div id="profile" class="tab-pane">
                    <div class="row" id="member-summary-stats-panel">
                      <div class="col-md-3">
                          <div class="well">
                              <b>
                                  今日新增
                                  <span style="font-weight:normal;font-size:13px;color:#090" class="pull-right">
                                      <span data-bind="text: refresh_seconds_left"></span> 秒后刷新
                                  </span>
                              </b>
                              <div class="text-primary" style="font-size:32px;margin:5px 0">
                                  <span data-bind="text: stats_today.new_member_count"></span>
                                  <div style="font-size:13px;" class="text-muted">
                                      <b class="text-warning" data-bind="text: stats_today.male_count"></b> 男性,
                                      <b class="text-warning" data-bind="text: stats_today.female_count"></b> 女性,
                                      <b class="text-warning" title="用户未设置性别或未关注而无法获取性别" data-bind="text: stats_today.new_member_count() - stats_today.male_count() - stats_today.female_count()"></b> 未知
                                  </div>
                              </div>
                              <div>
                                                      <div>
                                          已关注:
                                          <b class="text-warning">
                                              <span data-bind="text: stats_today.subscribed_count"></span>
                                              (<span data-bind="text: Math.round(stats_today.subscribe_rate() * 100)"></span>%)
                                          </b>
                                      </div>
                                                  <div>
                                      已付费:
                                      <b class="text-warning">
                                          <span data-bind="text: stats_today.paid_count"></span>
                                                                  (<span data-bind="text: Math.round(stats_today.pay_rate() * 100)"></span>%)
                                                              </b>
                                  </div>
                              </div>
                          </div>
                      </div>

                      <div class="col-md-3">
                          <div class="well">
                              <b>昨日新增</b>
                              <div class="text-primary" style="font-size:32px;margin:5px 0">
                                  <span data-bind="text: stats_yesterday.new_member_count"></span>
                                  <div style="font-size:13px;" class="text-muted">
                                      <b class="text-warning" data-bind="text: stats_yesterday.male_count"></b> 男性,
                                      <b class="text-warning" data-bind="text: stats_yesterday.female_count"></b> 女性,
                                      <b class="text-warning" title="用户未设置性别或未关注而无法获取性别" data-bind="text: stats_yesterday.new_member_count() - stats_yesterday.male_count() - stats_yesterday.female_count()"></b> 未知
                                  </div>
                              </div>
                              <div>
                                                      <div>
                                          已关注:
                                          <b class="text-warning">
                                              <span data-bind="text: stats_yesterday.subscribed_count"></span>
                                              (<span data-bind="text: Math.round(stats_yesterday.subscribe_rate() * 100)"></span>%)
                                          </b>
                                      </div>
                                                  <div>
                                      已付费:
                                      <b class="text-warning">
                                          <span data-bind="text: stats_yesterday.paid_count"></span>
                                                                  (<span data-bind="text: Math.round(stats_yesterday.pay_rate() * 100)"></span>%)
                                                              </b>
                                  </div>
                              </div>
                          </div>
                      </div>

                      <div class="col-md-3">
                          <div class="well">
                              <b>本月新增 (不含当日) <i class="fa fa-question-circle" title="不含当日，非实时，每天凌晨2:30左右更新"></i></b>
                              <div class="text-primary" style="font-size:32px;margin:5px 0">
                                  <span data-bind="text: stats_this_month.new_member_count"></span>
                                  <div style="font-size:13px;" class="text-muted">
                                      <b class="text-warning" data-bind="text: stats_this_month.male_count"></b> 男性,
                                      <b class="text-warning" data-bind="text: stats_this_month.female_count"></b> 女性,
                                      <b class="text-warning" title="用户未设置性别或未关注而无法获取性别" data-bind="text: stats_this_month.new_member_count() - stats_this_month.male_count() - stats_this_month.female_count()"></b> 未知
                                  </div>
                              </div>
                              <div>
                                                      <div>
                                          已关注:
                                          <b class="text-warning">
                                              <span data-bind="text: stats_this_month.subscribed_count"></span>
                                              (<span data-bind="text: Math.round(stats_this_month.subscribe_rate() * 100)"></span>%)
                                          </b>
                                      </div>
                                                  <div>
                                      已付费:
                                      <b class="text-warning">
                                          <span data-bind="text: stats_this_month.paid_count"></span>
                                                                  (<span data-bind="text: Math.round(stats_this_month.pay_rate() * 100)"></span>%)
                                                              </b>
                                  </div>
                              </div>
                          </div>
                      </div>

                      <div class="col-md-3">
                          <div class="well">
                              <b>所有时间 <i class="fa fa-question-circle" title="不含当日，非实时，每天凌晨2:30左右更新"></i></b>
                              <div class="text-primary" style="font-size:32px;margin:5px 0">
                                  <span data-bind="text: stats_all_time.new_member_count"></span>
                                  <div style="font-size:13px;" class="text-muted">
                                      <b class="text-warning" data-bind="text: stats_all_time.male_count"></b> 男性,
                                      <b class="text-warning" data-bind="text: stats_all_time.female_count"></b> 女性,
                                      <b class="text-warning" title="用户未设置性别或未关注而无法获取性别" data-bind="text: stats_all_time.new_member_count() - stats_all_time.male_count() - stats_all_time.female_count()"></b> 未知
                                  </div>
                              </div>
                              <div>
                                                      <div>
                                          已关注:
                                          <b class="text-warning">
                                              <span data-bind="text: stats_all_time.subscribed_count"></span>
                                              (<span data-bind="text: Math.round(stats_all_time.subscribe_rate() * 100)"></span>%)
                                          </b>
                                      </div>
                                                  <div>
                                      已付费:
                                      <b class="text-warning">
                                          <span data-bind="text: stats_all_time.paid_count"></span>
                                                                  (<span data-bind="text: Math.round(stats_all_time.pay_rate() * 100)"></span>%)
                                                              </b>
                                  </div>
                              </div>
                          </div>
                      </div>
                    </div>
                    <div class="panel panel-default" id="member-daily-stats-panel">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-calendar"></i> 近30天用户统计</h3>
                        </div>
                        <div class="loading-panel" data-bind="visible: loading">
                            <i class="fa fa-spinner fa-spin"></i>
                        </div>
                        <table class="table table-bordered table-striped" data-bind="visible: !loading()" style="display: none;">
                            <thead>
                                <tr>
                                    <th>日期</th>
                                    <th class="text-right">新增用户</th>
                                                        <th class="text-right">已关注</th>
                                                    <th class="text-right">已付费</th>
                                    <th class="text-right">男性</th>
                                    <th class="text-right">女性</th>
                                </tr>
                            </thead>
                            <tbody data-bind="foreach: stats">
                                <tr>
                                    <td>
                                      <span data-bind="text: date"></span>
                                        <!-- <span data-bind="date: date"></span> -->
                                    </td>
                                    <td class="text-right">
                                        <span data-bind="text: new_member_count"></span>
                                    </td>
                                                        <td class="text-right">
                                            <span data-bind="text: subscribed_count"></span>
                                        </td>
                                                    <td class="text-right">
                                        <span data-bind="text: paid_count"></span>
                                    </td>
                                    <td class="text-right">
                                        <span data-bind="text: male_count"></span>
                                    </td>
                                    <td class="text-right">
                                        <span data-bind="text: female_count"></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                  </div><!-- #profilee-->

                </div><!-- .tab-content-->
              </div><!-- .tabbable-->

  <!--  ================================================================================ -->
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
var data_daily_table = <{json_encode($data.daily_table)}>;
var data_member_daily_table = <{json_encode($data.data_member_daily_table)}>;
var data_yesterday = <{json_encode($data.data_yesterday)}>;
var data_this_month = <{json_encode($data.data_this_month)}>;
var data_all_time = <{json_encode($data.data_all_time)}>;
var data_member_yesterday = <{json_encode($data.data_member_yesterday)}>;
var data_member_this_month = <{json_encode($data.data_member_this_month)}>;
var data_member_all_time = <{json_encode($data.data_member_all_time)}>;
//订单统计的充值部分
ko.bindingHandlers.price ={
  //symbol: ko.observable('￥'),
  update:function(element, valueAccessor, allBindingsAccessor){
    return ko.bindingHandlers.text.update(element,function(){
      var value =+(ko.utils.unwrapObservable(valueAccessor())||0),
       symbol = ko.utils.unwrapObservable(allBindingsAccessor().symbol ===undefined? allBindingsAccessor().symbol : ko.bindingHandlers.currency.symbol);
       return value.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g,"$1,");
     });
  }
};

console.log("换接口,改uid:1为uid: uid")

    var OrderSummaryStatsPanel = function () {
        var self = this;
        var inited = false;
        var uid = null;
        var countdownIntervalId = null;
        var refreshIntervalSeconds = 60;
        var model = {
            refresh_seconds_left: ko.observable(refreshIntervalSeconds),
            stats_today: createStats(),
            stats_this_month: createStats(),
            stats_yesterday: createStats(),
            stats_all_time: createStats()
        };

        this.init = function () {

            if (!inited) {
                ko.applyBindings(model, document.getElementById('order-summary-stats-panel'));
                inited = false;
            }
        };

        this.load = function (options) {

            self.init();

            uid = options && options.uid ? options.uid : null;

            $.when(
                self.loadStatsToday(),
                self.loadStatsYesterday(),
                self.loadStatsThisMonth(),
                self.loadStatsAllTime()
            )
            .then(function () {
                self.startRefreshTimer();
            });
        };

        this.startRefreshTimer = function () {
            countdownIntervalId = setInterval(function () {
                model.refresh_seconds_left(model.refresh_seconds_left() - 1);

                if (model.refresh_seconds_left() === 0) {
                    clearInterval(countdownIntervalId);
                    self.loadStatsToday().then(function () {
                        model.refresh_seconds_left(refreshIntervalSeconds);
                        self.startRefreshTimer();
                    });
                }
            }, 1000);
        };
// ！！！！！！！！！！！！！！！    接口     ！！！！！！！！！！！！！！！！！！！！！
        this.loadStatsToday = function () {
            return $.get('/json/data-today.json'
              //'/backend/order_stats/api_get_stats_today/' + (uid || '')
              , function (data) {
               ko.mapping.fromJS(data, {}, model.stats_today);
            });

        };

        this.loadStatsYesterday = function () {
            ko.mapping.fromJS(data_yesterday, {}, model.stats_yesterday);
        };

        this.loadStatsThisMonth = function () {
            ko.mapping.fromJS(data_this_month, {}, model.stats_this_month);
        };

        this.loadStatsAllTime = function () {
            ko.mapping.fromJS(data_all_time, {}, model.stats_all_time);
        };

        function createStats() {
            return {
                paid_amount: ko.observable(),
                paid_order_count: ko.observable(),
                unpaid_order_count: ko.observable(),
                vip_order_paid_amount: ko.observable(),
                vip_order_paid_count: ko.observable(),
                vip_order_unpaid_count: ko.observable(),
                vip_order_completion_rate: ko.observable(),
                welth_order_paid_amount: ko.observable(),
                welth_order_paid_count: ko.observable(),
                welth_order_unpaid_count: ko.observable(),
                welth_order_completion_rate: ko.observable()
            }
        }
    };

    OrderSummaryStatsPanel.instance = new OrderSummaryStatsPanel();

//==================================================================================
//==================================================================================
<!--
//订单统计的充值-----表格部分
    var OrderDailyStatsPanel = function () {
        var self = this;
        var inited = false;
        var model = {
            loading: ko.observable(true),
            stats: ko.observableArray()
        };

        this.init = function () {
            if (!inited) {
                ko.applyBindings(model, document.getElementById('order-daily-stats-panel'));
                inited = true;
            }
        };

        this.load = function (options) {
            self.init();

            model.loading(true);
            model.stats(data_daily_table);
            model.loading(false);
            // var uid = options && options.uid ? options.uid : null;
//========================  接口 ===========================
            // $.get(
            //   '/json/data-daily-table.json'
            //   //'/backend/order_stats/api_get_daily_stats/' + (uid || '')
            //   , function (stats) {
            //     model.stats(stats);
            //     model.loading(false);
            // });
        }
    };

    OrderDailyStatsPanel.instance = new OrderDailyStatsPanel();
</script>

<script>
    OrderSummaryStatsPanel.instance.load({
        //uid: uid
        uid:1
    });

    OrderDailyStatsPanel.instance.load({
        //uid: uid
        uid:1
    });
</script>
<script>
    var MemberSummaryStatsPanel = function () {
        var self = this;
        var inited = false;
        var uid = null;
        var countdownIntervalId = null;
        var refreshIntervalSeconds = 60;
        var model = {
            refresh_seconds_left: ko.observable(refreshIntervalSeconds),
            stats_today: createStats(),
            stats_this_month: createStats(),
            stats_yesterday: createStats(),
            stats_all_time: createStats()
        };

        this.init = function () {
            if (!inited) {
                ko.applyBindings(model, document.getElementById('member-summary-stats-panel'));
                inited = false;
            }
        };

        this.load = function (options) {
            self.init();

            uid = options && options.uid ? options.uid : null;

            $.when(
                self.loadStatsToday(),
                self.loadStatsYesterday(),
                self.loadStatsThisMonth(),
                self.loadStatsAllTime()
            )
            .then(function () {
                self.startRefreshTimer();
            });
        };

        this.startRefreshTimer = function () {
            countdownIntervalId = setInterval(function () {
                model.refresh_seconds_left(model.refresh_seconds_left() - 1);

                if (model.refresh_seconds_left() === 0) {
                    clearInterval(countdownIntervalId);
                    self.loadStatsToday().then(function () {
                        model.refresh_seconds_left(refreshIntervalSeconds);
                        self.startRefreshTimer();
                    });
                }
            }, 1000);
        };
//！！！！！！！！！！！！！！！  接口！！！！！！！！！！！！！！！！！！！！
        this.loadStatsToday = function () {
            return $.get('/json/data-member-today.json'
              //'/backend/member_stats/api_get_stats_today/' + (uid || '')
              , function (data) {
               ko.mapping.fromJS(data, {}, model.stats_today);
            });
        };

        this.loadStatsYesterday = function () {
            ko.mapping.fromJS(data_member_yesterday, {}, model.stats_yesterday);
        };

        this.loadStatsThisMonth = function () {
            ko.mapping.fromJS(data_member_this_month, {}, model.stats_this_month);
        };
        this.loadStatsAllTime = function () {
            ko.mapping.fromJS(data_member_all_time, {}, model.stats_all_time);
        };

        function createStats() {
            return {
                new_member_count: ko.observable(),
                subscribed_count: ko.observable(),
                paid_count: ko.observable(),
                male_count: ko.observable(),
                female_count: ko.observable(),
                subscribe_rate: ko.observable(),
                pay_rate: ko.observable()
            }
        }
    };

    MemberSummaryStatsPanel.instance = new MemberSummaryStatsPanel();
</script>
<script>
    var MemberDailyStatsPanel = function () {
        var self = this;
        var inited = false;
        var model = {
            loading: ko.observable(true),
            stats: ko.observableArray()
        };

        this.init = function () {
            if (!inited) {
                ko.applyBindings(model, document.getElementById('member-daily-stats-panel'));
                inited = true;
            }
        };

        this.load = function (options) {
            self.init();

            model.loading(true);
            model.stats(data_member_daily_table);
            model.loading(false);
        }
    };

    MemberDailyStatsPanel.instance = new MemberDailyStatsPanel();
</script>
<script>
    $(function () {
       MemberSummaryStatsPanel.instance.load({
           //uid: uid
           uid:1
       });

       MemberDailyStatsPanel.instance.load({
          //uid: uid
          uid:1
       });
    });
</script>

<script>
  $(".nav-list li").click(function () {
    window.location.href = $(this).find("a").attr("href");
  })
</script>
</body>
</html>

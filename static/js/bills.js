/**
 * Created by 昏睡 on 2017/8/24.
 */
$(function () {
  //模拟的数据
  var billsData = {
    total: 1413,
    recharge: 1570,
    pending: 10,
    withdrawing: 45,
    paid: 1368
  }
  //ajax请求后渲染页面金额
  $("#totalCash").html(
    '<div class="well"> ' +
    '<b>结算单总额</b> ' +
    '<div class="text-primary" style="font-size:32px;margin:5px 0"> ' +
    '&yen;' + billsData.total.toFixed(2) +
    '<span class="text-muted" style="font-size:13px">' +
    ' 总充值: ' +
    '<b class="text-warning">&yen;' + billsData.recharge.toFixed(2) +
    '</b></span></div> ' +
    '<div style="font-size:14px" class="text-muted">' +
    ' 未提现: <b class="text-warning">&yen;' + billsData.pending.toFixed(2) + '</b>' +
    ' 提现中: <b class="text-warning">&yen;' + billsData.withdrawing.toFixed(2) + '</b>' +
    ' 已打款: <b class="text-warning">&yen;' + billsData.paid.toFixed(2) + '</b></div></div>'
  );

  $("#pendingCash").html(
    '<div class="well"> ' +
    '<b>未申请提现余额</b> ' +
    '<div class="text-primary" style="font-size:32px;margin:5px 0"> ' +
    '&yen;' + billsData.pending.toFixed(2) +
    ' <button type="button" id="applyForCash" class="btn btn-sm btn-primary">申请提现</button> ' +
    '<a id="withdrawalHistory" class="btn btn-sm btn-primary">提现记录</a> ' +
    '</div> ' +
    '<div style="font-size:14px;" class="text-muted">' +
    ' 申请提现总额: <b class="text-warning">&yen;' + billsData.total.toFixed(2) + '</b>' +
    ' 已打款: <b class="text-warning">&yen;' + billsData.paid.toFixed(2) + '</b>' +
    ' 待打款: <b class="text-warning">&yen;' + billsData.withdrawing.toFixed(2) + '</b> </div></div>'
  )
  //点击申请提现
  $("#applyForCash").click(function () {
    console.log(billsData.pending);
    if (billsData.pending < 10) {
      $("#emptyModal").modal("show");
      $("#emptyModal .modal-title").html("提现要求未满足");
      $("#emptyModal .modal-body").html("余额满 10 元才能提现");
      $("#emptyModal .modal-footer button").html("确定");
    } else {
      //发送ajax请求
      //刷新页面
      $("#emptyModal").modal("show");
      $("#emptyModal .modal-title").html("提现申请");
      $("#emptyModal .modal-body").html("您的提现申请已发送成功，审核通过后将转到您预留的银行卡上");
      $("#emptyModal .modal-footer button").html("我知道了");
    }
  })

  //点击提现记录
  $("#withdrawalHistory").click(function(){
    window.location.href = "withdrawalHistory.html";
  })

  function initTable(dom, url) {
    $(dom).dataTable({
      ajax: url,
      columns: [
        {data: "date"},
        {data: "count"},
        {data: "recharge"},
        {data: "bill"},
        {
          data: "status",
          render: function (data) {
            switch (data) {
              case 0:
                return '<span class="btn btn-default btn-sm">未提现</span>';
                break;
              case 1:
                return '<span class="btn btn-info btn-sm">提现中</span>';
                break;
              case 2:
                return '<span class="btn btn-success btn-sm">已打款</span>';
                break;
            }
          }
        },
        {
          data: "id",
          render: function (data) {
            return "<a class='billDetails' style='cursor: pointer;' data-id=" + data + ">查询</a>";
          }
        }
      ],
      paging: false,
      filter: false,
      lengthChange: false,
      info: false,
      sort: false,
      "oLanguage": {
        "sProcessing": "正在加载中......",
        "sLengthMenu": "每页显示 _MENU_ 条记录",
        "sZeroRecords": "对不起，查询不到相关数据！",
        "sEmptyTable": "表中无数据存在！",
        "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
        "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
        "sSearch": "搜索",
        "oPaginate": {
          "sFirst": "首页",
          "sPrevious": "上一页",
          "sNext": "下一页",
          "sLast": "末页"
        }
      },
      fnInitComplete: function (settings, data) {
        if (dom != "#paid .table") return;
        var page = Math.ceil(data.total / 20);//计算总共多少页
        //向页面添加分页信息
        $(".pager-summary em").eq(0).html(data.total);
        $(".pager-summary em").eq(2).html(page);

        //动态添加分页按钮
        for (var i = 0; i < page; i++) {
          if (i == 0) {
            $(".pagination li:last-child").before('<li class="active"><a href="#">' + (i + 1) + '</a></li>');
            $(".pagination li:first-child").addClass("disabled");
            if (page == 1) {
              $(".pagination li:last-child").addClass("disabled");
            }
          } else {
            $(".pagination li:last-child").before('<li><a href="#">' + (i + 1) + '</a></li>');
          }
        }

        //点击查询
        $(".billDetails").click(function(){
          console.log($(this).attr("data-id"));
          window.location.href="billDetails.html?id="+$(this).attr("data-id");
        })
      }
    });
  }

  initTable("#pending .table", "../json/data-pending.json");
  initTable("#withdrawing .table", "../json/data-withdrawing.json");
  initTable("#paid .table", "../json/data-paid.json");


})

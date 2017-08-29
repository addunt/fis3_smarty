/**
 * Created by 昏睡 on 2017/8/21.
 */
$(function () {
  var href = window.location.href;
  console.log(href);
  var title = href.split("?")[1];
  console.log(title);
  $('#from-date-picker').datetimepicker({format: 'YYYY-MM-DD'});
  $('#to-date-picker').datetimepicker({format: 'YYYY-MM-DD'});


  $("#orderTable").dataTable({
    data: data,
    "columns": [
      {
        "data": "td1",
        "render": function (data, type, full, meta) {
          return "<p class='blueText'>" + data + "</p>"
        }
      },
      {"data": "td2"},
      {
        "data": "td3",
        "render": function (data, type, full, meta) {
          return "<p class='blueText'>" + data + "</p>"
        }
      },
      {
        "data": "td4",
        "render": function (data, type, full, meta) {
          return "￥" + data;
        }
      },
      {"data": "td5"},
      {
        "data": "td6",
        "render": function (data, type, full, meta) {
          if (data == "待支付") {
            return "<span class='btn btn-sm btn-warning'>" + data + "<span>";
          } else if (data == "已支付") {
            return "<span class='btn btn-sm btn-success'>" + data + "<span>";
          }
          //return "<span><span>";
        }
      },
      {"data": "td7"},
      {"data": "td8"}
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
    "buttons": [
      {
        dom: 'Bfrtip',
        'extend': 'excel',
        'text': '导出',//定义导出excel按钮的文字
        'exportOptions': {
          'modifier': {
            'page': 'current'
          }
        }
      }
    ],
    //dom: 'Bfrtip',
    //buttons: [ {
    //  extend: 'excelHtml5',
    //  customize: function( xlsx ) {
    //    var sheet = xlsx.xl.worksheets['sheet1.xml'];
    //
    //    $('row c[r^="C"]', sheet).attr( 's', '2' );
    //  }
    //} ],
    fnInitComplete: function (settings, json) {
      console.log(json);
    }
  });
  
  //订单状态筛选
  $("#orderStatus,#novelStation").hover(function () {
    $(this).find(".selectBox").toggleClass("displayBlock");
  })

  //订单状态改变时触发事件
  $("input[name='orderStatus']").change(function () {
    $('input:checkbox[name=orderStatus]:checked').each(function (i, v) {
      console.log($(v).val());
    })
  })

  //导出已支付订单
  $("#btn-export").click(function(){
    //dataToExcel("orderTable");
  })
})

/**
 * Created by 昏睡 on 2017/8/24.
 */
$(function(){
  var now = new Date();
  $('#from-date-picker').datetimepicker({format: 'YYYY-MM-DD',defaultDate:new Date(now.getFullYear(),now.getMonth()-1,now.getDate()+1)});
  $('#to-date-picker').datetimepicker({format: 'YYYY-MM-DD',defaultDate:now});

  $.ajax({
    url: "../json/withdrawHistory.json",
    success: function (data) {
      {
        $("#orderTable").dataTable({
          ajax: "../json/withdrawHistory.json",
          columns:[
            {data:"applyTime"},
            {data:"playTime"},
            {data:"cash"},
            {data:"status",
            render:function(data){
              return data==0?'<span class="btn btn-sm btn-success">已打款</span>':'<span class="btn btn-sm btn-warning">待打款</span>';
            }},
            {data:"mark"}
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
        var page = Math.ceil(data.total / 20);//计算总共多少页
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
      }
    }
  })
})

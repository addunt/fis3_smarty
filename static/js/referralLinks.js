/**
 * Created by 昏睡 on 2017/8/21.
 */
$(function () {
  var table = $("#referral_links").DataTable({
    ajax: "../json/referral_link.json",
    "columns": [
      {
        "data": "td1",
        "render": function (data, type, full, meta) {
          var channelType = '';
          switch (data.channelType) {
            case 0:
              channelType = "认证公众号";
              break;
            case 1:
              channelType = "未认证公众号";
              break;
          }
          var html = "<p>" + data.td1_1 + "(" + channelType + ")</p>" +
            "<span class='blueText'>" + data.td1_2 + " </span><i class='fa fa-copy'></i>" +
            "<p class='grayText'>创建时间：" + data.td1_3 + "</p>";
          return html;
        },
        "className": "text-left"
      },
      {
        "data": "td2",
        "render": function (data,type,row,meta) {
          var html = "<a href='novelView.html?bookid="+row.id+"&bookname="+data.td2_1+"' data-id="+row.id+" class='blueText entryPage'>" + data.td2_1 + "</a>" +
            "<p>" + data.td2_2 + "</p>" +
            "<p class='grayText'>" + data.td2_3 + "</p>";
          return html;
        },
        "className": "text-left"
      },
      {"data": "td7"},
      {"data": "td3"},
      {"data": "td4"},
      {
        "data": "td5",
        "render": function (data) {
          var html = "<p>" + data.num + "</p><p class='grayText'>关注率" + data.rate + "</p>"
          return html;
        }
      },
      {
        "data": "td6",
        "render": function (data) {
          var html = "<p>" + data.money + "</p><p class='grayText'>" + data.count + "笔</p>"
          return html;
        }
      },
      {
        "render": function (data,type,row) {
          var html = "<a href='#' data-id="+row.id+" class='btn btn-xs btn-success orderDetils'><i class='fa fa-list'></i>订单明细</a>" +
            "<div class='btn-group'>" +
            "<button data-id="+row.id+" class='btn btn-xs btn-success dropdown-toggle' data-toggle='dropdown'>更多 <span class='ace-icon fa fa-caret-down'></span></button>" +
            "<ul class='dropdown-menu dropdown-menu-right'>" +
            "<li>" +
            "<a href='#' class='edit'><i class='fa fa-edit'></i>修改</a>" +
            "</li>" +
            "<li>" +
            "<a href='articleCase.html' target='_blank' class='article'><i class='fa fa-image'></i>文案</a>" +
            "</li>" +
            "<li class='divider'></li>" +
            "<li>" +
            "<a href='#' class='delete'><i class='fa fa-trash-o'></i>删除</a>" +
            "</li>" +
            "</ul>" +
            "</div>";
          return html;
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
    fnInitComplete: function (settings, json) {
      console.log("complete");
      //复制到剪切板
      setClipboard()

      $("tbody tr").click(function (e) {
        var e = e || window.event;
        var target = e.target || event.srcElement;
        var trData = json.data[$(this).index()];
        if ($(target).hasClass("edit")) {
          //修改
          editReferral(trData);
        }else if($(target).hasClass("delete")) {
          //删除
          deleteReferral(trData);
        }else if($(target).hasClass("orderDetils")){
          //明细
          window.location.href="../html/orderDetails.html?link_id="+trData.id;
        }else if($(target).hasClass("article")){
          //文案
          console.log(trData.td2.td2_1);
          //window.location.href="../html/orderDetails.html?link_id="+trData.id;
        }else if($(target).hasClass("entryPage")){
          //小说入口
          console.log(trData.td2.td2_1 + trData.id);
          //window.location.href="../html/novel.html?link_id="+trData.id;
        }
      })
    }
  });

  //修改
  function editReferral(trData){
    $("#editModal").modal("show");
    $("#editModal .modal-title").html("修改推广链接属性");
    $("#saveChange").html("保存修改");
    $("#channelName").next(".required").css("display","none");
    //渲染editModal
    initEditModal(trData);
  }
  //文案

  //删除
  function deleteReferral(trData){
    $("#emptyModal").modal("show");
    $("#emptyModal .modal-title").html("删除确认");
    $("#emptyModal .modal-body").html('确定要删除推广链接”'+trData.td1.td1_1+'“吗？');
    $("#emptyModal .modal-footer button:nth-child(3)").css("display","inline-block");
    $("#emptyModal .modal-footer button:nth-child(2)").css("display","inline-block");
    $("#emptyModal .modal-footer button:nth-child(1)").css("display","none");
  }
  //确定删除
  $("#delete").click(function(){
    $("#emptyModal").modal("hide");
    //向后台发送数据
    //$.ajax({
    //  url:"xxx",
    //  type:"",
    //  data:{},
    //  success:function(data){
    //    if(data.errcode==0){
    $(".alert-success span").html("删除成功");
    table.ajax.reload();
    $(".alert-success").fadeIn(1000);
    $(".alert-success").fadeOut(2000);
    //    }
    //  }
    //})
  })

  //表格内实现复制到剪切板的功能
  function setClipboard() {
    var clipboard = new Clipboard('.table .fa-copy', {
      text: function (trigger) {
        return $(trigger).prev("span").html();
      }
    });
    clipboard.on('success', function () {
      $(".alert-success span").html("复制成功");
      $(".alert-success").fadeIn(1000);
      $(".alert-success").fadeOut(2000);
    });
  }

  //渲染editModal
  function initEditModal(trData) {
    //选择入口页面
    $(".form-control-static span").each(function (i, v) {
      $(v).css("display", "none");
      if ($(v).attr("data-type") == trData.type) {
        $(v).css("display", "inline-block");
      }
    })
    //派单渠道名称
    $("#channelName").val(trData.td1.td1_1);
    //渠道类型
    if (trData.td1.channelType == 0) {
      $("input[type=radio][name='referrer_type'][value='verified_mp']").attr("checked", 'checked');
    } else if (trData.td1.channelType == 1) {
      $("input[type=radio][name='referrer_type'][value='not_verified_mp']").attr("checked", 'checked');
    }
    //热门推荐不显示下面的信息
    if (trData.type == 2) {
      $(".visible").css("display", "none");
      return;
    }
    $(".visible").css("display", "block");
    //image的src
    if (trData.image) {
      $("#novel_avatar").attr("src", trData.image);
    }
    //原文章节
    $(".article_title").html(trData.td2.td2_2);
  }

  //保存修改
  $("#saveChange").click(function () {
    if($("#channelName").val()==''){
      $("#channelName").next(".required").css("display","block");
      return;
    }else{
      $("#channelName").next(".required").css("display","none");
    }
    if($("input[type=radio][name='referrer_type']:checked").val()==undefined){
      $(".channelType.required").css("display","block");
      return;
    }else{
      $(".channelType.required").css("display","none");
    }
    console.log($("#channelName").val());
    console.log($("#editModal input[type=radio][name='referrer_type']:checked").val());
    console.log($("#chapterNum").val());
    var title =  $("#editModal .modal-title").html();
    $("#editModal").modal("hide");
    var link = "https://c18319.818tu.com/referrals/index/411273";//由后台拿到
    if(title=="生成推广链接"){
      openSaveSuccModal("推广链接生成成功",link);
    }else if(title=="修改推广链接属性"){
      openSaveSuccModal("保存成功",link);
    }
  })

  //打开保存成功模态框
  function openSaveSuccModal(title,link){
    $("#savaSuccModal").modal("show");
    $("#savaSuccModal .modal-title").html(title);
    $("#copyLink").prev(".remind").css("display","none");
    $("#savaSuccModal").find(".link").html(link);
    copyLink();
  }

  //点击复制链接
  function copyLink() {
    var clipboard = new Clipboard('#copyLink');
    clipboard.on('success', function (e) {
      $("#copyLink").prev(".remind").css("display","inline-block");
    });
  }

  //首页推广
  $(".index-referral").click(function(){
    $("#editModal").modal("show");
    $("#editModal .modal-title").html("生成推广链接");
    $("#saveChange").html("生成链接");
    $(".form-control-static span").each(function (i, v) {
      $(v).css("display", "none");
      if ($(v).attr("data-type") == "1") {
        $(v).css("display", "inline-block");
      }
    })
  })

  //小说推广
  $(".novel-referral").click(function(){
    $("#emptyModal").modal("show");
    $("#emptyModal .modal-title").html("创建小说推广");
    $("#emptyModal .modal-body").html('请在小说章节列表中选择”创建推广链接“或"生成推广文案"');
    $("#emptyModal .modal-footer button:nth-child(1)").css("display","inline-block");
    $("#emptyModal .modal-footer button:nth-child(2)").css("display","none");
    $("#emptyModal .modal-footer button:nth-child(3)").css("display","none");
  })

  //热门推荐
  $(".hot-referral").click(function(){
    $("#editModal").modal("show");
    $("#editModal .modal-title").html("生成推广链接");
    $("#saveChange").html("生成链接");
    $(".form-control-static span").each(function (i, v) {
      $(v).css("display", "none");
      if ($(v).attr("data-type") == "2") {
        $(v).css("display", "inline-block");
      }
    })
  })
})

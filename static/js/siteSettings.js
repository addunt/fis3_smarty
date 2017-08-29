/**
 * Created by 昏睡 on 2017/8/23.
 */
$(function () {
  //模拟的数据
  var settings = {
    oldID: "gh_85048f046f84",
    wechatNum: "haoshumen",
    nickName: "好书传送门",
    AppID: "wx2778c57ee0ade269",
    AppSecret: "6b463f8dea6c66f61774f8aca349507d",
    ipWhiteList: ["47.93.119.78", "123.57.229.51", "101.200.166.149", "101.201.142.86"]
  }

  initSetTab(settings);

  function initSetTab(settings) {
    $("#oldID").val(settings.oldID);
    $("#wechatNum").val(settings.wechatNum);
    $("#nickName").val(settings.nickName);
    $("#AppID").val(settings.AppID);
    $("#AppSecret").val(settings.AppSecret);
    for (var i = 0, length = settings.ipWhiteList.length; i < length; i++) {
      $("#ipWhiteList").append("<p>" + settings.ipWhiteList[i] + "</p>");
    }
  }

  //复制功能
  function copyFunc1() {
    var clipboard = new Clipboard("#copyBtn", {
      text: function (trigger) {
        var text = $(trigger).prev("span").html();
        text = text.replace(/\s/g, "");
        text = text.replace(/<p>/g, "");
        text = text.replace(/<\/p>/g, "\n");
        return text;
      }
    });
    clipboard.on('success', function () {
      $(".alert-success span").html("复制成功");
      $(".alert-success").fadeIn(1000);
      $(".alert-success").fadeOut(2000);
    });
  }

  function copyFunc2() {
    var clipboard = new Clipboard(".copyBtn");
    clipboard.on('success', function () {
      $(".alert-success span").html("复制成功");
      $(".alert-success").fadeIn(1000);
      $(".alert-success").fadeOut(2000);
    });
  }

  copyFunc1();
  copyFunc2();


  //点击保存
  $("#saveForm").click(function () {
    $(".alert-success span").html("保存成功");
    $(".alert-success").fadeIn(1000);
    $(".alert-success").fadeOut(2000);
  })

  //点击生成菜单
  $("#btn-generate-menu").click(function () {
    $(".alert-success span").html("菜单生成成功，大约5分钟后生效");
    $(".alert-success").fadeIn(1000);
    $(".alert-success").fadeOut(2000);
  })
})

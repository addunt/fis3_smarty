/**
 * Created by 昏睡 on 2017/8/25.
 */
$(function () {
  /*
   * 复制功能
   * dom1：复制按钮；dom2:被复制的元素
   * */
  function clipboard(dom1, dom2) {
    var clipboard = new Clipboard(dom1, {
      "text": function () {
        return $(dom2).html() || $(dom2).val();
      }
    });
    clipboard.on('success', function () {
      $(".alert-success span").html("复制成功");
      $(".alert-success").fadeIn(1000);
      $(".alert-success").fadeOut(2000);
    });
  }

  clipboard("#copyTitle", "#title");
  clipboard("#copyArticle", "#wx-article-body");
  clipboard(".bottomCopyLink", "#txt-referral-link");
  clipboard("#btn_copy_link", ".text-primary");

  //更换标题
  $(".nav .dropdown:nth-child(1) .dropdown-menu li").click(function () {
    scrollToElement("#title");
    var title = $(this).find("a").html();
    $("#title").html(title);
  })
  //更换封面
  $(".nav .dropdown:nth-child(2) .dropdown-menu li").click(function () {
    scrollToElement(".coverImg");
    var src = $(this).find("img").attr("src");
    $(".main .coverImg img").attr("src", src);
  })
  //更换正文模板
  $(".nav .dropdown:nth-child(3) .dropdown-menu li").click(function () {
    scrollToElement("#wx-article-body");
    var src = $(this).find("img").attr("src");
    console.log(src);
  })
  //更换原文引导模板
  var articleFooter = [
    '<section style="border: none; margin: 5px 0px 0px; padding: 10px; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"> ' +
    '<section class="color" style="margin-top: -1px; margin-bottom: 0px; min-height: 40px; visibility: visible; height: 40px; line-height: 40px; border-radius: 3px; text-align: center; color: rgb(255, 255, 255); background-color: rgb(119, 121, 255);"> ' +
    '<span style="font-size: 14px;">↓点击下方“阅读原文”查看更多</span> </section> ' +
    '<section class="border" style="margin: 0px auto 0px 30px; float: none; width: 0px; height: 0px; border-left-width: 0px; border-left-style: solid; border-left-color: transparent; border-right-width: 18px; border-right-style: solid; border-right-color: transparent; border-top-width: 27px; border-top-style: solid; border-top-color: rgb(119, 121, 255);"></section> </section>',

    '<section class="color" style="margin-top: -1px; margin-bottom: 0; min-height: 40px; visibility: visible; height: 40px; line-height: 40px; border-radius: 3px; text-align: center; color: rgb(255, 255, 255); background-color: rgb(191, 215, 48);"> ' +
    '<span style="font-size:14px;color: #000;">↓点击下方<span style="color: #fff;">“阅读原文”</span>查看更多</span> </section> ' +
    '<section class="border" style="margin: 0 auto 0 30px; float: none; width: 0; height: 0;border-left: 0 solid transparent;border-right: 18px solid transparent;border-top: 27px solid #bfd730;"> &nbsp; </section>',

    '<section class="" style="white-space: normal; border: 0px none; margin-top: 5px; padding: 0px; background-image: none;"><p><br></p>' +
    '<section class="white" style="margin-top: -1px;min-height: 40px;visibility: visible;height: 40px;line-height: 40px;border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-right-radius: 10px;border-bottom-left-radius: 10px;text-align: center;box-shadow: rgb(190, 190, 190) 0px 3px 5px;background-color: #33B3EB;color: rgb(255, 255, 255);">' +
    '<span class="pBrush" style="font-size: 14px;"><span style="float: left; margin-left: 20px;">↙↙↙</span>点击“阅读原文”查看更多精彩内容</span></section><p><br></p></section>',

    '<section style="font-size: 16px; line-height: 25.6px; white-space: normal; max-width: 100%; min-height: 1em; color: rgb(62, 62, 62); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);">' +
    '<span style="color: rgb(255, 79, 121);"><strong>' +
    '<span style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '由于微信篇幅限制，只能发到这里啦！</span></strong></span></section> ' +
    '<span>&nbsp;</span> <section style="font-size: 16px; line-height: 25.6px; white-space: normal; max-width: 100%; min-height: 1em; color: rgb(62, 62, 62); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);">' +
    '<span style="max-width: 100%; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<strong style="max-width: 100%; line-height: 23.2727px; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<span style="max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<strong style="max-width: 100%; line-height: 23.2727px; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<span style="max-width: 100%; color: rgb(255, 41, 65); font-size: 14px; line-height: 25.6px; font-family: Helvetica; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<img style="margin-right: auto; margin-left: auto; color: rgb(62, 62, 62); line-height: 25.6px; white-space: normal; display: inline-block; vertical-align: middle; box-sizing: border-box !important; word-wrap: break-word !important; visibility: visible !important; width: 30px !important; height: auto !important;" width="30px" src="https://ommdq027l.qnssl.com/wx_articles/templates/footer/arrow-down.gif"></span></strong></span></strong>' +
    '<span style="max-width: 100%; font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<strong style="max-width: 100%; line-height: 23.2727px; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<span style="max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<strong style="max-width: 100%; line-height: 23.2727px; box-sizing: border-box !important; word-wrap: break-word !important;"></strong></span></strong>' +
    '<strong style="max-width: 100%; line-height: 23.2727px; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<span style="max-width: 100%; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<strong style="max-width: 100%; line-height: 23.2727px; box-sizing: border-box !important; word-wrap: break-word !important;"></strong> 点击下方' +
    '<span style="max-width: 100%; color: rgb(0, 128, 255); font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;">【阅读原文】</span>' +
    '<span style="max-width: 100%; font-size: 18px; color: rgb(0, 128, 255); box-sizing: border-box !important; word-wrap: break-word !important;">，</span>后续剧情</span>' +
    '<span style="max-width: 100%; font-size: 15px; color: rgb(255, 41, 65); box-sizing: border-box !important; word-wrap: break-word !important;">高潮不断！</span></strong></span></span></section>',

    '<div id="wx-article-footer"><section style="max-width: 100%; min-height: 1em; color: rgb(62, 62, 62); font-size: 16px; line-height: 25.6px; white-space: normal; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);">' +
    '<strong style="max-width: 100%; font-family: 微软雅黑; text-indent: 32px; line-height: 24px; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<span style="max-width: 100%; font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important;">未完待续...</span></strong></section> ' +
    '<section style="max-width: 100%; min-height: 1em; color: rgb(62, 62, 62); font-size: 16px; line-height: 25.6px; white-space: normal; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);">' +
    '<strong style="max-width: 100%; font-family: 微软雅黑; text-indent: 32px; line-height: 24px; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important;">点击</span></strong>' +
    '<strong style="max-width: 100%; font-family: 微软雅黑; text-indent: 32px; line-height: 24px; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; font-size: 18px; font-family: 宋体; color: rgb(255, 41, 65); box-sizing: border-box !important; word-wrap: break-word !important;">“阅读原文”</span></strong>' +
    '<strong style="max-width: 100%; font-family: 微软雅黑; text-indent: 32px; line-height: 24px; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; font-size: 18px; font-family: 宋体; box-sizing: border-box !important; word-wrap: break-word !important;">阅读后续精彩情节</span></strong></section> ' +
    '<section style="max-width: 100%; min-height: 1em; margin-top:10px; text-align: justify; text-indent: 0em; box-sizing: border-box !important; word-wrap: break-word !important;"><img style="line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important; visibility: visible !important; width: auto !important; height: auto !important;" src="https://ommdq027l.qnssl.com/wx_articles/templates/footer/footer_animated2_img.gif"></section>',

    '<section style="max-width: 100%; min-height: 1em; color: rgb(62, 62, 62); font-size: 16px; line-height: 25.6px; white-space: pre-wrap; font-family: "微软雅黑", "Microsoft YaHei", Arial, sans-serif; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);">' +
    '<span style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<strong style="max-width: 100%; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, "Hiragino Sans GB", "Microsoft YaHei", Arial, sans-serif; font-size: 14px; line-height: 30px; text-align: justify; white-space: normal; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(228, 238, 244);">' +
    '<span style="max-width: 100%; color: rgb(217, 33, 66); font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);">继续阅读请点击【阅读原文】</span></strong></span></section> ' +
    '<section style="max-width: 100%; min-height: 1em; color: rgb(62, 62, 62); font-size: 16px; line-height: 25.6px; white-space: pre-wrap; font-family: 微软雅黑, "Microsoft YaHei", Arial, sans-serif; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);">' +
    '<span style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">' +
    '<strong style="max-width: 100%; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, "Hiragino Sans GB", "Microsoft YaHei", Arial, sans-serif; font-size: 14px; line-height: 30px; text-align: justify; white-space: normal; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(228, 238, 244);">' +
    '<span style="max-width: 100%; color: rgb(217, 33, 66); font-size: 18px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);">' +
    '<img style="color: rgb(62, 62, 62); line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important; visibility: visible !important; width: auto !important; height: auto !important;" width="auto" src="https://ommdq027l.qnssl.com/wx_articles/templates/footer/footer_animated3_img.gif"></span></strong></span></section>',

    '<h1 style="white-space: normal; color: rgb(70, 70, 72); line-height: 22.72px; font-family: Arial; font-weight: 400; font-size:16px;"> ' +
    '<p style="margin-top: 0px; margin-bottom: 0px;"> ' +
    '<strong><span style="color: rgb(255, 76, 65);">未完待续……</span></strong> </p> ' +
    '<p style="margin-top: 0px; margin-bottom: 0px;"> ' +
    '<strong><span style="color: rgb(255, 76, 65);">微信篇幅有限，后续内容和情节更加精彩！</span></strong> </p> ' +
    '<p style="margin-top: 0px; margin-bottom: 0px;"> ' +
    '<strong><span style="color: rgb(255, 76, 65);">点击下方【阅读原文】继续阅读哦~~~</span></strong> </p> ' +
    '<p style="margin-top: 0px; margin-bottom: 0px;"> <strong> ' +
    '<img src="https://ommdq027l.qnssl.com/wx_articles/templates/footer/footer_animated4_img.gif" width="auto"> </strong> </p> </h1>'
  ]
  $(".nav .dropdown:nth-child(4) .dropdown-menu li").click(function () {
    scrollToElement("#wx-article-footer");
    $("#wx-article-footer").html(articleFooter[$(this).index()]);
  })

  function scrollToElement(dom) {
    $('html, body').animate({
      scrollTop: $(dom).offset().top - 20
    }, 400);
  }

  $("#openReferralLinkModal").click(function () {
    $("#create-referral-link-modal").modal("show");
  })

  $("#editReferralLink").click(function () {
    $("#edit-referral-link-modal").modal("show");
    $("#edit-channelName").val("渠道");
    $("#editForm input[type=radio][name='referrer_type'][value='verified_mp']").attr("checked", 'checked');
  })

  //修改推广链接点击保存
  $("#edit-referral-link-modal .modal-footer button").click(function () {
    if ($("#edit-channelName").val() == '') {
      $("#edit-channelName").next(".required").css("display", "block");
      return;
    } else {
      $("#edit-channelName").next(".required").css("display", "none");
    }
    $("#edit-referral-link-modal").modal("hide");
    $("#edit-focus-num").val("");
    $("#save-succ-modal").modal("show");
    $("#save-succ-modal .modal-title").html("保存成功");
  })

  //生成推广链接点击生成
  $("#create-referral-link-modal .modal-footer button").click(function () {
    if ($("#create-channelName").val() == '') {
      $("#create-channelName").next(".required").css("display", "block");
      return;
    } else {
      $("#create-channelName").next(".required").css("display", "none");
    }
    if ($("#create-referral-link-modal input[type=radio][name='referrer_type']:checked").val() == undefined) {
      $(".channelType.required").css("display", "block");
      return;
    } else {
      $(".channelType.required").css("display", "none");
    }

    $("#create-referral-link-modal").modal("hide");
    $("#create-channelName").val("");
    $("#create-focus-num").val("");
    $("#create-referral-link-modal input[type=radio][name='referrer_type']").attr("checked",false);
    $("#save-succ-modal").modal("show");
    $("#save-succ-modal .modal-title").html("推广链接生成成功");
  })

})

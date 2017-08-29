/**
 * Created by 昏睡 on 2017/8/24.
 */
$(function(){
  if($.cookie('user')){
    $("#user").val($.cookie('user'));
  }
  if($.cookie('password')){
    $("#password").val($.cookie('password'));
  }
  $("#loginBtn").click(function(){
    console.log($("form").serialize());
    if($("#user").val()=='') {
      alertDanger("请输入用户名");
      return;
    }
    if($("#password").val()=='') {
      alertDanger("请输入密码");
      return;
    }
    if($("#user").val()!='hscs'||$("#password").val()!='123456'){
      alertDanger("用户名或密码不正确");
      return;
    }
    $.cookie('user', $("#user").val(), { expires: 7 });
    $.cookie('password', $("#password").val(), { expires: 7 });
    window.location.href = "../index.html";
  })

  function alertDanger(text){
    $(".alert-danger span").html(text);
    $(".alert-danger").fadeIn(1000);
    $(".alert-danger").fadeOut(2000);
  }
})

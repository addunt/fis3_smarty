/**
 * Created by 昏睡 on 2017/8/23.
 */
$(function(){
  var href = window.location.href;
  var tab = href.split("tab=")[1];
  if(tab=="modifyPsw"){
    $("#myTab a:last").tab("show");
  }
  //当前密码是否输入为空
  $("#old_psw").keyup(function(){
    var val = $("#old_psw").val();
    if(val.length==0){
      $(this).next(".required").html("请输入当前密码");
    }else{
      $(this).next(".required").html("");
    }
  })
  //新密码长度验证
  $("#new_psw").keyup(function(){
    var val = $("#new_psw").val();
    console.log($("#new_psw").val());
    if(val.length==0){
      $(this).next(".required").html("请输入新密码");
    }else if(val.length<6||val.length>24){
      $(this).next(".required").html("新密码必须在6到24位之间");
    }else{
      $(this).next(".required").html("");
    }
  })

  //验证密码是否一样
  $("#new_psw_confirm").keyup(function(){
    var val = $("#new_psw").val();
    if($("#new_psw_confirm").val().length==0){
      $(this).next(".required").html("请输入新密码");
    }else if($("#new_psw_confirm").val()!=val){
      $(this).next(".required").html("两次输入的密码不一致");
    }else{
      $(this).next(".required").html("");
    }
  })

  //确认修改
  $("#submitForm").click(function(){
    $("#old_psw,#new_psw,#new_psw_confirm").keyup();
    //发送ajax请求
    //当前密码不正确
    if($("#old_psw").val()!="haoshumen@818TU2017"){
      $("#old_psw").next(".required").html("当前密码不正确");
    }
  })
})

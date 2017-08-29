/**
 * Created by 昏睡 on 2017/8/18.
 */
$(function(){
  console.log(data);
  
  //for循环添加li标签
  for(var i= 0,length=data.data.length;i<length;i++){
    var item = data.data[i];
    if(i==0){
      var html='<li class="notice"> ' +
        '<span class="time">'+item.time+' |</span> ' +
        '<a href="#" class="title">'+item.title+'</a> ' +
        '<span class="NEW">NEW</span>'+
        '</li>';
    }else{
      var html='<li class="notice"> ' +
        '<span class="time">'+item.time+' |</span> ' +
        '<a href="#" class="title">'+item.title+'</a> ' +
        '</li>';
    }
    $(".page-content .notices").append(html);
  }
  
  
  $(".notice a").click(function(){
    var index = $(this).parent().index();
    var noticeData = data.data[index];
    console.log(noticeData.msg);
    $("#noticeMsg").modal("show");
    $("#noticeMsg .modal-header h4").html(noticeData.title);
    $("#noticeMsg .modal-body").html(noticeData.msg);
  })
  
});
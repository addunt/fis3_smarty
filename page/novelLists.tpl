<!DOCTYPE html>
<html lang="en">
<head>
  <title><{$page_name}></title>
  <meta name="description" content="蓝鲸传媒,蓝鲸浑水" />
  <{widget name="smarty_demo:widget/header_assets/header_assets.tpl"}>
  <style>
    body{
      font-size: 14px;
    }
    .actions-bar-height{
      margin-bottom: 10px;
    }
    .nav-pills-sm > li > a{
      padding: 4px 12px;
    }
    .pull-right .input-group-btn button{
      border: 1px solid #428bca;
    }
    .pager-summary{
      display: inline-block;
      margin: 20px;
      vertical-align: bottom;
    }
  </style>
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
     <!--  ////////////////////////////////////////////////////////////////////////////// -->
        <div class="page-content-area">
          <div class="row">
            <div class="col-xs-12">
              <!-- PAGE CONTENT BEGINS -->
              <!--/span-->
              <!-- left menu ends -->
              <div class="actions-bar clearfix actions-bar-height" style="margin-top:15px">
                <form class="form-inline search-form">
                  <div class="input-group pull-right">
                    <input type="search" name="q" value="" placeholder="小说名称" style="width:auto;" aria-controls="noval-list-show-table">
                    <input type="hidden" name="is_online" value="1" />
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                    </span>
                  </div>
                </form>
                <ul class="nav nav-pills nav-pills-sm pull-left" style="margin-top:3px">
 <!--  00000000000000000000000000000000  排序部分  00000000000000000000000000000000-->
                  <li class="active"><a href="<{$base_url}>/novelLists?order_by=rank+desc">全部</a></li>
                  <li class=""><a href="<{$base_url}>/novelLists?order_by=rank+desc&gender=male">男频</a></li>
                  <li class=""><a href="<{$base_url}>/novelLists?order_by=rank+desc&gender=female">女频</a></li>
                  <li class="" id="bookNew">
                    <a href="void:0">新书</a>
                    <!-- <a href="/novelLists.html?order_by=rank+desc&is_new=1">新书</a> -->
                  </li>
                  <!--                排序部分            -->
                </ul>
              </div>
              <div class="panel panel-default" id="noval-list-show-panel">
                     <!--  <div class="panel-heading">
                          <h3 class="panel-title"><i class="fa fa-calendar"></i> 近30天充值统计</h3>
                      </div> -->
                      <div class="loading-panel" data-bind="visible: loading">
                          <i class="fa fa-spinner fa-spin"></i>
                      </div>
                  <table class="table table-striped table-bordered responsive" data-bind="visible: !loading()" style="display: none;" id="noval-list-show-table">
                    <thead>
                      <tr>
                        <td>
                          封面
                        </td>
                        <td>
                          名称
                        </td>
                        <td>
                          状态
                        </td>
                        <td class="text-center">性别频度</td>
                        <td class="text-center"  id="tablesort">
                          <a data-ui="table-sort" data-field="rank" data-start-dir="desc" title="点击排序" style="cursor: pointer;">
                            派单指数
                            <i class="fa table-sort-icon fa-caret-down"></i>
                            </a>
                        </td>
                      </tr>
                    </thead>
                    <tbody  data-bind="foreach: stats">
                      <tr>
                        <td class="text-center">
                          <img data-bind="attr: { src: book_src }" width="50">
                        </td>
                        <td>
                          <a data-bind="attr: { href: book_id }">[<span data-bind="text: book_type"></span>] <span data-bind="text: book_name"></span></a>
                          <span style="font-size:13px">[<span data-bind="text: book_complete_state"></span>]</span>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 <span data-bind="text: book_chapter"></span> 章. 第 <span data-bind="text: book_attention_from"></span> 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-04-12 18:13:09" class="btn btn-success btn-xs" data-bind="text: book_state"></span>
                        </td>
                        <td class="text-center">
                          <span data-bind="text: book_gender"></span> </td>
                        <td class="text-center">
                          <span data-bind="text: book_hot_level"></span> </td>
                      </tr>

                    <!--
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14975944191498.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/337">[总裁] 总裁要生娃</a>
                          <span style="font-size:13px">[已完结]</span>
                          <i class="fa fa-arrow-circle-up" style="cursor:pointer;" data-toggle="tooltip" title="2017-06-14 18:53 更新 256 章"></i>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 256 章. 第 9 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-06-15 09:13:42" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          100 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14987476142741.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/360">[都市] 闪婚爱妻</a>
                          <span style="font-size:13px">[已完结]</span>
                          <i class="fa fa-arrow-circle-up" style="cursor:pointer;" data-toggle="tooltip" title="2017-06-29 18:12 更新 1428 章"></i>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 1428 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-06-29 23:03:02" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          100 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/15000262239180.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/633">[古言] 医妃天下</a>
                          <span style="font-size:13px">[已完结]</span>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 426 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-08-07 10:34:22" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          100 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/1492334684520.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/147">[兵王]  猛男诞生记</a>
                          <span style="font-size:13px">[连载中]</span>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 1806 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-04-13 16:16:39" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          男频 </td>
                        <td class="text-center">
                          100 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/15006893168945.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/675">[都市] 绝世医妃</a>
                          <span style="font-size:13px">[连载中]</span>
                          <i class="fa fa-arrow-circle-up" style="cursor:pointer;" data-toggle="tooltip" title="2017-08-22 12:09 更新 1 章"></i>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 464 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-08-07 10:34:25" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          100 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/1501663800847.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/700">[都市] 爱你一生</a>
                          <span style="font-size:13px">[连载中]</span>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 1497 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-08-02 12:29:15" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          100 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14940629255195.png?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/209">[都市] 我与空姐的那些事</a>
                          <span style="font-size:13px">[已完结]</span>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 521 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-05-03 19:08:56" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          男频 </td>
                        <td class="text-center">
                          100 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14923348418378.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/28">[都市] 誓不复婚：前妻不回头</a>
                          <span style="font-size:13px">[已完结]</span>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 541 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-04-13 15:52:33" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          99 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14923344088576.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/35">[都市] 总裁的独宠妻</a>
                          <span style="font-size:13px">[已完结]</span>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 735 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-04-12 12:58:33" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          99 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14982919225672.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/352">[都市] 女总裁的猛男保镖</a>
                          <span style="font-size:13px">[已完结]</span>
                          <i class="fa fa-arrow-circle-up" style="cursor:pointer;" data-toggle="tooltip" title="2017-07-30 03:36 更新 266 章"></i>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 782 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-06-23 20:12:19" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          男频 </td>
                        <td class="text-center">
                          99 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14987476896967.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/362">[都市] 冷婚娇妻</a>
                          <span style="font-size:13px">[连载中]</span>
                          <i class="fa fa-arrow-circle-up" style="cursor:pointer;" data-toggle="tooltip" title="2017-08-22 09:05 更新 1 章"></i>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 2360 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-07-12 18:22:42" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          99 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14987473883479.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/367">[都市] 逼婚</a>
                          <span style="font-size:13px">[已完结]</span>
                          <i class="fa fa-arrow-circle-up" style="cursor:pointer;" data-toggle="tooltip" title="2017-06-29 19:10 更新 627 章"></i>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 628 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-07-04 10:21:46" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          99 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14987479381938.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/370">[都市] 总裁的夜宠</a>
                          <span style="font-size:13px">[已完结]</span>
                          <i class="fa fa-arrow-circle-up" style="cursor:pointer;" data-toggle="tooltip" title="2017-06-29 19:17 更新 200 章"></i>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 200 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-06-30 00:48:23" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          99 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14923348092346.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/155">[都市] 婚外迷情</a>
                          <span style="font-size:13px">[已完结]</span>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 244 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-04-14 11:07:11" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          99 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/1500689268643.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/680">[都市] 纯情小娇妻</a>
                          <span style="font-size:13px">[已完结]</span>
                          <i class="fa fa-arrow-circle-up" style="cursor:pointer;" data-toggle="tooltip" title="2017-07-21 11:09 更新 381 章"></i>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 381 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-07-21 13:47:59" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          99 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/15016637928691.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/701">[都市] 爱来得刚好</a>
                          <span style="font-size:13px">[已完结]</span>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 576 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-08-02 12:29:21" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          99 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14975944369073.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/332">[都市] 弃妇</a>
                          <span style="font-size:13px">[连载中]</span>
                          <i class="fa fa-arrow-circle-up" style="cursor:pointer;" data-toggle="tooltip" title="2017-08-22 00:01 更新 2 章"></i>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 353 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-06-14 08:00:33" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          98 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14978464759687.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/341">[总裁] 宠妻成瘾</a>
                          <span style="font-size:13px">[已完结]</span>
                          <i class="fa fa-arrow-circle-up" style="cursor:pointer;" data-toggle="tooltip" title="2017-06-14 19:05 更新 585 章"></i>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 586 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-06-16 11:38:16" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          女频 </td>
                        <td class="text-center">
                          98 </td>
                      </tr>
                      <tr>
                        <td class="text-center">
                          <img src="https://ommdq027l.qnssl.com/novels/14930143678923.jpg?imageView2/0/w/300/q/75" width="50">
                        </td>
                        <td>
                          <a href="/backend/novels/view/171">[校园] 校花的超级高手</a>
                          <span style="font-size:13px">[连载中]</span>
                          <i class="fa fa-arrow-circle-up" style="cursor:pointer;" data-toggle="tooltip" title="2017-08-21 21:00 更新 4 章"></i>
                          <div class="text-muted" style="margin-top:5px;line-height:1.6em;">
                            共 7906 章. 第 10 章开始要求关注
                          </div>
                        </td>
                        <td>
                          <span title="上架时间: 2017-04-20 17:48:59" class="btn btn-success btn-xs">已上架</span>
                        </td>
                        <td class="text-center">
                          男频 </td>
                        <td class="text-center">
                          98 </td>
                      </tr> -->
                    </tbody>
                  </table>
              </div>
              <{widget name="smarty_demo:widget/pages/pages.tpl" page_total=$data.page_total page=$data.page page_size=$data.page_size total=$data.total url=$base_url + '/index?page=' }>
              <!-- <div class="modal fade" id="edit-price-modal">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">设置价格</h4>
                    </div>
                    <div class="modal-body">
                      <form class="form-horizontal" id="edit-price-form">
                        <div class="form-group">
                          <div class="form-control-static col-sm-10" style="font-size:16px">
                            《<span class="novel-name"></span>》
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-2">章节数量:</label>
                          <div class="form-control-static col-sm-10">
                            <span class="novel-chapter-count"></span> 章节
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-2">免费章节:</label>
                          <div class="col-sm-10">
                            <input type="number" class="free-chapter-count" required name="free_chapter_count">
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-2">小说价格:</label>
                          <div class="col-sm-10">
                            <input type="number" class="novel-price" required name="novel_price"> 书币
                            <p class="help-block">
                              1 元人民币 = 100 书币
                            </p>
                          </div>
                        </div>
                      </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" id="btn-submit-edit-price-form" class="btn btn-primary">提交</button>
                    </div>
                  </div>
                </div>
              </div> -->

              <!-- PAGE CONTENT ENDS -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.page-content-area -->

                    <!-- PAGE CONTENT ENDS -->
              </div><!-- /.page-content -->
            </div>
          </div><!-- /.main-content -->

          <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
          </a>
        </div><!-- /.main-container -->

        <{widget name="smarty_demo:widget/footer_assets/footer_assets.tpl"}>

        <script>
          var data = <{json_encode($data.data)}>;

          var NovalListShow = function() {
            var self = this;
            var inited = false;
            var model = {
              loading: ko.observable(true),
              stats: ko.observableArray()
            };

            this.init = function() {

              if (!inited) {
                ko.applyBindings(model, document.getElementById('noval-list-show-panel'));
                inited = true;
              }
            };

            this.load = function(options) {
              self.init();

              model.loading(true);
              model.stats(data);
              model.loading(false);
              
            }

          };


          NovalListShow.instance = new NovalListShow();


          NovalListShow.instance.load({
            //uid: uid
            uid: 1
          });

        </script>
        </body>
        </html>

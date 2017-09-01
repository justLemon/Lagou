<%@ page language="java" import="java.util.*,com.jobmanager.model.*,org.springframework.web.context.WebApplicationContext
,org.springframework.web.context.support.WebApplicationContextUtils,com.jobmanager.dao.UserDao"
	pageEncoding="utf-8"%>
<% 
    User user = (User)session.getAttribute("loginUser");
	 if (user == null) {
	  	response.sendRedirect("login.jsp");
	  	return;
	 }
	 WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	 UserDao userDao = (UserDao) wac.getBean("userDaoImpl"); 
	 Company company = userDao.findCompanyByUserName(user.getUserName());
%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
</script>
<script type="text/javascript" async="" src="style/js/conversion.js"></script>
<script src="style/js/allmobilize.min.js" charset="utf-8"
	id="allmobilize"></script>
<style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>平潭协创进出口贸易有限公司-拉勾网-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description"
	content="平潭协创进出口贸易有限公司 福建平潭协创进出口贸易有限公司 上海 移动互联网 天使轮 150-500人 测试的发打发打发大范德萨发">
<meta name="keywords"
	content="平潭协创进出口贸易有限公司 福建平潭协创进出口贸易有限公司 上海 移动互联网 天使轮 150-500人 测试的发打发打发大范德萨发">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">

<!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
<script type="text/javascript">
var ctx = "http://www.lagou.com";
console.log(1);
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
<script src="style/js/additional-methods.js" type="text/javascript"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
var youdao_conv_id = 271546; 
</script>
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>
</head>
<body>
	<div id="body">
		<div id="header">
			<div class="wrapper">
				<a href="index.jsp" class="logo"> <img
					src="style/images/logo.png" width="229" height="43"
					alt="拉勾招聘-专注互联网招聘" />
				</a>
				<ul class="reset" id="navheader">
					<li><a href="index.jsp">首页</a></li>


					<% if (user.getUserType().equals("0")){ %>
					<li><a href="companylist.jsp">公司</a></li>
					<li><a href="resume.jsp" rel="nofollow">我的简历</a></li>
					<% } else { %>
					<li class="current"><a href="myhome.jsp">公司</a></li>
					<li><a href="create.jsp" rel="nofollow">发布职位</a></li>
					<li><a rel="nofollow" href="canInterviewResumes.jsp">简历管理</a></li>
					<% } %>
				</ul>
				<% if (user == null) { %>
				<ul class="loginTop">

					<li><a href="login.jsp" rel="nofollow">登录</a></li>
					<li>|</li>
					<li><a href="register.jsp" rel="nofollow">注册</a></li>
				</ul>
				<% } else {%>
				<dl class="collapsible_menu">
					<dt>
						<span><%= user.getUserName() %>&nbsp;</span> <span class="red dn"
							id="noticeDot-0"></span> <i></i>
					</dt>
					<% if (user.getUserType().equals("0")){ %>
					<dd>
						<a rel="nofollow" href="resume.jsp">我的简历</a>
					</dd>
					<dd>
						<a href="collections.jsp">我收藏的职位</a>
					</dd>
					<dd class="logout">
						<a rel="nofollow" href="login.jsp">退出</a>
					</dd>
					<% } else { %>
					<dd style="display: none;">
						<a href="create.jsp">我要招人</a>
					</dd>
					<dd class="btm" style="display: none;">
						<a href="myhome.jsp">我的公司主页</a>
					</dd>
					<dd>
						<a href="accountBind.jsp">帐号设置</a>
					</dd>
					<dd class="logout">
						<a rel="nofollow" href="login.jsp">退出</a>
					</dd>
				</dl>
				<% } } %>

			</div>
		</div>
		<div id="container">
			<!-- <script src="style/js/swfobject_modified.js" type="text/javascript"></script> -->
			<div class="clearfix">

				<div class="content_l">
					<div class="c_detail">
						<div style="background-color: #fff;" class="c_logo">
							<a title="上传公司LOGO" id="logoShow" class="inline cboxElement"
								href="#logoUploader"> <img width="190" height="190"
								alt="公司logo" src="style/images/logo_default.png"> <span>更换公司图片<br>190px*190px
									小于5M
							</span>
							</a>
						</div>

						<!--  			                <div class="c_logo" style="background-color:#fff;">
			                	<div id="logoShow">
			                		<img src="style/images/logo_default.png" width="190" height="190" alt="公司logo" />
		                        	<span>更换公司图片<br />190px*190px 小于5M</span>
		                        </div>
		                        <input onchange="img_check(this,'http://www.lagou.com/cd/saveProfileLogo.json',25927,'logo');" type="file" id="logo" name="logo" title="支持jpg、jpeg、gif、png格式，文件小于5M" />
			                     
			                </div>
		                    <span class="error" id="logo_error" style="display:none;"></span>
						     -->

						<div class="c_box companyName">
							<h2 title=<%= company.getCompanyShortName() == null?"请添加公司信息!":company.getCompanyShortName() %>><%= company.getCompanyShortName() == null?"请添加公司信息!":company.getCompanyShortName() %></h2>

							
							<div class="clear"></div>

							<h1 title=<%= company.getCompanyShortName() == null?"请添加公司信息!":company.getCompanyShortName() %> class="fullname"><%= company.getCompanyShortName() == null?"请添加公司信息!":company.getCompanyShortName() %></h1>

							<form class="clear editDetail dn" id="editDetailForm">
								<input type="text" placeholder="请输入公司简称" maxlength="15"
									value="<%= company.getCompanyShortName() == null?"":company.getCompanyShortName() %>" name="companyShortName"
									id="companyShortName"> <input type="text"
									placeholder="一句话描述公司优势，核心价值，限50字" maxlength="50"
									value="<%= company.getCompanyFeatures() == null?"":company.getCompanyFeatures() %>" name="companyFeatures"
									id="companyFeatures"> <input type="hidden"
									value="<%= company.getCompanyId() == null?"":company.getCompanyId() %>" id="companyId" name="companyId"> <input
									type="submit" value="保存" id="saveDetail" class="btn_small">
								<a id="cancelDetail" class="btn_cancel_s">取消</a>
							</form>

							<div class="clear oneword">
								<img width="17" height="15" src="style/images/quote_l.png">&nbsp;
								<span><%= company.getCompanyFeatures() == null?"请描述公司优势!":company.getCompanyFeatures() %></span> &nbsp;<img width="17" height="15"
									src="style/images/quote_r.png">
							</div>
							<h3 class="dn">已选择标签</h3>
							<ul style="overflow: auto" id="hasLabels" class="reset clearfix">
							 <% if(company.getLabels()== null || company.getLabels().equals("") ){ %>
							    <li class="link">点击添加标签</li>
							 <% 
							    } else { 
							     String [] labels = company.getLabels().split(",");
							     for(int i = 0; i < labels.length; i++) {
							 %>
							    <li><span><%= labels[i] %></span></li>
							 <%  
							     }
							 %>
								
								<li class="link">编辑</li>
							<% } %>
								
							</ul>
							<div class="dn" id="addLabels">
								<input type="hidden" value="1" id="labelPageNo"> <input
									type="submit" value="贴上" class="fr" id="add_label"> <input
									type="text" placeholder="添加自定义标签" name="label" id="label"
									class="label_form fr">
								<div class="clear"></div>
								<ul class="reset clearfix">
								</ul>
								<a id="saveLabels" class="btn_small" href="javascript:void(0)">保存</a>
								<a id="cancelLabels" class="btn_cancel_s"
									href="javascript:void(0)">取消</a>
							</div>
						</div>
						<a title="编辑基本信息" class="c_edit" id="editCompanyDetail"
							href="javascript:void(0);"></a>
						<div class="clear"></div>
					</div>

					<div class="c_breakline"></div>

					<div id="Product">

						<div class="product_wrap">

							<!--无产品 -->
							<dl class="c_section dn">
								<dt>
									<h2>
										<em></em>公司产品
									</h2>
								</dt>
								<dd>
									<div class="addnew">
										酒香不怕巷子深已经过时啦！<br> 把自己优秀的产品展示出来吸引人才围观吧！<br> 
										<a class="product_edit" href="javascript:void(0)">+添加公司产品</a>
									</div>
								</dd>
							</dl>
                        <%
                            boolean showNewPorduct = false;
                           if(company.getProduct()==null || company.getProduct().equals("")){
                        	   showNewPorduct = true;
                           } 
                        %>
							<!--产品编辑-->
							<dl id="newProduct" class="newProduct <%= showNewPorduct ? "" : "dn"  %>">
								<dt>
									<h2>
										<em></em>公司产品
									</h2>
								</dt>
								<dd>
									<form method="post" class="productForm">
										<div class="new_product">

											<div class="product_upload dn productNo">
												<div>
													<span>上传产品图片</span> <br> 尺寸：380*220px 大小：小于5M
												</div>
											</div>
											<div class="product_upload productShow">
												<img width="380" height="220"
													src="style/images/product_default.png"> <span>更换产品图片<br>380*220px
													小于5M
												</span>
											</div>

											<input type="file" title="支持jpg、jpeg、gif、png格式，文件小于5M"
												onchange="product_check(this,'http://www.lagou.com/c/upload.json','productNo','productShow','type','productInfos');"
												name="myfiles" id="myfiles0"> <input type="hidden"
												value="3" name="type" class="type"> <input
												type="hidden" value="images/product_default.png"
												name="productPicUrl" class="productInfos">
										</div>

										<div class="cp_intro">
											<input type="text" placeholder="请输入产品名称" value="<%= company.getProduct() %>" 
												name="product"> <input type="text"
												placeholder="请输入产品网址" value="<%= company.getProductUrl() %>"
												name="productUrl">
											<textarea placeholder="请简短描述该产品定位、产品特色、用户群体等" maxlength="500"
												value="<%= company.getProductProfile() %>"
												class="s_textarea" name="productProfile"></textarea>
											<div class="word_count fr">
												你还可以输入 <span>500</span> 字
											</div>
											<div class="clear"></div>
											<input type="submit" value="保存" class="btn_small"> <a
												class="btn_cancel_s product_delete"
												href="javascript:void(0)">删除</a> <input type="hidden"
												value="11867" class="product_id">
										</div>
									</form>
								</dd>
							</dl>
							<!--有产品-->
							<dl class="c_product <%= showNewPorduct ? "dn" : ""  %>">
								<dt>
									<h2>
										<em></em>公司产品
									</h2>
								</dt>
								<dd>
									<img width="380" height="220" alt="发大发"
										src="style/images/product_default.png">
									<div class="cp_intro">
										<h3>
											<a target="_blank" href=<%= company.getProductUrl() %>><%= company.getProduct() %> </a>
										</h3>
										<div class="scroll-pane"
											style="overflow: hidden; padding: 0px; width: 260px;">

											<div class="jspContainer"
												style="width: 260px; height: 140px;">
												<div class="jspPane"
													style="padding: 0px; top: 0px; width: 260px;">
													<div><%= company.getProductProfile() %></div>
												</div>
											</div>
										</div>
									</div>
									<a title="编辑公司产品" class="c_edit product_edit"
										href="javascript:void(0)"></a> 
										<!--  <a title="新增公司产品"
										class="c_add product_add" href="javascript:void(0)"></a>-->
								</dd>
							</dl>

						</div>
					</div>
					<!-- end #Product -->

					<div id="Profile">
						<div class="profile_wrap">
							<!--无介绍 -->
							<dl class="c_section dn">
								<dt>
									<h2>
										<em></em>公司介绍
									</h2>
								</dt>
								<dd>
									<div class="addnew">
										详细公司的发展历程、让求职者更加了解你!<br> <a id="addIntro"
											href="javascript:void(0)">+添加公司介绍</a>
									</div>
								</dd>
							</dl>
							<!--编辑介绍-->
							<dl class="c_section newIntro dn">
								<dt>
									<h2>
										<em></em>公司介绍
									</h2>
								</dt>
								<dd>
									<form id="companyDesForm">
										<textarea placeholder="请分段详细描述公司简介、企业文化等"
											name="companyProfile" id="companyProfile"><%= company.getCompanyProfile() %></textarea>
										<div class="word_count fr">
											你还可以输入 <span>1000</span> 字
										</div>
										<div class="clear"></div>
										<input type="submit" value="保存" id="submitProfile"
											class="btn_small"> <a id="delProfile"
											class="btn_cancel_s" href="javascript:void(0)">取消</a>
									</form>
								</dd>
							</dl>

							<!--有介绍-->
							<dl class="c_section">
								<dt>
									<h2>
										<em></em>公司介绍
									</h2>
								</dt>
								<dd>
									<div class="c_intro"><%= company.getCompanyProfile()==null?"请输入公司介绍":company.getCompanyProfile() %></div>
									<a title="编辑公司介绍" id="editIntro" class="c_edit"
										href="javascript:void(0)"></a>
								</dd>
							</dl>
						</div>

					</div>
					<!-- end #Profile -->

					<!--[if IE 7]> <br /> <![endif]-->

					<!--无招聘职位-->
					<dl id="noJobs" class="c_section">
						<dt>
							<h2>
								<em></em>招聘职位
							</h2>
						</dt>
						<dd>
							<div class="addnew">
								发布需要的人才信息，让伯乐和千里马尽快相遇……<br> <a href="create.jsp">+添加招聘职位</a>
							</div>
						</dd>
					</dl>

					<input type="hidden" value="" name="hasNextPage" id="hasNextPage">
					<input type="hidden" value="" name="pageNo" id="pageNo"> <input
						type="hidden" value="" name="pageSize" id="pageSize">
					<div id="flag"></div>
				</div>
				<!-- end .content_l -->

				<div class="content_r">
					<div id="Tags">
						<div id="c_tags_show" class="c_tags solveWrap">
							<table>
								<tbody>
									<tr>
										<td width="45">地点</td>
										<td><%= company.getCity()==null?"请输入地点":company.getCity() %></td>
									</tr>
									<tr>
										<td>领域</td>
										<!-- 支持多选 -->
										<td title="移动互联网"><%= company.getIndustryField()==null?"请输入领域":company.getIndustryField() %></td>
									</tr>
									<tr>
										<td>规模</td>
										<td><%= company.getCompanySize()==null?"请输入规模":company.getCompanySize() %></td>
									</tr>
									<tr>
										<td>主页</td>
										<td><a rel="nofollow" title="<%= company.getCompanyUrl()==null?"请输入主页":company.getCompanyUrl() %>"
											target="_blank" href="<%= company.getCompanyUrl()==null?"":company.getCompanyUrl() %>"><%= company.getCompanyUrl()==null?"请输入主页":company.getCompanyUrl() %></a>
										</td>
									</tr>
								</tbody>
							</table>
							<a id="editTags" class="c_edit" href="javascript:void(0)"></a>
						</div>
						<div id="c_tags_edit" class="c_tags editTags dn">
							<form id="tagForms">
								<table>
									<tbody>
										<tr>
											<td>地点</td>
											<td><input type="text" placeholder="请输入地点" value="<%= company.getCity()==null?"":company.getCity() %>"
												name="city" id="city"></td>
										</tr>
										<tr>
											<td>领域</td>
											<!-- 支持多选 -->
											<td><input type="hidden" value="<%= company.getIndustryField()==null?"":company.getIndustryField() %>"
												id="industryField" name="industryField"> <input
												type="button"
												style="background: none; cursor: default; border: none !important;"
												disable="disable" value="<%= company.getIndustryField()==null?"":company.getIndustryField() %>" id="select_ind"
												class="select_tags"> <!-- <div id="box_ind" class="selectBox dn">
		                                    <ul class="reset">
			                                    				                        							                            			<li class="current">移动互联网</li>
				                            							                            		                                    </ul>
		                                </div>	 --></td>
										</tr>
										<tr>
											<td>规模</td>
											<td><input type="hidden" value="<%= company.getCompanySize()==null?"":company.getCompanySize() %>" 
												id="companySize" name="companySize"> <input
												type="button" value="<%= company.getCompanySize()==null?"":company.getCompanySize() %>" id="select_sca"
												class="select_tags">
												<div class="selectBox dn" id="box_sca"
													style="display: none;">
													<ul class="reset">
														<li class="<%= "少于15人".equals(company.getCompanySize())?"current":"" %>">少于15人</li>
														<li class="<%= "15-50人".equals(company.getCompanySize())?"current":"" %>">15-50人</li>
														<li class="<%= "50-150人".equals(company.getCompanySize())?"current":"" %>">50-150人</li>
														<li class="<%= "150-500人".equals(company.getCompanySize())?"current":"" %>">150-500人</li>
														<li class="<%= "500-2000人".equals(company.getCompanySize())?"current":"" %>">500-2000人</li>
														<li class="<%= "2000人以上".equals(company.getCompanySize())?"current":"" %>">2000人以上</li>
													</ul>
												</div></td>
										</tr>
										<tr>
											<td>主页</td>
											<td><input type="text" placeholder="请输入网址"
												value="<%= company.getCompanyUrl()==null?"":company.getCompanyUrl() %>" name="companyUrl"
												id="companyUrl"></td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" id="comCity" value="<%= company.getCity()==null?"":company.getCity() %>"> <input
									type="hidden" id="comInd" value="<%= company.getIndustryField()==null?"":company.getIndustryField() %>"> <input
									type="hidden" id="comSize" value="<%= company.getCompanySize()==null?"":company.getCompanySize() %>"> <input
									type="hidden" id="comUrl" value="<%= company.getCompanyUrl()==null?"":company.getCompanyUrl() %>">
								<input type="submit" value="保存" id="submitFeatures"
									class="btn_small"> <a id="cancelFeatures"
									class="btn_cancel_s" href="javascript:void(0)">取消</a>
								<div class="clear"></div>
							</form>
						</div>
					</div>
					<!-- end #Tags -->

					


				

					<!--公司深度报道-->
	

			<!-------------------------------------弹窗lightbox  ----------------------------------------->
			<div style="display: none;">
				<div style="width: 650px; height: 470px;" class="popup"
					id="logoUploader">
					<object width="650" height="470"
						classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="FlashID">
						<param
							value="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json"
							name="movie">
						<param value="high" name="quality">
						<param value="opaque" name="wmode">
						<param value="111.0.0.0" name="swfversion">
						<!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
						<param value="../../Scripts/expressInstall.swf"
							name="expressinstall">
						<!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
						<!--[if !IE]>-->
						<object width="650" height="470"
							data="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json"
							type="application/x-shockwave-flash">
							<!--<![endif]-->
							<param value="high" name="quality">
							<param value="opaque" name="wmode">
							<param value="111.0.0.0" name="swfversion">
							<param value="../../Scripts/expressInstall.swf"
								name="expressinstall">
							<!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
							<div>
								<h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
								<p>
									<a href="http://www.adobe.com/go/getflashplayer"><img
										width="112" height="33"
										src="style/images/get_flash_player.gif"
										alt="获取 Adobe Flash Player"></a>
								</p>
							</div>
							<!--[if !IE]>-->
						</object>
						<!--<![endif]-->
					</object>
				</div>
				<!-- #logoUploader -->
			</div>
			<!------------------------------------- end ----------------------------------------->

			<script src="style/js/company.min.js" type="text/javascript"></script>
			<script>
var avatar = {};
avatar.uploadComplate = function( data ){
	var result = eval('('+ data +')');
	if(result.success){
		jQuery('#logoShow img').attr("src",ctx+ '/'+result.content);
		jQuery.colorbox.close();
	}
};
</script>
			<div class="clear"></div>
			<input type="hidden" value="d1035b6caa514d869727cff29a1c2e0c"
				id="resubmitToken"> <a rel="nofollow" title="回到顶部"
				id="backtop" style="display: inline;"></a>
		</div>
		<!-- end #container -->
	</div>
	<!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			<a rel="nofollow" target="_blank" href="about.html">联系我们</a> <a
				target="_blank" href="http://www.lagou.com/af/zhaopin.html">互联网公司导航</a>
			<a rel="nofollow" target="_blank" href="http://e.weibo.com/lagou720">拉勾微博</a>
			<a rel="nofollow" href="javascript:void(0)" class="footer_qr">拉勾微信<i></i></a>
			<div class="copyright">
				&copy;2017-2018 Lagou <a
					href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action"
					target="_blank">京ICP备14023790号-2</a>
			</div>
		</div>
	</div>

	<script src="style/js/core.min.js" type="text/javascript"></script>
	<script src="style/js/popup.min.js" type="text/javascript"></script>

	<!--  -->


	<div id="cboxOverlay" style="display: none;"></div>
	<div id="colorbox" class="" role="dialog" tabindex="-1"
		style="display: none;">
		<div id="cboxWrapper">
			<div>
				<div id="cboxTopLeft" style="float: left;"></div>
				<div id="cboxTopCenter" style="float: left;"></div>
				<div id="cboxTopRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxMiddleLeft" style="float: left;"></div>
				<div id="cboxContent" style="float: left;">
					<div id="cboxTitle" style="float: left;"></div>
					<div id="cboxCurrent" style="float: left;"></div>
					<button type="button" id="cboxPrevious"></button>
					<button type="button" id="cboxNext"></button>
					<button id="cboxSlideshow"></button>
					<div id="cboxLoadingOverlay" style="float: left;"></div>
					<div id="cboxLoadingGraphic" style="float: left;"></div>
				</div>
				<div id="cboxMiddleRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxBottomLeft" style="float: left;"></div>
				<div id="cboxBottomCenter" style="float: left;"></div>
				<div id="cboxBottomRight" style="float: left;"></div>
			</div>
		</div>
		<div
			style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
	</div>
</body>
</html>

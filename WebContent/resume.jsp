<%@ page language="java" import="java.util.*,com.jobmanager.model.*,org.springframework.web.context.WebApplicationContext
,org.springframework.web.context.support.WebApplicationContextUtils,com.jobmanager.dao.UserDao" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb"><head>
<script type="text/javascript" async="" src="style/js/conversion.js"></script>
<script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
<style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link  media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>我的简历-拉勾网-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="拉勾网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在拉勾网">
<meta name="keywords" content="拉勾,拉勾网,拉勾招聘,拉钩, 拉钩网 ,互联网招聘,拉勾互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 拉勾官网, 拉勾百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">
<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link href="h/images/favicon.ico" rel="Shortcut Icon">
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
<script src="style/js/ajaxCross.json" charset="UTF-8"></script></head>
<body>
<div id="body">
<% 
    User user = (User)session.getAttribute("loginUser");
	  if (user == null) {
	  	response.sendRedirect("login.jsp");
	  	return;
	  }
	  WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	  UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
	  Employee employee = userDao.findEmployeeByName(user.getUserName());
	  List<EmployeeWokExp> exps = userDao.findEmployeeWokExpByName(user.getUserName());
	  List<EmployeeProject> projects = userDao.findEmployeeProjectByName(user.getUserName());
	  List<EmployeeEdu> edus = userDao.findEmployeeEduByName(user.getUserName());
	  boolean showWokExp = false, showEdus = false, showProjects = false;
	  if(exps != null & exps.size()!= 0){
		  showWokExp = true;
	  }
	  if(edus != null & edus.size()!= 0){
		  showEdus = true;
	  }
	  if(projects != null & projects.size()!= 0){
		  showProjects = true;
	  }
  %>
	<div id="header">
    	<div class="wrapper">
    		<a href="index.jsp" class="logo">
    			<img src="style/images/logo.png" width="229" height="43" alt="拉勾招聘-专注互联网招聘" />
    		</a>
    		<ul class="reset" id="navheader">
    			<li><a href="index.jsp">首页</a></li>
    			<li ><a href="companylist.jsp" >公司</a></li>
    	
    	<% if (user.getUserType().equals("0")){ %>
    			<li class="current"><a href="resume.jsp" rel="nofollow" >我的简历</a></li>
    	<% } else { %>
	    		<li ><a href="create.html" rel="nofollow">发布职位</a></li>
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
           			<span><%= user.getUserName() %>&nbsp;</span> 
            		<span class="red dn" id="noticeDot-0"></span>
            		<i></i>
            	</dt>
         <% if (user.getUserType().equals("0")){ %>
                <dd><a rel="nofollow" href="resume.jsp">我的简历</a></dd>
                <dd><a href="collections.jsp">我收藏的职位</a></dd>
                <dd class="logout"><a rel="nofollow" href="login.jsp">退出</a></dd>
         <% } else { %>
                <dd><a href="create.html">我要招人</a></dd>
                <dd><a href="accountBind.html">帐号设置</a></dd>
                <dd class="logout"><a rel="nofollow" href="login.jsp">退出</a></dd>
            </dl>
            <% } } %>
          
                                </div>
    </div>
    <div id="container">
        
  		<div class="clearfix">
            <div class="content_l">
            	<div class="fl" id="resume_name">
	            	<div class="nameShow fl">
	            		<h1 title="jason的简历"><%= user.getUserName() %>的简历</h1>
	            		<span class="rename">重命名</span> | <a target="_blank" href="h/resume/preview.html">预览</a>
            		</div>
            		<form class="fl dn" id="resumeNameForm">
            			<input type="text" value="jason的简历" name="resumeName" class="nameEdit c9">	
            			<input type="submit" value="保存"> | <a target="_blank" href="h/resume/preview.html">预览</a>
            		</form>
            	</div><!--end #resume_name-->
            	<div class="fr c5" id="lastChangedTime">最后一次更新：<span>2014-07-01 15:14 </span></div><!--end #lastChangedTime-->
            	

            	<div class="profile_box" id="basicInfo">
            		<h2>基本信息</h2>
            		<span class="c_edit" id="btn-bsInfo-edit"></span>
            		<div class="basicShow">
            		<% if(employee != null) { %>
            		  <span><%=employee.getName() %> |  <%=employee.getSex() %> |    <%=employee.getHighestEducation() %> |   <%=employee.getWorkYear() %>工作经验<br>
            			     <%=employee.getPhone() %> | <%=employee.getEmail() %><br>
            			</span>
            		<% } else { %>
            		<span>请先填写个人基本信息
            			</span>
            		<% } %>
            		</div><!--end .basicShow-->

            		<div class="basicEdit dn">
            			<form id="profileForm">
						  <table>
						    <tbody><tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td>
						        <input type="text" placeholder="姓名" value="" name="name" id="name">
						      </td>
						      <td valign="top"></td> 
						      <td>
						          <ul class="profile_radio clearfix reset">
						            <li class="current">
						           	  	 男<em></em>
						              	<input type="radio" checked="checked" name="gender" value="男"> 
						            </li>
						            <li>
						            	  女<em></em>
						              	<input type="radio" name="gender" value="女"> 
						            </li>
						          </ul>  
						      </td>
						    </tr>
						    <tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td>
						      	<input type="hidden" id="topDegree" value="大专" name="topDegree">
						        <input type="button" value="大专" id="select_topDegree" class="profile_select_190 profile_select_normal">
								<div class="boxUpDown boxUpDown_190 dn" id="box_topDegree" style="display: none;">
						        	<ul>
						        								        			<li>大专</li>
						        								        			<li>本科</li>
						        								        			<li>硕士</li>
						        								        			<li>博士</li>
						        								        			<li>其他</li>
						        								        	</ul>
						        </div>  
						      </td>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td>
						          <input type="hidden" id="workyear" value="" name="workyear">
						          <input type="button" value="" id="select_workyear" class="profile_select_190 profile_select_normal">
								  <div class="boxUpDown boxUpDown_190 dn" id="box_workyear" style="display: none;">
						          	 <ul>
						        								        			<li>应届毕业生</li>
						        								        			<li>1年</li>
						        								        			<li>2年</li>
						        								        			<li>3年</li>
						        								        			<li>4年</li>
						        								        			<li>5年</li>
						        								        			<li>6年</li>
						        								        			<li>7年</li>
						        								        			<li>8年</li>
						        								        			<li>9年</li>
						        								        			<li>10年</li>
						        								        			<li>10年以上</li>
						        								        	 </ul>
						          </div>  
						      </td>
						    </tr>
						    <tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td colspan="3">
						          <input type="text" placeholder="手机号码" name="tel" id="tel">
						      </td>
						   	</tr>
						   	<tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td colspan="3">
						          <input type="text" placeholder="接收面试通知的邮箱" name="email" id="email">
						      </td>
						    </tr>
						    <tr>
						      <td valign="top"> </td> 
						      <td colspan="3">
						          <input type="hidden" id="currentState" value="" name="currentState">
						          <input type="button" value="目前状态" id="select_currentState" class="profile_select_410 profile_select_normal">
								  <div class="boxUpDown boxUpDown_410 dn" id="box_currentState" style="display: none;">
						          	  <ul>
						        								        			<li>我目前已离职，可快速到岗</li>
						        								        			<li>我目前正在职，正考虑换个新环境</li>
						        								        			<li>我暂时不想找工作</li>
						        								        			<li>我是应届毕业生</li>
						        								        	  </ul>
						          </div>  
						      </td>
						    </tr>
						    <tr>
						      <td></td> 
						      <td colspan="3">
						          <input type="submit" value="保 存" class="btn_profile_save">
						          <a class="btn_profile_cancel" href="javascript:;">取 消</a>
						      </td>
						    </tr>
						  </tbody></table>
						</form><!--end #profileForm-->
						            		</div><!--end .basicEdit-->
            		<input type="hidden" id="nameVal" value=<%= employee==null? "" : employee.getName()%>>
            		<input type="hidden" id="genderVal" value=<%= employee==null? "" : employee.getSex() %>>
            		<input type="hidden" id="topDegreeVal" value=<%= employee==null? "" : employee.getHighestEducation() %>>
            		<input type="hidden" id="workyearVal" value=<%= employee==null? "" : employee.getWorkYear() %>>
            		<input type="hidden" id="currentStateVal" value=<%= employee==null? "" : employee.getStatus() %>>
            		<input type="hidden" id="emailVal" value=<%= employee==null? "" : employee.getEmail() %>>
            		<input type="hidden" id="telVal" value=<%= employee==null? "" : employee.getPhone() %>>
            		<input type="hidden" id="pageType" value="1"> 
            	</div><!--end #basicInfo-->

            	<div class="profile_box" id="expectJob">
            		<h2>期望工作</h2>
            		            		<span class="c_edit dn"></span>
            		<div class="expectShow dn">
            		            			<span></span>
            		</div><!--end .expectShow-->
            		<div class="expectEdit dn">
            			<form id="expectForm">
	            			<table>
	            				<tbody><tr>
	            					<td>
	            						<input type="hidden" id="expectCity" value="" name="expectCity">
	            													        	<input type="button" value="期望城市，如：北京" id="select_expectCity" class="profile_select_287 profile_select_normal">
																				<div class="boxUpDown boxUpDown_596 dn" id="box_expectCity" style="display: none;">
								          									        		<dl>
								        			<dt>热门城市</dt>
								        			<dd>
									        												        				<span>北京</span>
									        												        				<span>上海</span>
									        												        				<span>广州</span>
									        												        				<span>深圳</span>
									        												        				<span>成都</span>
									        												        				<span>杭州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>ABCDEF</dt>
								        			<dd>
									        												        				<span>北京</span>
									        												        				<span>长春</span>
									        												        				<span>成都</span>
									        												        				<span>重庆</span>
									        												        				<span>长沙</span>
									        												        				<span>常州</span>
									        												        				<span>东莞</span>
									        												        				<span>大连</span>
									        												        				<span>佛山</span>
									        												        				<span>福州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>GHIJ</dt>
								        			<dd>
									        												        				<span>贵阳</span>
									        												        				<span>广州</span>
									        												        				<span>哈尔滨</span>
									        												        				<span>合肥</span>
									        												        				<span>海口</span>
									        												        				<span>杭州</span>
									        												        				<span>惠州</span>
									        												        				<span>金华</span>
									        												        				<span>济南</span>
									        												        				<span>嘉兴</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>KLMN</dt>
								        			<dd>
									        												        				<span>昆明</span>
									        												        				<span>廊坊</span>
									        												        				<span>宁波</span>
									        												        				<span>南昌</span>
									        												        				<span>南京</span>
									        												        				<span>南宁</span>
									        												        				<span>南通</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>OPQR</dt>
								        			<dd>
									        												        				<span>青岛</span>
									        												        				<span>泉州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>STUV</dt>
								        			<dd>
									        												        				<span>上海</span>
									        												        				<span>石家庄</span>
									        												        				<span>绍兴</span>
									        												        				<span>沈阳</span>
									        												        				<span>深圳</span>
									        												        				<span>苏州</span>
									        												        				<span>天津</span>
									        												        				<span>太原</span>
									        												        				<span>台州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>WXYZ</dt>
								        			<dd>
									        												        				<span>武汉</span>
									        												        				<span>无锡</span>
									        												        				<span>温州</span>
									        												        				<span>西安</span>
									        												        				<span>厦门</span>
									        												        				<span>烟台</span>
									        												        				<span>珠海</span>
									        												        				<span>中山</span>
									        												        				<span>郑州</span>
									        											        			</dd>
								        	  	</dl>
								        									        </div>  
	            					</td>
	            					<td>
	            						<ul class="profile_radio clearfix reset">
	            								            								<li class="current">
									             	 全职<em></em>
									              	<input type="radio" checked="" name="type" value="全职"> 
									            </li>
									            <li>
									              	兼职<em></em>
									              	<input type="radio" name="type" value="兼职"> 
									            </li>
									            <li>
									            	  实习<em></em>
									              	<input type="radio" name="type" value="实习"> 
									            </li>
								            								        </ul> 
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	<input type="text" placeholder="期望职位，如：产品经理" value="" name="expectPosition" id="expectPosition">
									</td>
	            					<td>
	            						<input type="hidden" id="expectSalary" value="" name="expectSalary">
	            							            						<input type="button" value="期望月薪" id="select_expectSalary" class="profile_select_287 profile_select_normal">
	            													        	<div class="boxUpDown boxUpDown_287 dn" id="box_expectSalary" style="display: none;">
								          	  <ul>
								        										        			<li>2k以下</li>
								        										        			<li>2k-5k</li>
								        										        			<li>5k-10k</li>
								        										        			<li>10k-15k</li>
								        										        			<li>15k-25k</li>
								        										        			<li>25k-50k</li>
								        										        			<li>50k以上</li>
								        										        	  </ul>
								         </div>  
	            					</td>
	            				</tr>
	            				<tr>
	            					<td colspan="2">
										<input type="submit" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end #expectForm-->
            		</div><!--end .expectEdit-->
            		            		<div class="expectAdd pAdd">
            		            			填写准确的期望工作能大大提高求职成功率哦…<br>
						快来添加期望工作吧！
						<span>添加期望工作</span>
            		</div><!--end .expectAdd-->
            		
            		<input type="hidden" id="expectJobVal" value=<%= employee==null? "" : employee.getPositionName() %>>
            		<input type="hidden" id="expectCityVal" value=<%= employee==null? "" : employee.getCity() %>>
            		<input type="hidden" id="typeVal" value=<%= employee==null? "" : employee.getPositionType() %>>
            		<input type="hidden" id="expectPositionVal" value=<%= employee==null? "" : employee.getPositionName() %>>
            		<input type="hidden" id="expectSalaryVal" value=<%= employee==null? "" : employee.getSalarys() %>>
            	</div><!--end #expectJob-->
            		
            	<div class="profile_box" id="workExperience">
            		<h2>工作经历  <span> （投递简历时必填）</span></h2>
            		            		<span class="c_add  <%= showWokExp ? "" : "dn" %>"></span>
            		<div class="experienceShow <%= showWokExp ? "" : "dn" %> ">
            		            			<form class="experienceForm borderBtm dn">
	            			<table>
	            				<tbody><tr>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="公司名称" name="companyName" class="companyName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							          	<input type="text" placeholder="职位名称，如：产品经理" name="positionName" class="positionName">
							      	</td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="companyYearStart" value="" name="companyYearStart">
								        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_companyYearStart">
											<div class="box_companyYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									        											        			<li>2014</li>
									        											        			<li>2013</li>
									        											        			<li>2012</li>
									        											        			<li>2011</li>
									        											        			<li>2010</li>
									        											        			<li>2009</li>
									        											        			<li>2008</li>
									        											        			<li>2007</li>
									        											        			<li>2006</li>
									        											        			<li>2005</li>
									        											        			<li>2004</li>
									        											        			<li>2003</li>
									        											        			<li>2002</li>
									        											        			<li>2001</li>
									        											        			<li>2000</li>
									        											        			<li>1999</li>
									        											        			<li>1998</li>
									        											        			<li>1997</li>
									        											        			<li>1996</li>
									        											        			<li>1995</li>
									        											        			<li>1994</li>
									        											        			<li>1993</li>
									        											        			<li>1992</li>
									        											        			<li>1991</li>
									        											        			<li>1990</li>
									        											        			<li>1989</li>
									        											        			<li>1988</li>
									        											        			<li>1987</li>
									        											        			<li>1986</li>
									        											        			<li>1985</li>
									        											        			<li>1984</li>
									        											        			<li>1983</li>
									        											        			<li>1982</li>
									        											        			<li>1981</li>
									        											        			<li>1980</li>
									        											        			<li>1979</li>
									        											        			<li>1978</li>
									        											        			<li>1977</li>
									        											        			<li>1976</li>
									        											        			<li>1975</li>
									        											        			<li>1974</li>
									        											        			<li>1973</li>
									        											        			<li>1972</li>
									        											        			<li>1971</li>
									        											        			<li>1970</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="companyMonthStart" value="" name="companyMonthStart">
								        	<input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_companyMonthStart">
											<div style="display: none;" class="box_companyMonthStart boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
									        	</ul>
									        </div>
									    </div>
									    <div class="clear"></div>
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="companyYearEnd" value="" name="companyYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_companyYearEnd">
											<div class="box_companyYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li>至今</li>
									        											        			<li>2014</li>
									        											        			<li>2013</li>
									        											        			<li>2012</li>
									        											        			<li>2011</li>
									        											        			<li>2010</li>
									        											        			<li>2009</li>
									        											        			<li>2008</li>
									        											        			<li>2007</li>
									        											        			<li>2006</li>
									        											        			<li>2005</li>
									        											        			<li>2004</li>
									        											        			<li>2003</li>
									        											        			<li>2002</li>
									        											        			<li>2001</li>
									        											        			<li>2000</li>
									        											        			<li>1999</li>
									        											        			<li>1998</li>
									        											        			<li>1997</li>
									        											        			<li>1996</li>
									        											        			<li>1995</li>
									        											        			<li>1994</li>
									        											        			<li>1993</li>
									        											        			<li>1992</li>
									        											        			<li>1991</li>
									        											        			<li>1990</li>
									        											        			<li>1989</li>
									        											        			<li>1988</li>
									        											        			<li>1987</li>
									        											        			<li>1986</li>
									        											        			<li>1985</li>
									        											        			<li>1984</li>
									        											        			<li>1983</li>
									        											        			<li>1982</li>
									        											        			<li>1981</li>
									        											        			<li>1980</li>
									        											        			<li>1979</li>
									        											        			<li>1978</li>
									        											        			<li>1977</li>
									        											        			<li>1976</li>
									        											        			<li>1975</li>
									        											        			<li>1974</li>
									        											        			<li>1973</li>
									        											        			<li>1972</li>
									        											        			<li>1971</li>
									        											        			<li>1970</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="companyMonthEnd" value="" name="companyMonthEnd">
								        	<input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_companyMonthEnd">
											<div style="display: none;" class="box_companyMonthEnd boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="expId" value="">
            			</form><!--end .experienceForm-->
            			
            			<ul class="wlist clearfix">
            			 <% if(exps != null && exps.size() != 0){ 
            			       for(int i = 0; i < exps.size(); i++){%>
            			   <li data-id=<%= exps.get(i).getExpid() %> class="clear">
                             <i class="sm_del dn"></i>
                             <i class="sm_edit dn"></i>
                             <span class="c9" data-startYear=<%= exps.get(i).getStartYear() %> data-endYear=<%= exps.get(i).getEndYear() %> data-startMonth = <%= exps.get(i).getStartMonth() %> 
                               data-endMonth = <%= exps.get(i).getEndMonth() %> > <%= exps.get(i).getStartYear() %>/<%= exps.get(i).getStartMonth() %>-<%= exps.get(i).getEndYear() %>/<%= exps.get(i).getEndMonth() %></span>
                               <div><img src="" width="56" height="56" alt="" />
                               <h3><%= exps.get(i).getPositionName() %></h3>
                               <h4><%= exps.get(i).getCompanyName() %></h4></div></li>
            			 <% } }%>
            			</ul>
            		</div><!--end .experienceShow-->
            		<div class="experienceEdit dn">
            			<form class="experienceForm">
	            			<table>
	            				<tbody><tr>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="公司名称" name="companyName" class="companyName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							          	<input type="text" placeholder="职位名称，如：产品经理" name="positionName" class="positionName">
							      	</td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="companyYearStart" value="" name="companyYearStart">
								        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_companyYearStart">
											<div class="box_companyYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									        											        			<li>2014</li>
									        											        			<li>2013</li>
									        											        			<li>2012</li>
									        											        			<li>2011</li>
									        											        			<li>2010</li>
									        											        			<li>2009</li>
									        											        			<li>2008</li>
									        											        			<li>2007</li>
									        											        			<li>2006</li>
									        											        			<li>2005</li>
									        											        			<li>2004</li>
									        											        			<li>2003</li>
									        											        			<li>2002</li>
									        											        			<li>2001</li>
									        											        			<li>2000</li>
									        											        			<li>1999</li>
									        											        			<li>1998</li>
									        											        			<li>1997</li>
									        											        			<li>1996</li>
									        											        			<li>1995</li>
									        											        			<li>1994</li>
									        											        			<li>1993</li>
									        											        			<li>1992</li>
									        											        			<li>1991</li>
									        											        			<li>1990</li>
									        											        			<li>1989</li>
									        											        			<li>1988</li>
									        											        			<li>1987</li>
									        											        			<li>1986</li>
									        											        			<li>1985</li>
									        											        			<li>1984</li>
									        											        			<li>1983</li>
									        											        			<li>1982</li>
									        											        			<li>1981</li>
									        											        			<li>1980</li>
									        											        			<li>1979</li>
									        											        			<li>1978</li>
									        											        			<li>1977</li>
									        											        			<li>1976</li>
									        											        			<li>1975</li>
									        											        			<li>1974</li>
									        											        			<li>1973</li>
									        											        			<li>1972</li>
									        											        			<li>1971</li>
									        											        			<li>1970</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="companyMonthStart" value="" name="companyMonthStart">
								        	<input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_companyMonthStart">
											<div style="display: none;" class="box_companyMonthStart boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
									        	</ul>
									        </div>
									    </div>
									    <div class="clear"></div>
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="companyYearEnd" value="" name="companyYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_companyYearEnd">
											<div class="box_companyYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li>至今</li>
									        											        			<li>2014</li>
									        											        			<li>2013</li>
									        											        			<li>2012</li>
									        											        			<li>2011</li>
									        											        			<li>2010</li>
									        											        			<li>2009</li>
									        											        			<li>2008</li>
									        											        			<li>2007</li>
									        											        			<li>2006</li>
									        											        			<li>2005</li>
									        											        			<li>2004</li>
									        											        			<li>2003</li>
									        											        			<li>2002</li>
									        											        			<li>2001</li>
									        											        			<li>2000</li>
									        											        			<li>1999</li>
									        											        			<li>1998</li>
									        											        			<li>1997</li>
									        											        			<li>1996</li>
									        											        			<li>1995</li>
									        											        			<li>1994</li>
									        											        			<li>1993</li>
									        											        			<li>1992</li>
									        											        			<li>1991</li>
									        											        			<li>1990</li>
									        											        			<li>1989</li>
									        											        			<li>1988</li>
									        											        			<li>1987</li>
									        											        			<li>1986</li>
									        											        			<li>1985</li>
									        											        			<li>1984</li>
									        											        			<li>1983</li>
									        											        			<li>1982</li>
									        											        			<li>1981</li>
									        											        			<li>1980</li>
									        											        			<li>1979</li>
									        											        			<li>1978</li>
									        											        			<li>1977</li>
									        											        			<li>1976</li>
									        											        			<li>1975</li>
									        											        			<li>1974</li>
									        											        			<li>1973</li>
									        											        			<li>1972</li>
									        											        			<li>1971</li>
									        											        			<li>1970</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="companyMonthEnd" value="" name="companyMonthEnd">
								        	<input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_companyMonthEnd">
											<div style="display: none;" class="box_companyMonthEnd boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="expId" value="">
            			</form><!--end .experienceForm-->
            		</div><!--end .experienceEdit-->
            		
            		            		<div class="experienceAdd pAdd <%= showWokExp ? "dn" : "" %>">
            		            			工作经历最能体现自己的工作能力，<br>
						且完善后才可投递简历哦！
						<span>添加工作经历</span>
            		</div><!--end .experienceAdd-->
            	</div><!--end #workExperience-->

            	<div class="profile_box" id="projectExperience">
            		<h2>项目经验</h2>
            		            		<span class="c_add <%= showProjects ? "" : "dn" %>"></span>
            		<div class="projectShow <%= showProjects ? "" : "dn" %>">
 		            			<ul class="plist clearfix">
 		            			 <% if(showProjects){ 
 		            			   for(int i = 0; i < projects.size(); i++){
 		            				   EmployeeProject temp = projects.get(i);
 		            			 %>
   		            	<li data-id= <%= temp.getProjectid() %>>
                        <div class="projectList">
                          <i class="sm_del dn"></i><i class="sm_edit dn"></i>
                          <div class="f16 mb10" data-proName=<%= temp.getProjectName()%> data-posName=<%= temp.getPositionName()%> data-startY=<%= temp.getStartYear()%> data-startM= <%= temp.getStartMonth()%> data-endY=<%= temp.getEndYear()%> data-endM=<%= temp.getEndMonth()%>>
                          <%= temp.getProjectName()%>/<%= temp.getPositionName()%>
                          <span class="c9">（ <%= temp.getStartYear()%>/ <%= temp.getStartMonth()%>-<%= temp.getEndYear().equals("至今")? temp.getEndYear(): (temp.getEndYear() + "/" + temp.getEndMonth())%>）</span>
                          </div>
                          <div class="dl1"><%= temp.getProjectRemark() %></div>
                        </div></li>
   		            			 <% } }%>
    			            	</ul>
            		</div><!--end .projectShow-->
            		<div class="projectEdit dn">
            			<form class="projectForm">
	            			<table>
	            				<tbody><tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="项目名称" name="projectName" class="projectName">
							      	</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							          	<input type="text" placeholder="担任职务，如：产品负责人" name="thePost" class="thePost">
							      	</td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="projectYearStart" value="" name="projectYearStart">
								        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_projectYearStart">
											<div class="box_projectYearStart  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									        											        			<li>2014</li>
									        											        			<li>2013</li>
									        											        			<li>2012</li>
									        											        			<li>2011</li>
									        											        			<li>2010</li>
									        											        			<li>2009</li>
									        											        			<li>2008</li>
									        											        			<li>2007</li>
									        											        			<li>2006</li>
									        											        			<li>2005</li>
									        											        			<li>2004</li>
									        											        			<li>2003</li>
									        											        			<li>2002</li>
									        											        			<li>2001</li>
									        											        			<li>2000</li>
									        											        			<li>1999</li>
									        											        			<li>1998</li>
									        											        			<li>1997</li>
									        											        			<li>1996</li>
									        											        			<li>1995</li>
									        											        			<li>1994</li>
									        											        			<li>1993</li>
									        											        			<li>1992</li>
									        											        			<li>1991</li>
									        											        			<li>1990</li>
									        											        			<li>1989</li>
									        											        			<li>1988</li>
									        											        			<li>1987</li>
									        											        			<li>1986</li>
									        											        			<li>1985</li>
									        											        			<li>1984</li>
									        											        			<li>1983</li>
									        											        			<li>1982</li>
									        											        			<li>1981</li>
									        											        			<li>1980</li>
									        											        			<li>1979</li>
									        											        			<li>1978</li>
									        											        			<li>1977</li>
									        											        			<li>1976</li>
									        											        			<li>1975</li>
									        											        			<li>1974</li>
									        											        			<li>1973</li>
									        											        			<li>1972</li>
									        											        			<li>1971</li>
									        											        			<li>1970</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="projectMonthStart" value="" name="projectMonthStart">
								        	<input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_projectMonthStart">
											<div style="display: none;" class="box_projectMonthStart boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
	            						<div class="fl">
		            						<input type="hidden" class="projectYearEnd" value="" name="projectYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_projectYearEnd">
											<div class="box_projectYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li>至今</li>
									        											        			<li>2014</li>
									        											        			<li>2013</li>
									        											        			<li>2012</li>
									        											        			<li>2011</li>
									        											        			<li>2010</li>
									        											        			<li>2009</li>
									        											        			<li>2008</li>
									        											        			<li>2007</li>
									        											        			<li>2006</li>
									        											        			<li>2005</li>
									        											        			<li>2004</li>
									        											        			<li>2003</li>
									        											        			<li>2002</li>
									        											        			<li>2001</li>
									        											        			<li>2000</li>
									        											        			<li>1999</li>
									        											        			<li>1998</li>
									        											        			<li>1997</li>
									        											        			<li>1996</li>
									        											        			<li>1995</li>
									        											        			<li>1994</li>
									        											        			<li>1993</li>
									        											        			<li>1992</li>
									        											        			<li>1991</li>
									        											        			<li>1990</li>
									        											        			<li>1989</li>
									        											        			<li>1988</li>
									        											        			<li>1987</li>
									        											        			<li>1986</li>
									        											        			<li>1985</li>
									        											        			<li>1984</li>
									        											        			<li>1983</li>
									        											        			<li>1982</li>
									        											        			<li>1981</li>
									        											        			<li>1980</li>
									        											        			<li>1979</li>
									        											        			<li>1978</li>
									        											        			<li>1977</li>
									        											        			<li>1976</li>
									        											        			<li>1975</li>
									        											        			<li>1974</li>
									        											        			<li>1973</li>
									        											        			<li>1972</li>
									        											        			<li>1971</li>
									        											        			<li>1970</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="projectMonthEnd" value="" name="projectMonthEnd">
								        	<input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_projectMonthEnd">
											<div style="display: none;" class="box_projectMonthEnd boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td valign="top"></td> 
									<td colspan="3">
										<textarea class="projectDescription s_textarea" name="projectDescription" placeholder="项目描述"></textarea>
										<div class="word_count">你还可以输入 <span>500</span> 字</div>
									</td>
	            				</tr>
	            				<!-- <tr>
									<td colspan="2">
										<textarea placeholder="职责描述" name="ResponsDescription" class="ResponsDescription s_textarea"></textarea>
										<div class="word_count">你还可以输入 <span>500</span> 字</div>
									</td>
	            				</tr> -->
	            				<tr>
	            					<td valign="top"></td> 
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
			            	<input type="hidden" value="" class="projectId">
            			</form><!--end .projectForm-->
            		</div><!--end .projectEdit-->
            		            		<div class="projectAdd pAdd <%= (showProjects ? "dn" : "") %>">
            		            			项目经验是用人单位衡量人才能力的重要指标哦！<br>
						来说说让你难忘的项目吧！
						<span>添加项目经验</span>
            		</div><!--end .projectAdd-->
            	</div><!--end #projectExperience-->

            	<div class="profile_box" id="educationalBackground">
            		<h2>教育背景<span>（投递简历时必填）</span></h2>
            							<span class="c_add <%= showEdus ? "" : "dn" %>"></span>
            		<div class="educationalShow <%= showEdus ? "" : "dn" %>">
            		            			<form class="educationalForm borderBtm dn">
	            			<table>
	            				<tbody><tr>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="schoolName" class="schoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							      		<input type="hidden" class="degree" value="" name="degree">
							        	<input type="button" value="学历" class="profile_select_287 profile_select_normal select_degree">
										<div class="box_degree boxUpDown boxUpDown_287 dn" style="display: none;">
								            <ul>
								        										        			<li>大专</li>
								        										        			<li>本科</li>
								        										        			<li>硕士</li>
								        										        			<li>博士</li>
								        										        			<li>其他</li>
								        										        	</ul>
								        </div>
							        </td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
	            						<input type="text" placeholder="专业名称" name="professionalName" class="professionalName">
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="schoolYearStart" value="" name="schoolYearStart">
								        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_schoolYearStart">
											<div class="box_schoolYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									        											        			<li>2014</li>
									        											        			<li>2013</li>
									        											        			<li>2012</li>
									        											        			<li>2011</li>
									        											        			<li>2010</li>
									        											        			<li>2009</li>
									        											        			<li>2008</li>
									        											        			<li>2007</li>
									        											        			<li>2006</li>
									        											        			<li>2005</li>
									        											        			<li>2004</li>
									        											        			<li>2003</li>
									        											        			<li>2002</li>
									        											        			<li>2001</li>
									        											        			<li>2000</li>
									        											        			<li>1999</li>
									        											        			<li>1998</li>
									        											        			<li>1997</li>
									        											        			<li>1996</li>
									        											        			<li>1995</li>
									        											        			<li>1994</li>
									        											        			<li>1993</li>
									        											        			<li>1992</li>
									        											        			<li>1991</li>
									        											        			<li>1990</li>
									        											        			<li>1989</li>
									        											        			<li>1988</li>
									        											        			<li>1987</li>
									        											        			<li>1986</li>
									        											        			<li>1985</li>
									        											        			<li>1984</li>
									        											        			<li>1983</li>
									        											        			<li>1982</li>
									        											        			<li>1981</li>
									        											        			<li>1980</li>
									        											        			<li>1979</li>
									        											        			<li>1978</li>
									        											        			<li>1977</li>
									        											        			<li>1976</li>
									        											        			<li>1975</li>
									        											        			<li>1974</li>
									        											        			<li>1973</li>
									        											        			<li>1972</li>
									        											        			<li>1971</li>
									        											        			<li>1970</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
		            						<input type="hidden" class="schoolYearEnd" value="" name="schoolYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_schoolYearEnd">
											<div style="display: none;" class="box_schoolYearEnd  boxUpDown boxUpDown_139 dn">
									            <ul>
									        											        			<li>2021</li>
									        											        			<li>2020</li>
									        											        			<li>2019</li>
									        											        			<li>2018</li>
									        											        			<li>2017</li>
									        											        			<li>2016</li>
									        											        			<li>2015</li>
									        											        			<li>2014</li>
									        											        			<li>2013</li>
									        											        			<li>2012</li>
									        											        			<li>2011</li>
									        											        			<li>2010</li>
									        											        			<li>2009</li>
									        											        			<li>2008</li>
									        											        			<li>2007</li>
									        											        			<li>2006</li>
									        											        			<li>2005</li>
									        											        			<li>2004</li>
									        											        			<li>2003</li>
									        											        			<li>2002</li>
									        											        			<li>2001</li>
									        											        			<li>2000</li>
									        											        			<li>1999</li>
									        											        			<li>1998</li>
									        											        			<li>1997</li>
									        											        			<li>1996</li>
									        											        			<li>1995</li>
									        											        			<li>1994</li>
									        											        			<li>1993</li>
									        											        			<li>1992</li>
									        											        			<li>1991</li>
									        											        			<li>1990</li>
									        											        			<li>1989</li>
									        											        			<li>1988</li>
									        											        			<li>1987</li>
									        											        			<li>1986</li>
									        											        			<li>1985</li>
									        											        			<li>1984</li>
									        											        			<li>1983</li>
									        											        			<li>1982</li>
									        											        			<li>1981</li>
									        											        			<li>1980</li>
									        											        			<li>1979</li>
									        											        			<li>1978</li>
									        											        			<li>1977</li>
									        											        			<li>1976</li>
									        											        			<li>1975</li>
									        											        			<li>1974</li>
									        											        			<li>1973</li>
									        											        			<li>1972</li>
									        											        			<li>1971</li>
									        											        			<li>1970</li>
									        											        	</ul>
									        </div>
	            						</div>
	            						<div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="eduId" value="">
            			</form><!--end .educationalForm-->

            			<ul class="elist clearfix">
            			   <% if (showEdus){
            				   for(int i = 0; i < edus.size(); i++) {
            					   EmployeeEdu temp = edus.get(i);
            					  
            			   %>
            			     <% if (i % 2 == 0) {%>
            			      <li data-id=<%= temp.getEduid() %> class="clear">
            			      
            			      <%} else {%>
            			      <li data-id=<%= temp.getEduid() %>>
            			      <% } %>
                                <i class="sm_del dn"></i>
                                <i class="sm_edit dn"></i>
                                <span class="c9" data-startY= <%= temp.getStartYear() %> data-endY=<%= temp.getEndYear() %>><%= temp.getStartYear() %>-<%= temp.getEndYear() %></span>
                                <div><h3 data-schName=<%= temp.getSchoolName() %>><%= temp.getSchoolName() %></h3>
                                <h4 data-proName=<%= temp.getProfessional() %> data-degree=<%= temp.getEducation() %>> <%= temp.getEducation() %>，<%= temp.getProfessional() %> </h4>
                               </div>
                              </li>
            			   <% }} %>
            			   
            			</ul>
            		</div><!--end .educationalShow-->
            		<div class="educationalEdit dn">
            			<form class="educationalForm">
	            			<table>
	            				<tbody><tr>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="schoolName" class="schoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							      		<input type="hidden" class="degree" value="" name="degree">
							        	<input type="button" value="学历" class="profile_select_287 profile_select_normal select_degree">
										<div class="box_degree boxUpDown boxUpDown_287 dn" style="display: none;">
								            <ul>
								        										        			<li>大专</li>
								        										        			<li>本科</li>
								        										        			<li>硕士</li>
								        										        			<li>博士</li>
								        										        			<li>其他</li>
								        										        	</ul>
								        </div>
							        </td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
	            						<input type="text" placeholder="专业名称" name="professionalName" class="professionalName">
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="schoolYearStart" value="" name="schoolYearStart">
								        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_schoolYearStart">
											<div class="box_schoolYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									        											        			<li>2014</li>
									        											        			<li>2013</li>
									        											        			<li>2012</li>
									        											        			<li>2011</li>
									        											        			<li>2010</li>
									        											        			<li>2009</li>
									        											        			<li>2008</li>
									        											        			<li>2007</li>
									        											        			<li>2006</li>
									        											        			<li>2005</li>
									        											        			<li>2004</li>
									        											        			<li>2003</li>
									        											        			<li>2002</li>
									        											        			<li>2001</li>
									        											        			<li>2000</li>
									        											        			<li>1999</li>
									        											        			<li>1998</li>
									        											        			<li>1997</li>
									        											        			<li>1996</li>
									        											        			<li>1995</li>
									        											        			<li>1994</li>
									        											        			<li>1993</li>
									        											        			<li>1992</li>
									        											        			<li>1991</li>
									        											        			<li>1990</li>
									        											        			<li>1989</li>
									        											        			<li>1988</li>
									        											        			<li>1987</li>
									        											        			<li>1986</li>
									        											        			<li>1985</li>
									        											        			<li>1984</li>
									        											        			<li>1983</li>
									        											        			<li>1982</li>
									        											        			<li>1981</li>
									        											        			<li>1980</li>
									        											        			<li>1979</li>
									        											        			<li>1978</li>
									        											        			<li>1977</li>
									        											        			<li>1976</li>
									        											        			<li>1975</li>
									        											        			<li>1974</li>
									        											        			<li>1973</li>
									        											        			<li>1972</li>
									        											        			<li>1971</li>
									        											        			<li>1970</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
		            						<input type="hidden" class="schoolYearEnd" value="" name="schoolYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_schoolYearEnd">
											<div class="box_schoolYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									        											        			<li>2014</li>
									        											        			<li>2013</li>
									        											        			<li>2012</li>
									        											        			<li>2011</li>
									        											        			<li>2010</li>
									        											        			<li>2009</li>
									        											        			<li>2008</li>
									        											        			<li>2007</li>
									        											        			<li>2006</li>
									        											        			<li>2005</li>
									        											        			<li>2004</li>
									        											        			<li>2003</li>
									        											        			<li>2002</li>
									        											        			<li>2001</li>
									        											        			<li>2000</li>
									        											        			<li>1999</li>
									        											        			<li>1998</li>
									        											        			<li>1997</li>
									        											        			<li>1996</li>
									        											        			<li>1995</li>
									        											        			<li>1994</li>
									        											        			<li>1993</li>
									        											        			<li>1992</li>
									        											        			<li>1991</li>
									        											        			<li>1990</li>
									        											        			<li>1989</li>
									        											        			<li>1988</li>
									        											        			<li>1987</li>
									        											        			<li>1986</li>
									        											        			<li>1985</li>
									        											        			<li>1984</li>
									        											        			<li>1983</li>
									        											        			<li>1982</li>
									        											        			<li>1981</li>
									        											        			<li>1980</li>
									        											        			<li>1979</li>
									        											        			<li>1978</li>
									        											        			<li>1977</li>
									        											        			<li>1976</li>
									        											        			<li>1975</li>
									        											        			<li>1974</li>
									        											        			<li>1973</li>
									        											        			<li>1972</li>
									        											        			<li>1971</li>
									        											        			<li>1970</li>
									        											        	</ul>
									        </div>
	            						</div>
	            						<div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="eduId" value="">
            			</form><!--end .educationalForm-->
            		</div><!--end .educationalEdit-->
            		            		<div class="educationalAdd pAdd <%= showEdus ? "dn" : "" %>">
            		            			教育背景可以充分体现你的学习和专业能力，<br>
						且完善后才可投递简历哦！
						<span>添加教育经历</span>
            		</div><!--end .educationalAdd-->
            	</div><!--end #educationalBackground-->

            	<div class="profile_box" id="selfDescription">
            		<h2>自我描述</h2>
            		            		<span class="c_edit dn"></span>
            		<div class="descriptionShow dn">
            		            			<%= employee==null?"":employee.getMyRemark() %>
            		</div><!--end .descriptionShow-->
            		<div class="descriptionEdit dn">
            			<form class="descriptionForm">
	            			<table>
	            				<tbody><tr>
									<td colspan="2">
										<textarea class="selfDescription s_textarea" name="selfDescription" placeholder="">
										<%= employee==null?"":employee.getMyRemark() %></textarea>
										<div class="word_count">你还可以输入 <span>500</span> 字</div>
									</td>
	            				</tr>
	            				<tr>
	            					<td colspan="2">
										<input type="submit" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end .descriptionForm-->
            		</div><!--end .descriptionEdit-->
            		            		<div class="descriptionAdd pAdd">
            		            			描述你的性格、爱好以及吸引人的经历等，<br>
						让企业了解多元化的你！
						<span>添加自我描述</span>
            		</div><!--end .descriptionAdd-->
            	</div><!--end #selfDescription-->

            	
				<input type="hidden" id="resumeId" value="268472">
            </div><!--end .content_l-->
            <div class="content_r">
            	<div class="mycenterR" id="myInfo">
            		<h2>我的信息</h2>
            		<a target="_blank" href="collections.html">我收藏的职位</a>
            		<br>
            		            		            		<a target="_blank" href="subscribe.html">我订阅的职位</a>
            	</div><!--end #myInfo-->

				<div class="mycenterR" id="myResume">
            		<h2>我的附件简历 
            			            			<a title="上传附件简历" href="#uploadFile" class="inline cboxElement">上传简历</a>
            			            		</h2>
            		<div class="resumeUploadDiv">
	            			            		暂无附件简历
	            		            		</div>
            	</div><!--end #myResume-->

            	<div class="mycenterR" id="resumeSet">
            		<h2>投递简历设置  <span>修改设置</span></h2>
            		<!-- -1 (0=附件， 1=在线， 其他=未设置) -->
            		            		            			<div class="noSet set0 dn">默认使用<span>附件简历</span>进行投递</div>
            			<div class="noSet set1 dn">默认使用<span>在线简历</span>进行投递</div>
						<div class="noSet">暂未设置默认投递简历</div>
            		            		<input type="hidden" class="defaultResume" value="-1">
            		<form class="dn" id="resumeSetForm">
	            		<label><input type="radio" value="1" class="resume1" name="resume">默认使用<span>在线简历</span>进行投递</label>
	            		<label><input type="radio" value="0" class="resume0" name="resume">默认使用<span>附件简历</span>进行投递</label>
	            		<span class="setTip error"></span>
	            		<div class="resumeTip">设置后投递简历时将不再提醒</div>
	            		<input type="submit" value="保 存" class="btn_profile_save">
						<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            	</form>
            	</div><!--end #resumeSet-->
				
				<div class="mycenterR" id="myShare">
            		<h2>当前每日投递量：10个</h2>
            		<a target="_blank" href="h/share/invite.html">邀请好友，提升投递量</a>
            	</div><!--end #myShare-->
            	
								
				<div class="greybg qrcode mt20">
                	<img width="242" height="242" alt="拉勾微信公众号二维码" src="style/images/qr_resume.png">
                    <span class="c7">微信扫一扫，轻松找工作</span>
                </div>
            </div><!--end .content_r-->
        </div>
        
      <input type="hidden" id="userid" name="userid" value="314873">

<!-------------------------------------弹窗lightbox ----------------------------------------->
<div style="display:none;">
	<!-- 上传简历 -->
	<div class="popup" id="uploadFile">
	    <table width="100%">
	    	<tbody><tr>
	        	<td align="center">
	                <form>
	                    <a class="btn_addPic" href="javascript:void(0);">
	                    	<span>选择上传文件</span>
	                        <input type="file" onchange="file_check(this,'h/nearBy/updateMyResume.json','resumeUpload')" class="filePrew" id="resumeUpload" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M" tabindex="3">
	                    </a>
	                </form>
	            </td>
	        </tr>
	    	<tr>
	        	<td align="left">支持word、pdf、ppt、txt、wps格式文件<br>文件大小需小于10M</td>
	        </tr>
	        <tr>
	        	<td align="left" style="color:#dd4a38; padding-top:10px;">注：若从其它网站下载的word简历，请将文件另存为.docx格式后上传</td>
	        </tr>
	    	<tr>
	        	<td align="center"><img width="55" height="16" alt="loading" style="visibility: hidden;" id="loadingImg" src="style/images/loading.gif"></td>
	        </tr>
	    </tbody></table>
	</div><!--/#uploadFile-->
	
	<!-- 简历上传成功 -->
	<div class="popup" id="uploadFileSuccess">
     	<h4>简历上传成功！</h4>
         <table width="100%">
             <tbody><tr>
                 <td align="center"><p>你可以将简历投给你中意的公司了。</p></td>
             </tr>
         	<tr>
             	<td align="center"><a class="btn_s" href="javascript:;">确&nbsp;定</a></td>
             </tr>
         </tbody></table>
     </div><!--/#uploadFileSuccess-->
     
	<!-- 没有简历请上传 -->
    <div class="popup" id="deliverResumesNo">
        <table width="100%">
            <tbody><tr>
                <td align="center"><p class="font_16">你在拉勾还没有简历，请先上传一份</p></td>
            </tr>
        	<tr>
            	<td align="center">
                    <form>
                        <a class="btn_addPic" href="javascript:void(0);">
                        	<span>选择上传文件</span>
                        	<input type="file" onchange="file_check(this,'h/nearBy/updateMyResume.json','resumeUpload1')" class="filePrew" id="resumeUpload1" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M">
                        </a>
                    </form>
                </td>
            </tr>
        	<tr>
            	<td align="center">支持word、pdf、ppt、txt、wps格式文件，大小不超过10M</td>
            </tr>
        </tbody></table>
    </div><!--/#deliverResumesNo-->
    
    <!-- 上传附件简历操作说明-重新上传 -->
    <div class="popup" id="fileResumeUpload">
        <table width="100%">
            <tbody><tr>
                <td>
                	<div class="f18 mb10">请上传标准格式的word简历</div>
                </td>
            </tr>
            <tr>
                <td>
                	<div class="f16">
                		操作说明：<br>
                		打开需要上传的文件 - 点击文件另存为 - 选择.docx - 保存
                	</div>
                </td>
            </tr>
        	<tr>
            	<td align="center">
            		<a title="上传附件简历" href="#uploadFile" class="inline btn cboxElement">重新上传</a>
            	</td>
            </tr>
        </tbody></table>
    </div><!--/#fileResumeUpload-->
    
    <!-- 上传附件简历操作说明-重新上传 -->
    <div class="popup" id="fileResumeUploadSize">
        <table width="100%">
            <tbody><tr>
                <td>
                	<div class="f18 mb10">上传文件大小超出限制</div>
                </td>
            </tr>
            <tr>
                <td>
                	<div class="f16">
                		提示：<br>
                		单个附件不能超过10M，请重新选择附件简历！
                	</div>
                </td>
            </tr>
        	<tr>
            	<td align="center">
            		<a title="上传附件简历" href="#uploadFile" class="inline btn cboxElement">重新上传</a>
            	</td>
            </tr>
        </tbody></table>
    </div><!--/#deliverResumeConfirm-->
    
</div>
<!------------------------------------- end ----------------------------------------->  

<script src="style/js/Chart.min.js" type="text/javascript"></script>
<script src="style/js/profile.min.js" type="text/javascript"></script>
<!-- <div id="profileOverlay"></div> -->
<div class="" id="qr_cloud_resume" style="display: none;">
	<div class="cloud">
		<img width="134" height="134" src="">
		<a class="close" href="javascript:;"></a>
	</div>
</div>
<script>
$(function(){
	$.ajax({
        url:ctx+"/mycenter/showQRCode",
        type:"GET",
        async:false
   	}).done(function(data){
        if(data.success){
             $('#qr_cloud_resume img').attr("src",data.content);
        }
   	}); 
	var sessionId = "resumeQR"+314873;
	if(!$.cookie(sessionId)){
		$.cookie(sessionId, 0, {expires: 1});
	}
	if($.cookie(sessionId) && $.cookie(sessionId) != 5){
		$('#qr_cloud_resume').removeClass('dn');
	}
	$('#qr_cloud_resume .close').click(function(){
		$('#qr_cloud_resume').fadeOut(200);
		resumeQR = parseInt($.cookie(sessionId)) + 1;
		$.cookie(sessionId, resumeQR, {expires: 1});
	});
});
</script>
			<div class="clear"></div>
			<input type="hidden" value="97fd449bcb294153a671f8fe6f4ba655" id="resubmitToken">
	    	<a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			<a rel="nofollow" target="_blank" href="h/about.html">联系我们</a>
		    <a target="_blank" href="h/af/zhaopin.html">互联网公司导航</a>
		    <a rel="nofollow" target="_blank" href="http://e.weibo.com/lagou720">拉勾微博</a>
		    <a rel="nofollow" href="javascript:void(0)" class="footer_qr">拉勾微信<i></i></a>
			<div class="copyright">&copy;2013-2014 Lagou <a href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action" target="_blank">京ICP备14023790号-2</a></div>
		</div>
	</div>

<script src="style/js/core.min.js" type="text/javascript"></script>
<script src="style/js/popup.min.js" type="text/javascript"></script>

<!--  -->

<script type="text/javascript">

</script>

<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>
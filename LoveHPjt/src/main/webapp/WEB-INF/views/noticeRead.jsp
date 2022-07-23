<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<% pageContext.setAttribute("replceChar", "\r\n"); %>
<%
	String home_id = (String)request.getAttribute("home_id");
	String menu_id = (String)request.getAttribute("menu_id");
	String flag = (String)request.getAttribute("flag");
	String seq = (String)request.getAttribute("seq");
	com.loveandheart.LH.vo.NoticeVO noticeVO = (com.loveandheart.LH.vo.NoticeVO)request.getAttribute("notice");
	String notice_title = noticeVO.getNotice_title();
	String notice_content = noticeVO.getNotice_content();
	String link_page = noticeVO.getLink_page();
    com.loveandheart.LH.vo.MemberVO memberOutVO = (com.loveandheart.LH.vo.MemberVO) session.getAttribute("memberVO");

%>

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport" />
    <title>사랑과마음 상담 센터</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
  .mydiv {
  	 height: 200px;
  	 width: 100%;
  	 white-space: nowrap;
  	 overflow-x: hidden;
  	 overflow-y: scroll;
  }
</style>

<script type="text/javascript">
<!--
var myModal;
$(function(){
	 $('#wrtBtn').click(function() {
		document.form_wr.flag.value = 'U';
		document.form_wr.action = "<%=request.getContextPath()%>/getNotice";
		document.form_wr.submit();

	});
	 $('#cancelBtn').click(function() {
		document.form_wr.action = "<%=request.getContextPath()%>/getPage";
		// document.form_wr.action = "<%=request.getContextPath()%>/getPageListNotice";
		document.form_wr.submit();

	});
});
function process(flag) {
	if (flag == 's') {
		myModal = new bootstrap.Modal(document.getElementById('myModal'), {});
	}
	if (myModal != undefined) {
		myModal.toggle();
	}
}
-->
</script>						
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<form name="form_wr" class="form-inline" role="form" action="writerAction" method="post">
		<input type="hidden" name="home_id" id="home_id" value="<%=home_id%>" />
		<input type="hidden" name="menu_id" id="menu_id" value="<%=menu_id%>" />
		<input type="hidden" name="pageNo" id="pageNo" value="1" />
		<input type="hidden" name="search" id="search" value="1" />
		<input type="hidden" name="keyWord" id="keyWord" value="2" />
		<input type="hidden" name="flag" id="flag" value="<%=flag%>" />
		<input type="hidden" name="menu_name" id="menu_name" value="${menu_name}" />
		<input type="hidden" name="seq" id="seq" value="<%=seq%>" />
</form>
<div class="container">
    <div class="row" >
    	<br/><br/>
    </div>
    <div class="row" >
	    <div class="col">
	    	<h3 style="font-size:20px;font-family:'Noto Sans','맑은 고딕';color:#0E788D"><strong><u>${menu_name}</u></strong></h3>
	    	<br/>
	    </div>
    </div>

		<div class="row">
			<div class="col">
			    <div class="card">
			        <div class="card-body">
			             <div class="table-responsive">
			                 <span style="font-size:25px; vertical-align: middle;" ><%=notice_title%></span>
			             </div>
			        </div>
			    </div>
			</div>
		</div>
		<br>	    	
		<div class="row">
			<c:set var="str1" value="<%=notice_content%>" />
			<c:set var="str2" value="${fn:replace(str1,  replceChar, '<br/>')}" />
			<div class="col mydiv">
			    <span style="font-size:18px;" >${str2}</span>
			</div>
		</div>		    	
		<br>	    	
		<div class="row">
			<div class="col">
			   <%
			   if ((link_page.length() > 4 && link_page.substring(0,5).equals(" http")) || 
				   (link_page.length() > 4 && link_page.substring(0,5).equals("https"))   ) {
				   String link = link_page.replace(" ","");
				   link = link.replace("youtu.be", "www.youtube.com/embed");
				   
			   %>
			        </br>
			   		연결된 영상 : </br></br>
					<iframe src="<%=link %>" frameborder="0" width="100%" height="250" allowfullscreen=""></iframe>
			   <%	   
			   } else {
			   %>
			   		<a href="resources/doc/<%=link_page%>" target="pop"><%=link_page%></a>
			   <%
			   }
			   %>
			</div>
		</div>
		<br><br>	
		<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog modal-sm  modal-dialog-centered" role="document"> 
				<div class="modal-content" style="display: flex;justify-content: center; align-items: center" >
					<img src="/resources/images/progress_1.gif" style="width: 40%;height: 40%;">
					<span>잠시만 기다려 주세요...</span>
					<br>
				</div>
			</div>
		</div>   	    	
		<div class="row">
			<div class="co">
			    <%
				if (memberOutVO != null) {
				%>
					<button id="wrtBtn" type="button" class="btn btn-secondary mb-3">수정</button>
				<%
				}
				%>
				<button id="cancelBtn" type="button" class="btn btn-outline-info mb-3">취소</button>
			</div>
		</div>
		<br/>
		<br/>
		<div class="row">
			<div class="co">
			</div>
		</div>				    				
</div>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>

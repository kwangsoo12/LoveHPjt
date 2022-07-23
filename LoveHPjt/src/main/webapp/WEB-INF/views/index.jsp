<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<% pageContext.setAttribute("replceChar", "\r\n"); %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>사랑과마음 상담 센터</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
 
    <style>
         html,
		 body{
		  width: 100%;
          height: 100%;
		  font-family: 'Nanum Gothic', sans-serif;
		 }
      .contain {
        width: 100%;
        height: 700px;
       }		 
 	</style>
  </head>
<script type="text/javascript">
var myModal;
var currentOS;
function process(flag) {
	if (flag == 's') {
		myModal = new bootstrap.Modal(document.getElementById('myModal'), {});
	}
	if (myModal != undefined) {
		myModal.toggle();
	}
}

function fn_view() {
	
	var mobile = (/iphone|ipad|ipod|android/i.test(navigator.userAgent.toLowerCase())); 
	if (mobile) {	
		// 유저에이전트를 불러와서 OS를 구분합니다.	
		var userAgent = navigator.userAgent.toLowerCase();	
		if (userAgent.search("android") > -1)		
			currentOS = "android";	
		else if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)				
				|| (userAgent.search("ipad") > -1))		
			currentOS = "ios";	
		else		
			currentOS = "else";
	} else {	
		// 모바일이 아닐 때	
		currentOS = "nomobile";
	}
	return currentOS;
}

$(function(){
	currentOS = fn_view();
	if (currentOS != 'nomobile') {
	    $("#main1").show();
	    // parent.process('s');
		
		// document.form2.submit();
   
	} else {
		$("#main1").hide();
	}
});

</script>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="contain">
	<jsp:include page="/WEB-INF/views/youtobe.jsp">
		<jsp:param name="type" value="main" />
		<jsp:param name="url" value="" />
	</jsp:include>

	<div class="row" id="main1" style="display:none">
	    <div class="row" >
	    	<br/><br/>
	    </div>
	    <div class="row" >
		    <div class="col">
		    	<h3 style="font-size:20px;font-family:'Noto Sans','맑은 고딕';color:#0E788D"><strong><u>${menu_name}</u></strong></h3>
		    	<br/>
		    </div>
	    </div>
	    <div class="row" >
			<c:forEach var="vo" items="${gallery}">
		    	<div class="col">
		    	    <c:if test="${ vo.gallery_type eq 'I' }">
			    	    <div class="card" >
				    	  <img class="card-img-top" src="resources/images/${vo.full_path}" style="width:100%" />
						</div>
			    	</c:if>
			    	<c:if test="${ vo.gallery_type eq 'M' }">
			    	    <div id="map-canvas" style="height: 600px"></div>
			    	</c:if>
		    	</div>
			</c:forEach>    	
	    </div>
	    <div class="row" >
	    	<br/>
	    	<br/>
	    </div>
		<c:forEach var="vo1" items="${notice}">
	    	<div class="row" >
	    		<div class="col">
	    		    <c:set var="str2" value="${fn:replace(vo1.notice_content,  replceChar, '<br/>')}" />
	    		    <c:if test="${ str2 eq null}">
	    		    	<p style="font-size:15px;font-family:'Noto Sans','맑은 고딕';color:#333333"><strong>${vo1.notice_content}</strong></p>
	    		    </c:if>
	    		    <c:if test="${ str2 ne null}">
	    		    	<p style="font-size:15px;font-family:'Noto Sans','맑은 고딕';color:#333333"><strong>${str2}</strong></p>
	    		    </c:if>
		    	</div>
		    </div>
	    </c:forEach>
	</div>
</div>
	<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog modal-sm modal-dialog-centered" role="document"> 
			<div class="modal-content" style="display: flex;justify-content: center; align-items: center">
				<img src="/resources/images/progress_1.gif" style="width: 40%;height: 40%;">
				<span>잠시만 기다려 주세요...</span>
				<br>
			</div>
		</div>
	</div>

</div>	
<form name="form2" method="post" action="<%=request.getContextPath()%>/getMainSub" target="main2" >
	<input type="hidden" name="home_id" id="home_id" value="A0001" />
	<input type="hidden" name="menu_id" id="menu_id" value="7" />
	<input type="hidden" name="pageNo" id="pageNo" value="1" />
	<input type="hidden" name="menu_name" id="menu_name" value="" />
</form>
</body>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<% pageContext.setAttribute("replceChar", "\r\n"); %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>사랑과마음 상담 센터</title>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
 
<style>

 body {
   font-family: 'Nanum Gothic', sans-serif;
 }

</style>

</head>
<script>


</script>

<body>
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
</body>
</html>

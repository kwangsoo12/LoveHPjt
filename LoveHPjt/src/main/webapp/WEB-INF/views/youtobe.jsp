<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String type = (String)request.getParameter("type");
	String url = (String)request.getParameter("url");
%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>사랑과마음 상담 센터</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.mb.YTPlayer/3.3.1/css/jquery.mb.YTPlayer.min.css">
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mb.YTPlayer/3.3.1/jquery.mb.YTPlayer.min.js"></script>
    
 <script>
$(function(){
	// $('#background').YTPlayer();
	$('#background').YTPlayer();
});
</script>
</head>
<body>
    <%
    if (type.equals("main")) {
    %>
		<c:forEach var="vo" items="${video}">
			<div id="background" class="player" data-property="{
				  videoURL:'${vo.c_video}',
				  mute: true,
				  showControls: false,
				  useOnMobile: true,
				  quality: 'highres',
				  containment: 'self',
				  loop: true,
				  autoPlay: true,
				  stopMovieOnBlur: false,
				  startAt: 0,
				  opacity: 1
			    }">
		    </div>
		</c:forEach> 
	<%
	} else {
	%>
				<div id="background" class="player" data-property="{
				  videoURL:'<%=url%>',
				  mute: true,
				  showControls: false,
				  useOnMobile: true,
				  quality: 'highres',
				  containment: 'self',
				  loop: true,
				  autoPlay: false,
				  stopMovieOnBlur: false,
				  startAt: 0,
				  opacity: 1
			    }">
		    </div>	
	<%
	}
	%>  	
</body>
</html>

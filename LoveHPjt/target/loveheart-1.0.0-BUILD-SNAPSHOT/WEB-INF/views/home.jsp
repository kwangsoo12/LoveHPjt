<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="js/jquery.youtube-background.js"></script>
<script>
$(function(){
	$("[data-youtube]").youtube_background();
})


</script>
<style>

</style>

<c:forEach var="vo" items="${video}">
	<div id="background" class="back_ground_video">
		<div class="video_intro" data-youtube="${vo.c_video}"></div>
	</div>
	<div class="video_info">
		<a href="${vo.c_video}" target="_sub">
			<img src="resources/img/youtube.png">
			<span class="aspan">WATCH ON <br/>YOUTUBE</span>
		</a>
	</div>
	<div class="logo_div">
			<img src="resources/img/355_200.png" >
	</div>
</c:forEach>	
<!--  -->

	
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<% pageContext.setAttribute("replceChar", "\r\n"); %>
<%
	String home_id = (String)request.getAttribute("home_id");
	String menu_id = (String)request.getAttribute("menu_id");
	String flag = (String)request.getAttribute("flag");
	String seq = "0";
	com.loveandheart.LH.vo.NoticeVO noticeVO = null;
	String notice_title = "";
	String notice_content = "";
	String link_page = "";
	if (flag.equals("A")) {
		flag = "I";
	} else {
		seq = (String)request.getAttribute("seq");
		noticeVO = (com.loveandheart.LH.vo.NoticeVO)request.getAttribute("notice");
		notice_title = noticeVO.getNotice_title();
		notice_content = noticeVO.getNotice_content();
		link_page = noticeVO.getLink_page();		
	}

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
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script type="text/javascript">
<!--
var myModal;
$(function(){
     $('#notice_content').on('keyup', function() {
        $('#notice_content_cnt').html("("+$(this).val().length+" / 2000)");
 
        if($(this).val().length > 2000) {
            $(this).val($(this).val().substring(0, 2000));
            $('#notice_content_cnt').html("(2000 / 2000)");
        }
     });	
	 $('#wrtBtn').click(function() {
		if (document.form_wr.notice_title.value == '') {
			alert("제목을 입력해 주세요");
			return;
		}
		if (document.form_wr.notice_content.value == '') {
			alert("내용을 입력해 주세요");
			return;
		}
		if (document.form_wr.link_page.value == '') {
			alert("연계주소를 입력해 주세요");
			return;
		}
		
		process('s');
		document.form_wr.action = "<%=request.getContextPath()%>/prcsNotice";
		document.form_wr.submit();

	});
	 $('#cancelBtn').click(function() {
		process('s');
		document.form_wr.action = "<%=request.getContextPath()%>/getPage";
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
	    <div class="col">
			<form name="form_wr" action="writerAction" method="post">
				<input type="hidden" name="home_id" id="home_id" value="<%=home_id%>" />
				<input type="hidden" name="menu_id" id="menu_id" value="<%=menu_id%>" />
				<input type="hidden" name="pageNo" id="pageNo" value="1" />
				<input type="hidden" name="search" id="search" value="1" />
				<input type="hidden" name="keyWord" id="keyWord" value="2" />
				<input type="hidden" name="flag" id="flag" value="<%=flag%>" />
				<input type="hidden" name="menu_name" id="menu_name" value="${menu_name}" />
				<input type="hidden" name="seq" id="seq" value="<%=seq%>" />
				
				<input type="text" name="notice_title" class="form-control mt-4 mb-2"
					placeholder="제목을 입력해주세요." required value="<%=notice_title%>"
				>
				<div class="form-group">
					<textarea class="form-control" rows="10" name="notice_content" id="notice_content" placeholder="내용을 입력해주세요" required><%=notice_content%></textarea><div id="notice_content_cnt">(0 / 2000)</div>
				</div>
				<input type="text" name="link_page" class="form-control mt-4 mb-2"
					placeholder="연계하고자 하는 주소(URL)" required value="<%=link_page%>"
				>
				<button id="wrtBtn" type="button" class="btn btn-secondary mb-3">저장</button>
				<button id="cancelBtn" type="button" class="btn btn-outline-info mb-3">취소</button>
			</form>    
		</div>
	</div>
	<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog modal-sm  modal-dialog-centered" role="document"> 
			<div class="modal-content" style="display: flex;justify-content: center; align-items: center" >
				<img src="/resources/images/progress_1.gif" style="width: 40%;height: 40%;">
				<span>잠시만 기다려 주세요...</span>
				<br>
			</div>
		</div>
	</div> 	
</div>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>

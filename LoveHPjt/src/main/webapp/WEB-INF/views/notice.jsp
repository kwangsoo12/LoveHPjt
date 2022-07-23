<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<%@ page import="javax.servlet.http.HttpSession" %>

<% pageContext.setAttribute("replceChar", "\r\n"); %>
<%
	String home_id = (String)request.getAttribute("home_id");
	String menu_id = (String)request.getAttribute("menu_id");
    // HttpSession session2 = request.getSession();
    com.loveandheart.LH.vo.MemberVO memberOutVO = (com.loveandheart.LH.vo.MemberVO) session.getAttribute("memberVO");
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">

<style>

 body{
   font-family: 'Nanum Gothic', sans-serif;
 }

</style>
<script type="text/javascript">
<!--
var myModal;
$(function(){
	 $('#searchBtn').click(function() {
		    process('s');

			var search = document.getElementById("searchType");
			var val = search.options[search.selectedIndex].value;
			document.form_notice.pageNo.value = 1;
			document.form_notice.search.value = val;
			document.form_notice.keyWord.value =  document.getElementById("keywordInput").value;
			document.form_notice.action = "<%=request.getContextPath()%>/getPageListNotice";
			document.form_notice.submit();

	});

	$('#allChk').click(function() {
		var allChk = $(this).is(":checked");
		var itemList =  document.getElementsByName("itemChk");
		console.log(itemList.length);
		var val1 = "N";
		var val2 = false;
		if(allChk) {
			val1 = "Y";
			val2 = true;
		}

		if (itemList.length > 1) {
			for(var i = 0; i < itemList.length; i++) {
				document.getElementsByName("itemChk")[i].value = val1;
				document.getElementsByName("itemChk")[i].checked = val2;
			}
		} else {
			document.getElementsByName("itemChk").value = val1;
			document.getElementsByName("itemChk").checked = val2;
		}
	});
	$('#wrtBtn').click(function() {
		process('s');

		document.form_notice.search.value = '1';
		document.form_notice.keyWord.value =  '';
		document.form_notice.pageNo.value = "1";
		document.form_notice.flag.value = "A";
		document.form_notice.seq.value = "0";
		document.form_notice.action = "<%=request.getContextPath()%>/getNotice";
		document.form_notice.submit();
	});
	$('#delBtn').click(function() {
		var itemList =  document.getElementsByName("itemChk");
		var chk = false;
		if (itemList.length > 1) {
			for(var i = 0; i < itemList.length; i++) {
				if (document.getElementsByName("itemChk")[i].value == 'Y') {
					chk = true;
					document.form_notice.delSeq.value = document.form_notice.delSeq.value + document.getElementsByName("deleteSeq")[i].value + ";";
				}
			}
		} else {
			if (document.getElementsByName("itemChk").value == 'Y') {
				chk = true;
				document.form_notice.delSeq.value = document.getElementsByName("deleteSeq").value + ";";
			}
		}
		
		if (!chk) {
			alert("먼저 삭제할 대상을 선택하세요");
			return;
		}
		process('s');

		document.form_notice.search.value = '1';
		document.form_notice.keyWord.value =  '';
		document.form_notice.pageNo.value = "1";
		document.form_notice.seq.value = "1";
		document.form_notice.flag.value = "D";
		document.form_notice.action = "<%=request.getContextPath()%>/prcsNotice";
		document.form_notice.submit();
	});	
});
function fn_itemChk(seq) {
	var itemList =  document.getElementsByName("itemChk");
	console.log(itemList.length);

	if (itemList.length > 1) {
		document.getElementsByName("itemChk")[seq].value = 'Y';
	} else {
		document.getElementsByName("itemChk").value = 'Y';
	}
}
function fn_update(seq){
	process('s');

	document.form_notice.seq.value = seq;
	document.form_notice.pageNo.value = 1;
	document.form_notice.search.value = "1";
	document.form_notice.keyWord.value = "";
	document.form_notice.flag.value = "S";
	document.form_notice.action = "<%=request.getContextPath()%>/getNotice";
	document.form_notice.submit();
};
function fn_page_Click(no){
	process('s');

	document.form_notice.search.value = '1';
	document.form_notice.keyWord.value =  '';
	document.form_notice.pageNo.value = no;
	document.form_notice.action = "<%=request.getContextPath()%>/getPageListNotice";
	document.form_notice.submit();
};
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
<form name="form_notice" method="post" action="<%=request.getContextPath()%>/getPageListNotice" target="_self" >
	<input type="hidden" name="home_id" id="home_id" value="<%=home_id%>" />
	<input type="hidden" name="menu_id" id="menu_id" value="<%=menu_id%>" />
	<input type="hidden" name="pageNo" id="pageNo" value="1" />
	<input type="hidden" name="search" id="search" value="" />
	<input type="hidden" name="keyWord" id="keyWord" value="" />
	<input type="hidden" name="flag" id="flag" value="" />
	<input type="hidden" name="seq" id="seq" value="" />
	<input type="hidden" name="menu_name" id="menu_name" value="${menu_name}" />
	<input type="hidden" name="delSeq" id="delSeq" value="" />
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
    <div class="row" >
	    <div class="col">
			<section id="container">
					<table class="table table-hover text-center" >
					    <colgroup>
					    	<%
							if (memberOutVO != null) {
							%>
					    		<col style="width:5%"/>
					    	<%
							}
							%>	
					    	<col style="width:5%"/>
					    	<col />
					    </colgroup>
						<thead class="thead-light">
							<tr>
							    <%
							    if (memberOutVO != null) {
							    %>
									<th scope="col" class="text-center">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="allChk" value="N" id="allChk">
										</div>	
									</th>
								<%
								}
								%>	
								<th scope="col" class="text-center">No</th>
								<th scope="col" class="text-center">제목</th>
							</tr>
						</thead>
						<tbody>
						    <%
						    int item_cnt = 0;
						    %>
							<c:if test="${ !empty notice}">
								<c:forEach items="${notice}" var = "list">
									<tr>
										<%
										if (memberOutVO != null) {
										%>
											<td><input class="form-check-input" type="checkbox" name="itemChk" value="N" onclick="fn_itemChk(<%=item_cnt%>)"></td>
										<%
										}
										%>
										<input type="hidden" name="deleteSeq" value="${list.seq}" />
										<td onclick="fn_update(${list.seq})"><c:out value="${list.seq}" /></td>
										<td onclick="fn_update(${list.seq})">
											<c:out value="${list.notice_title}" />
										</td>
									    <%
									    item_cnt++;
									    %>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${ empty notice}">
							  <tr>
							     <%
								 if (memberOutVO != null) {
								 %>
								     <td colspan="3" style="text-align: center; vertical-align: middle;">등록된 자료가 없습니다
								     </td>
								 <%
								 } else {
								 %>
								     <td colspan="2" style="text-align: center; vertical-align: middle;">등록된 자료가 없습니다
								     </td>
								 <%
								 }
								 %>
							  </tr>
							</c:if>
						</tbody>
					</table>
			        <div class="col-sm-12 pt-3">
			            <div class="card">
			                <div class="card-body">
			                    <div class="table-responsive">
			                        <table class="table">
			                            <tbody>
			                            <tr style="line-height:32px;">
			                                <td>
												<select name="searchType" id="searchType" class="selectpicker">
													<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
													<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
												</select>
											</td>
			                                <td>
												<input type="text" name="keyword" id="keywordInput" style="width:80%" />
											</td>
			                                <td>
												<button id="searchBtn" type="button" class="btn btn-outline-info" >검색</button> 	
											</td>
										</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<br/>
					<div class="col-md-offset-3">
					    
						<ul class="pagination justify-content-center">
							<%
							com.loveandheart.LH.vo.NoticeVO noticeVO = (com.loveandheart.LH.vo.NoticeVO)request.getAttribute("cnt");
							int pageNow = Integer.parseInt((String)request.getAttribute("page")); // 현재 페이지
							int count = 3; // 맨 아래 페이지 네이비게이션 count 수
							pageNow = pageNow - 1;
							int currentBlock = pageNow / count;
							int cnt = noticeVO.getCnt();
							
							int first = currentBlock * count + 1;
							int end = currentBlock * count + count + 1; 
							boolean isNext = false;
							if (end > cnt) {
								end = cnt + 1;
								isNext = true;
							}
							
							int nextCnt = end;
							int preCnt = first - count;
							if (preCnt < 1) {
								preCnt = 1;
							}
							%>
							<li><button id="preBtn"  style="margin-right:10px;" type="button" class="btn btn-outline-info" onclick="fn_page_Click('<%=preCnt%>')"><</button> </li>
							<%
							for (int i = first; i < end; i++) {
							%>								
								<li><button style="margin-right:10px;" type="button" class="btn btn-outline-info" onclick="fn_page_Click('<%=i%>')"><%=i%></button> </li>
							<%
							}
							if (!isNext) {
							%>
								<li><button id="nextBtn"  style="margin-right:20px;" type="button" class="btn btn-outline-info" onclick="fn_page_Click('<%=nextCnt%>')">></button></li>
							<%
							} else {
						    %>
								<li><span style="margin-right:10px;"></span></li>
							<%	
							}
							%>					
						</ul>
					     	
					</div>
			</section>
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
    <%
	if (memberOutVO != null) {
    %>
	    <div class="row" >
		    <div class="col">    
				<button id="delBtn" type="button"  style="margin-right:20px;" class="btn btn-outline-info">선택삭제</button>
				<button id="wrtBtn" type="button" class="btn text-white" style="background-color: navy;">글쓰기</button>
		    </div>
	    </div>
	<%
	}
	%>
    <br/><br/>
</div>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>

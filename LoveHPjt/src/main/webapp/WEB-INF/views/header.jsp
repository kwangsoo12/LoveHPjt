<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
   HttpSession session2 = request.getSession();
   com.loveandheart.LH.vo.MemberVO memberOutVO1 = (com.loveandheart.LH.vo.MemberVO) session2.getAttribute("memberVO");
%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
 
    <title>사랑과마음 상담 센터</title>
<style>

 body{

 font-family: 'Nanum Gothic', sans-serif;
 }

 </style>

  </head>
<script type="text/javascript">
<!--
var modalLogin;
$(function(){
    $("#passwrdDis").hide();
    $("#idDis").hide();
	  <%
	  //System.out.println("ddddd");
	  //System.out.println(memberOutVO1);
	  if (memberOutVO1 != null) {
	  %>
	    $("#login").hide();
	    $("#logout").show();
	  <%
	  } else {
	  %>
	    $("#login").show();
	    $("#logout").hide();
	  <%
	  }
	  %>

	parent.process('e');
	getTopMenu();
	
	/*
	 $('#login').click(function() {
		var modalLogin1 = new bootstrap.Modal(document.getElementById('myLogin'), {});
		modalLogin1.toggle();
	 });
	 $('#myLogin_close').click(function() {
		modalLogin.toggle();
	 });	 
	 
	 $('#createBtn').click(function() {
		modalLogin.toggle(); 
		var createMember = new bootstrap.Modal(document.getElementById('createMember'), {});
		createMember.toggle();
	 });
		*/
	 $('#logout').click(function() {
		var params = {home_id: 'A0001', id: '', password: ''}
		params.id        =  $('#form_id').val();
		params.password  =  $('#form_pass').val();
		parent.process('s');
		$.ajax({
			url:"<%=request.getContextPath()%>/prcsLogout",
			data:params,
			success:function(result){
				parent.process('e');
			    $("#login").show();
			    $("#logout").hide();
			},
	        error : function(XMLHttpRequest, textStatus, errorThrown) { 
				parent.process('e');
	            alert("통신 실패.")
	        }
		});
	 });		
	 $('#loginBtn').click(function() {
		    if ($('#form_id').val() === '') {
		    	alert("아이디를 입력하세요");
		    	$('#form_id').focus();
		    	return;
		    }
		    if ($('#form_pass').val() === '') {
		    	alert("암호를 입력하세요");
		    	$('#form_pass').focus();
		    	return;
		    }
			var params = {home_id: 'A0001', id: '', password: ''}
			params.id        =  $('#form_id').val();
			params.password  =  $('#form_pass').val();
			parent.process('s');
			$.ajax({
				url:"<%=request.getContextPath()%>/getLogin",
				data:params,
				success:function(result){
					parent.process('e');
					if (result.statCode == 'E001') {
						alert("아이디와 암호에 맞는 정보가 없습니다");
						return;
					}
					window.location.href= '/';
				},
		        error : function(XMLHttpRequest, textStatus, errorThrown) { 
					parent.process('e');
		            alert("통신 실패.")
		        }
			});

	});
	$('#passwrd_searchBtn').click(function() {
		if ($('#passwrd_id').val() == '') {
			alert("아이디를 입력하세요");
			$('#passwrd_id').focus();
			return;
		}
		if ($('#passwrd_name').val() === '') {
			alert("성명을 입력하세요");
			$('#passwrd_name').focus();
			return;
		}
		if ($('#passwrd_phone_no').val() === '') {
		   alert("휴대폰번호를 입력하세요");
		   $('#passwrd_phone_no').focus();
		   return;
		}
		var params = {home_id: 'A0001', id: '', name: '', phone_no: ''}
		params.id        =  $('#passwrd_id').val();
		params.name      =  $('#passwrd_name').val();
		params.phone_no  =  $('#passwrd_phone_no').val();
		parent.process('s');
		$.ajax({
			url:"<%=request.getContextPath()%>/getPasswordMember",
			data:params,
			success:function(result){
				parent.process('e');
				if (result.statCode == 'E001') {
					alert("등록된 회원정보가 없습니다");
					return;
				} else {
				    $("#passwrdDis").show();
					$('#pass_password').val(result.password);
				}
							
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) { 
				parent.process('e');
			    alert("통신 실패.")
			}
		});
	}); 
	$('#id_searchBtn').click(function() {
		if ($('#id_name').val() === '') {
			alert("성명을 입력하세요");
			$('#id_name').focus();
			return;
		}

		if ($('#id_phone_no').val() === '') {
		   alert("휴대폰번호를 입력하세요");
		   $('#id_phone_no').focus();
		   return;
		}
		if ($('#id_password').val() == '') {
			alert("비밀전호를 입력하세요");
			$('#id_password').focus();
			return;
		}
		var params = {home_id: 'A0001', password: '', name: '', phone_no: ''}
		params.password  =  $('#id_password').val();
		params.name      =  $('#id_name').val();
		params.phone_no  =  $('#id_phone_no').val();
		parent.process('s');
		$.ajax({
			url:"<%=request.getContextPath()%>/getIdMember",
			data:params,
			success:function(result){
				parent.process('e');
				if (result.statCode == 'E001') {
					alert("등록된 회원정보가 없습니다");
					return;
				} else {
				    $("#idDis").show();
					$('#id_id').val(result.id);
				}
							
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) { 
				parent.process('e');
			    alert("통신 실패.")
			}
		});
	}); 	
	$('#saveBtn').click(function() {
		if ($('#id').val() == '') {
		    alert("아이디를 입력하세요");
		    $('#id').focus();
		    return;
		}
		if ($('#pass').val() == '') {
		    alert("암호를 입력하세요");
		    $('#pass').focus();
		    return;
		}
		if ($('#r_pass').val() == '') {
		    alert("암호를 입력하세요");
		    $('#r_pass').focus();
		    return;
		}
		if ($('#pass').val() != $('#r_pass').val()) {
		    alert("암호와 암호확인 값이 일치하지 않습니다");
		    $('#pass').focus();
		    return;
		}
		if ($('#name').val() === '') {
		    alert("성명을 입력하세요");
		    $('#name').focus();
		    return;
		}
		if ($('#phone_no').val() === '') {
		    alert("휴대폰번호를 입력하세요");
		    $('#phone_no').focus();
		    return;
		}
		var params = {home_id: 'A0001', id: '', password: '', name: '', phone_no: ''}
		params.id        =  $('#id').val();
		params.password  =  $('#pass').val();
		params.name      =  $('#name').val();
		params.phone_no  =  $('#phone_no').val();
		parent.process('s');
		$.ajax({
			url:"<%=request.getContextPath()%>/insMember",
			data:params,
			success:function(result){
				parent.process('e');
				if (result.statCode == 'E002') {
					alert("등록된 회원정보가 있습니다");
					return;
				} else if (result.statCode == 'E003') {
					alert("입력하신 데이터값의 크기 너무 큽니다");
					return;
				} else if (result.statCode == 'E004') {
					alert("매핑이 잘못 되었습니다");
					return;
				}
				alert("정상적으로 등록했습니다.")
						
				//window.location.href= '/';
				$("#createMember_CLose").click();
				$("#login").click();
			},
		    error : function(XMLHttpRequest, textStatus, errorThrown) { 
				parent.process('e');
		        alert("통신 실패.")
		    }
		});

	}); 
});
function getTopMenu(){
	var menu_list = $("#menu");
	var params = {"home_id":"A0001"}
	
	//var myModal = new bootstrap.Modal(document.getElementById('myModal'), {});
	//myModal.toggle();
	parent.process('s');
	$.ajax({
		url:"<%=request.getContextPath()%>/getListMenu",
		data:params,
		success:function(result){
			let r = $(result);
			let s = $(result);
			menu_list.append('<li class="nav-item"><a class="nav-link active" style="font-size:18px" aria-current="page" href="#" onclick="fn_Click(\'first\',\'홈\')">홈</a>');
			r.each(function(idx, vo){

				if (vo.menu_level == '1') {
		            console.log(vo.link_page);
					if (vo.link_page == undefined) {
			            let item = "<li class='nav-item dropdown'>";
			            item = item + "<a class='nav-link dropdown-toggle' style='font-size:18px' href='#' id='" + vo.menu_id + "' role='button' data-bs-toggle='dropdown' aria-expanded='false'>";
			            item = item + vo.menu_name;
			            item = item + "</a>";
			            item = item + "<ul class='dropdown-menu' style='font-size:18px' id='a" + vo.menu_id + "' aria-labelledby='" + vo.menu_id + "'>";
						s.each(function(idx, subVo){
							console.log(subVo.menu_level + ' >>> ' + subVo.top_menu_id + ' $$$ ' + vo.menu_id)
							if (subVo.menu_level == '2' && subVo.top_menu_id == vo.menu_id) {
								item = item + '<li><a class="dropdown-item" href="#" style="font-family: \'Sunflower\', sans-serif;font-size:17px" onclick="fn_Click(\'' + subVo.menu_id + '\',\'' + subVo.menu_name + '\')">' + subVo.menu_name + '</a></li>';
							}
						});
			            item = item + "</ul>";
			            item = item + "</li>"
			            console.log(item);
			            menu_list.append(item);
					} else {
						menu_list.append('<li class="nav-item"><a class="nav-link" href="#" style="font-size:18px" onclick="fn_Click(\'' + vo.menu_id + '\',\'' + vo.menu_name + '\')">' + vo.menu_name + '</a></li>');
					}
				}
				// menu_list.append("<li><a href='javascript:onTopMenuClick(2, " + vo.menu_id + ")' class='nav-link px-2 link-secondary'>" + vo.menu_name + "</a></li>");
			});
			// myModal.toggle();
			parent.process('e');
			console.log('end');
		},
        error : function(XMLHttpRequest, textStatus, errorThrown) { 
			//var myModal = new bootstrap.Modal(document.getElementById('myModal'), {});
			// myModal.toggle();
			parent.process('e');
            alert("통신 실패.")
        }
	});
	// document.getElementById("popup_layer").style.display = "none";

};
function fn_Click (menu_id, menu_name) {
	// var myModal = new bootstrap.Modal(document.getElementById('myModal'), {});
	// myModal.toggle();
    parent.process('s');
	
	if (menu_id == 'first') {
		location.href = "<%=request.getContextPath()%>/";
	} else {
		document.form.action = "<%=request.getContextPath()%>/getPage";
		$("#menu_id").val(menu_id);
		$("#menu_name").val(menu_name);
		document.form.submit();
	}
};
-->
</script>
</head>
<body>
<form name="form" method="post" action="<%=request.getContextPath()%>/getPage" target="_self" >
	<input type="hidden" name="home_id" id="home_id" value="A0001" />
	<input type="hidden" name="menu_id" id="menu_id" value="" />
	<input type="hidden" name="pageNo" id="pageNo" value="1" />
	<input type="hidden" name="menu_name" id="menu_name" value="" />
</form>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">사랑과마음 상담센터</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul id="menu" class="navbar-nav me-auto mb-2 mb-lg-0">
	      </ul>
		  <button type="button" class="btn btn-outline-success" id="logout" style="display:none" >로그아웃</button>
		  <button type="button" class="btn btn-outline-success" id="login" style="display:none" data-toggle="modal" data-target="#myLogin" >로그인</button>
	    </div>
	  </div>
</nav>
<div class="modal fade" id="myLogin">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myLoginLabel" style="text-align: center;">로그인</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="form_id" class="control-label">아이디:</label>
            <input type="text" class="form-control" id="form_id">
          </div>
          <div class="form-group">
            <label for="form_pass" class="control-label">암 호:</label>
            <input type="password" class="form-control" id="form_pass">
          </div>
        </form>
      </div>
      <div class="modal-footer">
		<div class="row" >
			 <div class="col">
		        <button type="button" class="btn btn-primary" id="loginBtn" >로그인</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#passwrdSearch">비밀번호찾기</button>
		     </div>
		</div>
		<div class="row" >
			 <div class="col">
		        <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#idSearch">아이디찾기</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#createMember">회원가입</button>
		     </div>
		</div>   
		<div class="row" >
			 <div class="col">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		     </div>
		</div>   
      </div> <!-- modal-footer -->
    </div> <!-- modal-content  -->
  </div> <!-- modal-dialog  -->
</div> <!-- modal fade -->


<div class="modal fade" id="createMember">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="createMemberLabel" style="text-align: center;">회원등록</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="id" class="control-label">아이디:</label>
            <input type="text" class="form-control" id="id">
          </div>
          <div class="form-group">
            <label for="pass" class="control-label">암 호:</label>
            <input type="password" class="form-control" id="pass">
          </div>
          <div class="form-group">
            <label for="r_pass" class="control-label">암호확인:</label>
            <input type="password" class="form-control" id="r_pass">
          </div>
          <div class="form-group">
            <label for="name" class="control-label">성 명:</label>
            <input type="text" class="form-control" id="name">
          </div>
          <div class="form-group">
            <label for="phone_no" class="control-label">휴대폰:</label>
            <input type="text"  placeholder="010-XXXX-XXXX" class="form-control" id="phone_no">
          </div>
        </form>
      </div>
      <div class="modal-footer">
		<div class="row" >
			 <div class="col">
		         <button type="button" class="btn btn-primary" id="saveBtn" >저장</button>
		     </div>
			 <div class="col">
		         <button type="button" class="btn btn-default" id="createMember_CLose" data-dismiss="modal">Close</button>
		     </div>
		</div>   
      </div> <!-- modal-footer -->
    </div> <!-- modal-content  -->
  </div> <!-- modal-dialog  -->
</div> <!-- modal fade -->


<div class="modal fade" id="passwrdSearch">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="passwrdLabel" style="text-align: center;">비밀번호찾기</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="id" class="control-label">아이디:</label>
            <input type="text" class="form-control" id="passwrd_id">
          </div>
          <div class="form-group">
            <label for="name" class="control-label">성 명:</label>
            <input type="text" class="form-control" id="passwrd_name">
          </div>
          <div class="form-group">
            <label for="phone_no" class="control-label">휴대폰:</label>
            <input type="text" placeholder="010-XXXX-XXXX" class="form-control" id="passwrd_phone_no">
          </div>
          <div class="form-group" id="passwrdDis">
            <label for="phone_no" class="control-label">비밀번호:</label>
            <input type="text" class="form-control" id="pass_password">
          </div>
        </form>
      </div>
      <div class="modal-footer">
		<div class="row" >
			 <div class="col">
		         <button type="button" class="btn btn-primary" id="passwrd_searchBtn" >비밀번호조회</button>
		     </div>
			 <div class="col">
		         <button type="button" class="btn btn-default" id="passwrd_CLose" data-dismiss="modal">Close</button>
		     </div>
		</div>   
      </div> <!-- modal-footer -->
    </div> <!-- modal-content  -->
  </div> <!-- modal-dialog  -->
</div> <!-- modal fade -->

<div class="modal fade" id="idSearch">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="idSearchLabel" style="text-align: center;">아이디찾기</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="name" class="control-label">성 명:</label>
            <input type="text" class="form-control" id="id_name">
          </div>
          <div class="form-group">
            <label for="phone_no" class="control-label">휴대폰:</label>
            <input type="text" placeholder="010-XXXX-XXXX" class="form-control" id="id_phone_no">
          </div>
          <div class="form-group">
            <label for="password" class="control-label">비밀번호:</label>
            <input type="password" class="form-control" id="id_password">
          </div>
          <div class="form-group" id="idDis">
            <label for="id" class="control-label">아이디:</label>
            <input type="text" class="form-control" id="id_id">
          </div>
        </form>
      </div>
      <div class="modal-footer">
		<div class="row" >
			 <div class="col">
		         <button type="button" class="btn btn-primary" id="id_searchBtn" >아이디조회</button>
		     </div>
			 <div class="col">
		         <button type="button" class="btn btn-default" id="id_CLose" data-dismiss="modal">Close</button>
		     </div>
		</div>   
      </div> <!-- modal-footer -->
    </div> <!-- modal-content  -->
  </div> <!-- modal-dialog  -->
</div> <!-- modal fade -->

</body>

</html>

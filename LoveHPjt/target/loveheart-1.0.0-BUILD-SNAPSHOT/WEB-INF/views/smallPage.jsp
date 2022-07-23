<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
.smallPage_div{background-color:;
	margin:0 auto;
	width:1000px;
	height: 900px;
}
.church_logo_div{background-color:;
	width:15%;
	height:385px;
	float: left;
}
.church_logo_div>img{
	width:100%;
	margin: 80% 0 0 0;
}
.img_div{background-color:#F4F4F4;
	margin-top:1%;
 	width: 100%;
 	height: 430px;
 	float: left;
 	overflow: hidden;
 	text-align: center;
}
.img_div>img{ /* 이미지 높이 430px*/
	height: 100%;
	width: 100%;
}
.welcom_div{background-color:;
	height:50px;
	width: 100%;
	font-size: 1.6em;
	font-weight: 600;
	line-height: 45px;
	float: left;
	text-align: left;
	border-bottom: 3px solid lightgray;
	color:gray;
}
.info_div{background-color:;
	width:100%;
	height:auto;
	float: left;
	overflow: auto;
	border-bottom: 3px solid lightgray;
}
.info_div>p{
	line-height: 38px;
	margin-left: 10px;
	color: gray;
	font-weight: 500;
}
.go_main{
	position:absolute;
	top:85%;
	right:0%;
	width:200px;
	height:60px;
	background-color: black;
	opacity: 0.5;
	border-radius: 8px 0 0 8px;
	padding: 0 0 0 10px ;
}
.right_banner_text{/*ul*/background-color:; 
	width:80px;
	margin-left: 10px;
	width: 100%;
}
.right_banner_text>li{
	float: left;
	color:gray;
	font-weight: 400;
	cursor: pointer;
	list-style-type: none;
}
.right_banner_text>li:nth-child(1){
	width:10%;
}
.right_banner_text>li:nth-child(2){
	width:70%;
}
.right_banner_text>li:nth-child(3){
	width:20%;
}
.hidden_notice{
	background-color:white;
	border:3px solid lightgray;
	border-radius: 8px 0 0 8px;
	top:51%;
	right:0%;
	display: none;
	width:500px;
	height: 300px;
	position: absolute;
	overflow: hidden;
}
#notice_span{
	cursor: pointer;
}
.notice_div1{background-color:;
	width:100%;
	height:60px;
	border-bottom: 2px solid lightgray;
}
.aspan4{
	color:gray;
	font-weight: 600;
	font-size: 1.6em;
	float: left;
	margin:0 0 0 5px;
}

/*     리스트   페이지 */
.empty_div{background-color:;
	width:100%;
	height: 20%;
}
.title_div{background-color:;
	border-bottom: 3px solid lightgray;
	font-size: 1.6em;
	font-weight: 600;
	color:gray;
	width:100%;
	height: 5%;
}
.list_div{background-color:;
	width:100%;
	height: 50%;
	overflow: hidden;
	border-bottom: 3px solid lightgray;
}
.put_cont_ul{background-color:;
	width:100%;
	padding:0px 0 0 0px;
	border:1px solid lightgray;
	box-sizing:border-box;
	overflow: hidden;
	margin-top: 5px;
	border-radius: 7px;
}
.put_cont_ul>li{background-color:;
	list-style-type: none;
	float:left;
	color: gray;
	font-weight: 500;
}
</style>
<script>
let voArray = new Array();
$(function(){
	pageMake();
	
	$('#notice_span').click(function(){
		$('.hidden_notice').toggle();
	});
	
});
function pageMake(){
	let voArrayLen=0;
	console.log(${address });
	if(${address} == 4){
		let infotext = "";
		getNotice(0);// 0 대신 교체 
		infotext = '<div class="img_div">';
		infotext += '	<img src="resources/img/${cont.picture}">';
		infotext += '</div>';
		infotext += '<div class="welcom_div">';
		infotext += 	'<span>${cont.welcome_upper}</span>';
		infotext += '</div>';
		infotext += '<div class="info_div">';
		infotext += 	'${cont.content}';
		infotext += '</div>';
		
		$('.smallPage_div').html(infotext);
	}else if(${address} == 5){
		getNotice(0); // 0 대신 교체 
		let infotext = "";
		infotext = '<div class="img_div">';
		infotext += 	'<img src="resources/img/${cont.picture}">';
		infotext += '</div>';
		infotext += '<div class="welcom_div">';
		infotext += 	'<span>${cont.welcome_upper}</span>';
		infotext += '</div>';
		infotext += '<div class="info_div">';
		infotext += 	'${cont.content}';
		infotext += '</div>';
		
		$('.smallPage_div').html(infotext);
	}
		else if(${address} == 100){//100 = notice
		let infotext = "";
		let put = "";
		getNotice(0);
			infotext = '<div class="empty_div">';
			infotext += '</div>';
			infotext += '<div class="title_div">';
			infotext += 'NOTICE'
			infotext += '</div>';
			infotext += '<div class="list_div">';
				$.ajax({
					url:"<%=request.getContextPath()%>/getNoticeMenu",
					success:function(result){
						$(result).each(function(idx,list){
							paging(idx);
							let put = "";
							put ='<ul style="height:30px" class="put_cont_ul" onclick="viewContent(this,'+list.notice_no+')" >';
							put += 	'<li style="width:5%; text-align:center;">'+list.notice_no+'.</li>';
							put += 	'<li style="width:85%;">'+list.notice_title+'</li>';
							put += 	'<li style="width:10%; text-align:center;">'+list.write_date+'</li>';
							put +=	'<li class="put_cont"></li>'
							put +='</ul>';
						$('.list_div').append(put);
						});	
					}
				})///ajax 끝
			infotext += '</div>'; //list_div 끝
			$('.smallPage_div').html(infotext);
			console.log('length ='+voArray.length);
	}//notice 끝
};
function viewContent(it, num){
	let ih = $(it).css('height');
	if(ih == '30px'){
		$(it).css('height','auto')
	}else{
		$(it).css('height','30px')
	}
		$.ajax({
			url:"<%=request.getContextPath()%>/getOnlyCont?no="+num+"",
			success:function(result){
					$('.put_cont').html(result);
			}
		});
	}
	
function paging(idx){
	voArray[idx]=idx;
	console.log(idx);
	
	let totalPage = Math.ceil(idx/10);
	return totalPage;
};
function getNotice(church_no){
	let params = {"no":church_no};
	let smallMenuLi = '';
	$.ajax({
		url:"<%=request.getContextPath()%>/getNoticeMenu",
		data:params,
		success:function(result){
			let r = $(result);
			r.each(function(idx, vo){
				smallMenuLi = '<div>';
				smallMenuLi +=	'<ul class="right_banner_text">';
				smallMenuLi +=		'<li>'
				smallMenuLi +=			vo.notice_no+'.';
				smallMenuLi +=		'</li>'
				smallMenuLi +=		'<li>';
				smallMenuLi += 			vo.notice_title;
				smallMenuLi +=		'</li>';
				smallMenuLi +=		'<li>';
				smallMenuLi += 			vo.write_date;
				smallMenuLi +=		'</li>';
				smallMenuLi +=	'</ul>';
				smallMenuLi +='</div>';
					
			$('.hidden_notice').append(smallMenuLi);
			});
		}
	});
};
</script>

<div class="smallPage_div">
</div>
	<div class="hidden_notice">
		<div class="notice_div1">
			<a href=""><span class="aspan4">NOTICE</span></a>
		</div>
	</div>
<div class="go_main">
	<span class="aspan2" id="notice_span">NOTICE</span>
	<span class="aspan2">|</span>
	<a href="<%=request.getContextPath()%>/"><span class="aspan2">MAIN</span></a>
	
</div>
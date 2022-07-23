<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/pc.css?ver=210402090642">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script >
window.onload = function () {
	var vm1 = new Vue({
		//el : "#test1",
		data : {
			a1 : 100 ,
			id : '',
			pwd : '',
		},
		// Vue °´Ã¼°¡ °ü¸®ÇÒ ¿ä¼ÒµéÀÌ ¸¸µé¾î Áö±âÀü¿¡ È£ÃâµÇ´Â ÇÔ¼ö
		beforeCreate : function () {
			console.log("Vue °´Ã¼°¡ °ü¸®ÇÒ ¿ä¼öµéÀÌ ¸¸µé¾îÁö±â ÀüÀÔ´Ï´Ù.")
			console.log("al : " + this.a1)
		},
		// Vue °´Ã¼°¡ °ü¸®ÇÒ ¿ä¼ÒµéÀÌ ¸¸µé¾îÁö°í ³­ ÀÌÈÄ 
		created : function () {
			console.log("Vue °´Ã¼°¡ °ü¸®ÇÒ ¿ä¼ÒµéÀÌ ¸¸µé¾îÁø ÈÄ ÀÔ´Ï´Ù.")
			console.log("al : " + this.a1)
			
		},
		// Vue °´Ã¼°¡ °ü¸®ÇÒ HTML ÅÂ±×°¡ ÇÒ´çµÇ±â Àü
		beforeMount : function () {
			console.log("Vue °´Ã¼°¡ °ü¸®ÇÒ ÅÂ±×°¡ ÇÒ´çµÇ±â ÀüÀÔ´Ï´Ù.")
		},

		// Vue °´Ã¼°¡ °ü¸®ÇÒ HTML ÅÂ±×°¡ ÇÒ´çµÈ ÈÄ
		mounted : function () {
			console.log("Vue °½Ã¼°¡ °ü¸®ÇÒ ÅÂ±×°¡ ÇÒ´çµÈ ÀÌÈÄÈü´Ï´Ù.")
		},
		
		beforeUpdate : function(){
			console.log("°ü¸®ÇÏ°íÀÖ´Â html ³»ºÎ ¿ä¼Ò°¡ º¯°æµÇ±â ÀüÀÔ´Ï´Ù.")
		},
		
		updated : function(){
			console.log("°ü¸®ÇÏ°íÀÖ´Â html ³»ºÎ ¿ä¼Ò°¡ º¯°æµÈ ÈÄ ÀÔ´Ï´Ù.")
		},
		
		beforeDestory : function () {
			console.log( "°´Ã¼ÀÇ ±â´ÉÀÌ ¼Ò¸êµÇ±â ÀüÀÔ´Ï´Ù." )
		},
		
		methods : {
			setValue : function () {
				this.a1 = 200
				
			}
		}	
	})
	
	vm1.$mount("#test1") 
}
	
</script>
<style type="text/css">
body{
background-color: #ececee;
}
h1{
background-color:yellow;
}
.screen_out{overflow:hidden;position:absolute;width:0;height:0;line-height:0;text-indent:-9999px}
.login_default{
    font-size: 12px;
    line-height: 1.5;
    font-family: '맑은 고딕','Malgun Gothic','Apple SD Gothic Neo','돋움',dotum,sans-serif;
    vertical-align:middle;
    letter-spacing: -1px;}
.inner_head {padding : 26px 0 23px; border-bottom : 1px solid # e0e0e0} 
.inner_head .link_daum {display : block; width : 98px; height : 40px; margin : 0 auto; background : #fff url (https://t1.daumcdn.net/id/logins/2020/ logo_daum.png) no-repeat 0 0}
.box_inp {position : relative; height : 46px; margin-top : 10px; border : 1px solid # d6d6d6; font-size : 15px}    
.fld_comm{position:relative;width:500px;margin:0 auto;background-color: #ffffff; }
.box_inp{position:relative;height:46px;margin-top:10px;border:1px solid #d6d6d6;font-size:15px}
.lab_g {position : absolute; top : 0; left : 0; height : 19px; padding : 14px 0 13px; font-size : 16px; color : # 888; line-height : 1.1; color : # 999; text-indent : 15px; 문자 간격 : -1px; pointer-events : none} .tf_g {display : block;width : 100 %; margin : 14px 0 13px; padding : 0 15px; border : 0 none; font-weight : bold; font-size : 16px; line-height : 1.1; color : # 101010; vertical-align : top; background-color : transparent; outline : 0; box-sizing : border-box}
.tf_g {display : block;width : 100 %; margin : 14px 0 13px; padding : 0 15px; border : 0 none; font-weight : bold; font-size : 16px; line-height : 1.1; color : # 101010; vertical-align : top; background-color : transparent; outline : 0; box-sizing : border-box}
.btn_del {display : none; position : absolute; top : 0; right : 0; width : 47px; height : 100 %}
.btn_del .ico_del {display : block; width : 20px; height : 20px; margin : 0 auto; background-position : -90px -380px; vertical-align : top}
.ico_login {background : url (https://t1.daumcdn.net/id/logins/2020/ico_login_201224.png) no-repeat 0 0; font-size : 0; line-height : 0; text-indent : -9999px}
.ico_del {display : block; width : 20px; height : 20px; margin : 0 auto; background-position : -90px -380px; vertical-align : top} .del_on .tf_g {padding-right : 50px}
.input_on{border:1px solid #5a94fd;background-color:#fafcff}
.tf_g{display:block;width:100%;margin:14px 0 13px;padding:0 15px;border:0 none;font-weight:bold;font-size:16px;line-height:1.1;color:#101010;vertical-align:top;background-color:transparent;outline:0;box-sizing:border-box}
.btn_comm{display:block;width:100%;height:50px;margin-top:20px;font-size:18px;line-height:52px;color:#fff;background:#4d87ef;text-align:center}
.btn_comm:before{display:inline-block;width:0;height:103%;vertical-align:middle;content:''}.login_rel{width:300px;margin:18px 0 0;font-weight:bold;font-size:13px;line-height:16px;font-family:"돋움",dotum,sans-serif;text-align:center}
</style>
</head>
<body>

<div id = "test1" class="login_default">
	<fieldset class="fld_comm">
		<div class="inner_head">
			<h1>
				<a href="https://www.daum.net" id="daumLogo" class="link_daum" alt="Daum"
				   data-tiara-action-name="Daum_첫화면">
					<span class="ir_wa">DAUM</span>
				</a>
			</h1>
		 </div>	
	 	 <div>
 	 		<span style="">아이디  </span>
	 	 	<input type="text" v-model="id" maxLength="10" />
	 	 </div>
		 <div class="box_inp "> <!-- input 포커스시 input_on클래스 추가 / 입력시, 입력내용삭제버튼 노출시 del_on클래스 추가 -->
			<label for="id" class="lab_g ">아이디 입력</label> <!-- 공통 : input입력시 lab_g요소에 screen_out클래스 추가 -->
			<input type="email" id="id" name="id" value="" class="tf_g" style="ime-mode:disabled;">
			<button type="button" class="btn_del" tabindex="-1" data-tiara-action-name="아이디_입력_내용_지우기"><span class="ico_login ico_del">입력 내용 지우기</span></button>
		 </div>	 	 
	 	 <p>
	 	 <div>
	 	 	<span>비밀번호</span>
	 	 	<input type="password" v-model="pwd"  maxLength="20"/>
	 	 </div>
	 	 <button type="button" class="btn_comm" v-on:click='setValue'>로그인</button> </div>
	</fieldset> 	 
</body>
</html>

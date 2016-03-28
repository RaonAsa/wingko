<%@ include file="../inc/file/sub_top.html"%>
    <div id="Wide">
    	<ul class="login_m"><!--로그인, 아이디/비밀번호찾기, 회원가입-->
        	<li><a href="login.jsp"><img src="../img/member/menu_login.png" alt="登录" /></a></li>
            <li><a href="idpw.jsp"><img src="../img/member/menu_password.png" alt="查找帐号/查找密码" /></a></li>
            <li><a href="join_s1.jsp"><img src="../img/member/menu_join.png" alt="注册会员" /></a></li>
        </ul>
        <div class="login">
        	<img src="../img/member/tit_idpw.png" alt="Login" />
            <div class="login_data">
            	此邮箱未注册. 您要注册吗？<!--등록되지 않은 이메일입니다. 가입하시겠습니까?--><br/>
                <a href="#"><img src="../img/member/btn_join.png" alt="注册会员" class="bt_space1"/></a><!--회원가입-->
            </div>
        </div>
    </div>
<%@ include file="../inc/file/sub_bottom.html"%>

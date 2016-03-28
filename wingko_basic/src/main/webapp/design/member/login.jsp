<%@ include file="../inc/file/sub_top.html"%>
    <div id="Wide">
    	<ul class="login_m"><!--로그인, 아이디/비밀번호찾기, 회원가입-->
        	<li><a href="login.jsp"><img src="../img/member/menu_login.png" alt="登录" /></a></li>
            <li><a href="idpw.jsp"><img src="../img/member/menu_password.png" alt="查找帐号/查找密码" /></a></li>
            <li><a href="join_s1.jsp"><img src="../img/member/menu_join.png" alt="注册会员" /></a></li>
        </ul>
        <div class="login">
        	<img src="../img/member/tit_login.png" alt="Login" />
            <div class="login_data">
            	<img src="../img/member/txt_welcome.png" alt="한국관광의 모든것, 윙코스토리에 오신것을 환영합니다." />
                <table class="idpw">
                	<caption>로그인</caption>
                    <colgroup>
                    	<col width="60px" />
                    	<col width="180px" />
                    	<col width="85px" />
                    </colgroup>
                    <tr>
                    	<td><img src="../img/member/txt_id.png" alt="ID" /></td>
                        <td><input type="text" class="login_txt" style="width:100%; margin-bottom:5px;" /></td>
                        <td rowspan="2"><a href="#"><img src="../img/member/bt_login.png" alt="登录" /></a></td>
                    </tr>
                    <tr>
                    	<td><img src="../img/member/txt_password.png" alt="Password" /></td>
                        <td><input type="password" class="login_txt" style="width:100%;" /></td>
                    </tr>
                    <tr>
                    	<td colspan="3" class="btn">
                        	<a href="#"><img src="../img/member/bt_join.png" alt="注册会员" /></a> <a href="#"><img src="../img/member/bt_password.png" alt="查找帐号/查找密码" /></a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
<%@ include file="../inc/file/sub_bottom.html"%>

<%@ include file="../inc/file/sub_top.html"%>
    <div id="Wide">
    	<ul class="login_m"><!--로그인, 아이디/비밀번호찾기, 회원가입-->
        	<li><a href="login.jsp"><img src="../img/member/menu_login.png" alt="登录" /></a></li>
            <li><a href="idpw.jsp"><img src="../img/member/menu_password.png" alt="查找帐号/查找密码" /></a></li>
            <li><a href="join_s1.jsp"><img src="../img/member/menu_join.png" alt="注册会员" /></a></li>
        </ul>
        <div class="login">
        	<img src="../img/member/tit_idpw.png" alt="Login" />
            <div class="sch_data">
            	<div class="sch_id">
                	<table class="ta_idpw"><!--비밀번호찾기-->
                    	<caption>ID찾기</caption>
                        <colgroup>
                        	<col width="55px" />
                            <col width="265px" />
                        </colgroup>
                        <tr>
                        	<th colspan="2" class="t"><img src="../img/member/txt_sch_id.png" alt="查找用户名" /></th>
                        </tr>
                        <tr>
                        	<th>姓名</th>
                            <td><input type="text" class="login_txt" style="width:95%;" /></td>
                        </tr>
                        <tr>
                        	<th>电子邮件</th>
                            <td><input type="text" class="login_txt" style="width:36%;" /> @ <input type="text" class="login_txt" style="width:50%;" /></td>
                        </tr>
                        <tr>
                        	<th></th>
                            <td align="right"><a href="#"><img src="../img/member/bt_sch_id.png" alt="查找用户名" /></a></td>
                        </tr>
                    </table>
                </div>
                <div class="sch_pw"><!--아이디찾기-->
                	<table class="ta_idpw">
                    	<caption>ID찾기</caption>
                        <colgroup>
                        	<col width="55px" />
                            <col width="265px" />
                        </colgroup>
                        <tr>
                        	<th colspan="2" class="t"><img src="../img/member/txt_sch_pw.png" alt="查找密码" /></th>
                        </tr>
                        <tr>
                        	<th>用户名</th>
                            <td><input type="text" class="login_txt" style="width:95%;" /></td>
                        </tr>
                        <tr>
                        	<th>姓名</th>
                            <td><input type="text" class="login_txt" style="width:95%;" /></td>
                        </tr>
                        <tr>
                        	<th>电子邮件</th>
                            <td><input type="text" class="login_txt" style="width:36%;" /> @ <input type="text" class="login_txt" style="width:50%;" /></td>
                        </tr>
                        <tr>
                        	<th></th>
                            <td align="right"><a href="#"><img src="../img/member/bt_sch_pw.png" alt="查找密码" /></a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
<%@ include file="../inc/file/sub_bottom.html"%>

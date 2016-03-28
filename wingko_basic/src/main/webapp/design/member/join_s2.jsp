<%@ include file="../inc/file/sub_top.html"%>
    <div id="Wide">
    	<ul class="login_m"><!--로그인, 아이디/비밀번호찾기, 회원가입-->
        	<li><a href="login.jsp"><img src="../img/member/menu_login.png" alt="登录" /></a></li>
            <li><a href="idpw.jsp"><img src="../img/member/menu_password.png" alt="查找帐号/查找密码" /></a></li>
            <li><a href="join_s1.jsp"><img src="../img/member/menu_join.png" alt="注册会员" /></a></li>
        </ul>
        <div class="login">
        	<img src="../img/member/tit_join.png" alt="Wingko注册会员" />
            <div class="join_data">
            	<div class="join_step"><img src="../img/member/step2.png" alt="step2" /></div><!--회원가입2단계-->
                <h3>기본정보입력</h3>
                <table class="join_basic_data">
                	<caption>회원가입 기본정보입력</caption>
                    <colgroup>
                    	<col width="20%" />
                        <col width="80%" />
                    </colgroup>
                    <tr>
                    	<th>ID</th>
                        <td>
                        	<input type="password" class="login_txt" style="width:80%;" /> <a href="#"><img src="../img/member/btn_dupilication_use.png" alt="重复检查" align="absmiddle" /></a>
                        </td>
                    </tr>
                    <tr>
                    	<th>Email</th>
                        <td>
                        	<input type="password" class="login_txt" style="width:80%; margin-bottom:4px;" /> <a href="#"><img src="../img/member/btn_dupilication_use.png" alt="重复检查" align="absmiddle" /></a>
                        	<!--<span>可以用这个绰号</span> 변경가능한 닉네임입니다-->
                            <!--<span>不可以用这个绰号</span> 사용 불가능한 닉네임입니다-->
                        </td>
                    </tr>
                    <tr>
                    	<th>Nickname</th>
                        <td>
                        	<input type="password" class="login_txt" style="width:80%; margin-bottom:4px;" /> <a href="#"><img src="../img/member/btn_dupilication_use.png" alt="重复检查" align="absmiddle" /></a>
                        	<!--<span>可以用这个绰号</span> 변경가능한 닉네임입니다-->
                            <!--<span>不可以用这个绰号</span> 사용 불가능한 닉네임입니다-->
                        </td>
                    </tr>
                    <tr>
                    	<th>密码</th>
                        <td><input type="password" class="login_txt" style="width:80%; margin-bottom:4px;" /><br/><span class="noti">6~12자의 영문소문자와 숫자</span></td>
                    </tr>
                    <tr>
                    	<th>密码确认</th>
                        <td><input type="password" class="login_txt" style="width:80%;" /></td>
                    </tr>
                    <tr>
                    	<th>姓名</th>
                        <td><input type="password" class="login_txt" style="width:80%;" /></td>
                    </tr>
                    <tr>
                    	<th>性别</th>
                        <td><input type="radio" /> 男 &nbsp;&nbsp; <input type="radio" /> 女</td>
                    </tr>
                    <tr>
                    	<th>手机号码</th>
                        <td><input type="password" class="login_txt" style="width:80%; margin-bottom:4px;" /><br/><span>为方便购买或预约，请正确输入个人信息</span></td>
                    </tr>
                </table>
                <div class="bt_center"><a href="#"><img src="../img/member/btn_join_big.png" alt="注册会员" /></a> <a href="#"><img src="../img/member/btn_cancel.png" alt="取消" /></a></div>
            </div>
        </div>
    </div>
<%@ include file="../inc/file/sub_bottom.html"%>

<%--
  - 작성자  yshsy
  - 작성일자 2013. 8. 1.
  - 내용
  - : 상단고정
  --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/message.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#next").click(function(){
			if ($("#use").is(":checked") == false) {
				alert(m.check.use_agree);
				$("#use").focus();
			} else if ($("#private").is(":checked") == false) {
				alert(m.check.private_agree);
				$("#private").focus();
			} else {
				$("#frm").submit();
			}
		});
	});
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />

    <div id="Wide">
    	<!-- Join Tab -->
		<c:import url="../inc/join_tab.jsp" charEncoding="UTF-8" />
		
        <div class="login">
        	<form id="frm" action="/join/join_s2.do" method="post">
        	<input type="hidden" name="join_no" value="${c}" />
        	<img src="/resources/img/member/tit_join.png" alt="Wingko注册会员" />
            <div class="join_data">
            	<div class="join_step"><img src="/resources/img/member/step1.png" alt="step1" /></div><!--회원가입1단계-->
                <h3>WingKo 同意上述使用条款</h3>
                <div class="provision">
第1章 总则<br />
<br />
&nbsp; 第1条 (目的)<br />
&nbsp; &nbsp; &nbsp;本条款的目的是规定WINGKO COMMUICATION(以下简称&ldquo;WINGKO&rdquo;)与用户在wingkostory服务(以下 &nbsp; 简称&ldquo;服务&rdquo;)使用中的权利、义务和责任及其他所需事项。&nbsp;<br />
<br />
&nbsp; 第2条 (条款的效力与变更)<br />
&nbsp; &nbsp; ① 本条款自WINGKO通过服务画面告知并获取用户同意后生效。<br />
&nbsp; &nbsp; ② WINGKO在不违反&ldquo;关于条款的规定等法律&rdquo;、《电气通信事业法令》、&ldquo;关于促进信息通信使用与信息保护&nbsp;<br />
&nbsp; &nbsp; &nbsp; &nbsp;等的法律&rdquo;、《个人信息保护法》等相关法令的情况下，可对本条款的内容进行修改或变更。<br />
③ WINGKO对条款进行改订时，明确表明现有条款与修改条款及适用日期与修改理由，并自适用日期7日前&nbsp;<br />
至以后相当长时间内，如修改内容对会员不利时，则自适用日期30日前至适用日期以后相当长时间内在服务主页上进行通知。<br />
④ WINGKO根据前一项通知会员，如WINGKO在明确告知自通知日起至改订条款实施7日后不表示拒绝则看作同意之后，会员仍无意思表示时，WINGKO将认为会员对变更的条款表示同意。会员对修改条款不同意时，可根据第2章第3条第1项的规定中止使用合同。<br />
<br />
第3条 (用语的定义)<br />
本条款中所使用的用语定义如下：<br />
&nbsp; ① 用户：接受WINGKO所提供服务的会员与非会员<br />
&nbsp; ② 会员：指与WINGKO签订服务使用合同并被授予用户名的个人或法人及属于法人的团体组织，分别由 &nbsp; &nbsp; 本国个人会员、外国个人会员、本国团体会员、外国团体会员构成。<br />
&nbsp; ③ 非会员：未加入会员而使用WINGKO所提供服务者<br />
&nbsp; ④ 用户名(ID)：为识别会员及会员的服务使用而由会员设置并经WINGKO承认的文字或数字的组合<br />
&nbsp; ⑤ 密码：为保护会员的个人信息而由会员自己设置的文字或数字的组合<br />
&nbsp; ⑥ 中止：WINGKO或会员在服务开通后解除使用合同<br />
<br />
第2章 会员的加入与管理<br />
<br />
&nbsp; 第1条 (加入会员)<br />
&nbsp; &nbsp; &nbsp;用户在申请加入会员时， 同意本条款内容后即可申请加入，经WINGKO承认后成为会员。<br />
<br />
&nbsp; 第2条 (会员信息的变更)<br />
&nbsp; &nbsp; &nbsp;会员通过个人信息管理画面可随时查看和修改本人的个人信息。会员提出使用申请时所输入的会员信息变&nbsp;<br />
更时，必须由本人亲自在网上进行修改，因未进行信息变更所引发的问题由会员承担责任。<br />
<br />
&nbsp; 第3条 (退出会员与丧失资格、服务使用限制等)<br />
&nbsp; &nbsp; ① 会员希望退出时，可提出退出要求，WINGKO将根据有关法律规定对此进行处理。会员自动解约时， &nbsp;<br />
WINGKO会根据相关法律与个人信息处理方针删除会员信息。退出Wingkostory后，相关会员可随时根<br />
据会员加入程序重新加入。<br />
会员在出现下列情况时，WINGKO可对其会员资格进行限制、中止或要求其重新加入。<br />
&nbsp;1. 申请加入时输入虚假内容时<br />
&nbsp;2. 妨碍他人使用服务或损坏他人名誉、盗用他人信息等威胁电子交易与信息通信服务使用秩序时<br />
&nbsp;3. 变更所输入信息等妨碍WINGKO的管理时<br />
&nbsp;4. 辱骂特定国家或个人与团体，可能引起外交摩擦时<br />
&nbsp;5. 出现法律和本条款禁止或违反公共秩序与道德的行为时<br />
&nbsp;6. 违反4章第第2条、第3条时<br />
② WINGKO在对会员实施会员资格限制与中止服务使用后，如其不进行纠正，则可取消其会员资格。<br />
<br />
第3章 服务的使用<br />
<br />
&nbsp; 第1条 (服务的种类)<br />
<br />
&nbsp; &nbsp; &nbsp;WINGKO向用户提供的服务分基本服务与附加服务等，服务的种类与内容等根据WINGKO在通知或服务内 &nbsp; &nbsp; &nbsp;容介绍中的单独规定来决定。<br />
<br />
&nbsp; 第2条 (服务的使用时间)<br />
&nbsp; &nbsp; ① 原则上为全天候提供服务，WINGKO因业务、管理、技术等原因可暂时中止全部或部分服务，出现上述情 &nbsp; &nbsp; &nbsp; 况时，其内容会提前通知。<br />
&nbsp; &nbsp; ② WINGKO可单独规定服务的使用时间，出现此种情况时，其内容会提前通知。<br />
<br />
&nbsp; 第3条 (服务的变更)<br />
&nbsp; &nbsp; &nbsp; WINGKO有重大理由时，可根据业务、管理、技术需要变更或中断正在提供的全部或部分服务，出现此种&nbsp;<br />
情况时，其内容会提前通知。<br />
<br />
第4章 义务与责任<br />
<br />
&nbsp; 第1条 (WINGKO的义务)<br />
&nbsp; &nbsp; ① WINGKO不做出相关法律和本条款所禁止或违反道德规范的行为，并尽力提供持续稳定的服务。<br />
&nbsp; &nbsp; ② WINGKO在收到会员对服务的不满投诉时，应立即进行处理；如立即处理有困难，则应通知相关会员其理 &nbsp; &nbsp; &nbsp; 由与处理日程。<br />
&nbsp; &nbsp; ③ 未经会员同意，WINGKO不发送商业性电子邮件。<br />
&nbsp; &nbsp; ④ 未经本人同意，WINGKO不向第三者泄露、传播提供服务过程中获得的会员个人信息，并致力于对其进行 &nbsp; &nbsp; &nbsp; 保护。会员的个人信息保护与使用根据相关法律与个人信息处理方针进行。<br />
<br />
&nbsp; &nbsp;第2条 (会员的义务)<br />
&nbsp; &nbsp; &nbsp; &nbsp; 会员不应出现下列行为：<br />
&nbsp; &nbsp; &nbsp;① 申请或变更时输入虚假内容<br />
&nbsp; &nbsp; &nbsp;② 盗用他人信息<br />
&nbsp; &nbsp; &nbsp;③ 变更WINGKO告知的信息<br />
&nbsp; &nbsp; &nbsp;④ 发送或刊登WINGKO规定的信息之外的信息(电脑程序等)等<br />
&nbsp; &nbsp; &nbsp;⑤ 侵犯WINGKO与其他第三方的著作权等知识产权<br />
&nbsp; &nbsp; &nbsp;⑥ 损坏WINGKO与其他第三方的名誉或有妨碍业务的行为<br />
&nbsp; &nbsp; &nbsp;⑦ 在服务中公开或刊登暴力信息、视频、语音及其他违反公共秩序和道德的信息<br />
&nbsp; &nbsp; &nbsp;⑧ 未经WINGKO同意而将服务用于营利目的<br />
&nbsp; &nbsp; &nbsp;⑨ 其他非法或不恰当行为<br />
<br />
&nbsp; &nbsp;第3条 (禁止转让)<br />
&nbsp; &nbsp; &nbsp; &nbsp;会员不能向他人转让、赠送服务的使用权限、其他使用合同中的地位等，也不能用其作为担保。<br />
<br />
&nbsp; &nbsp;第4条 (关于留言的权利与责任)<br />
&nbsp; &nbsp; &nbsp;① Wingkostory获得内容提供者同意时，相关内容的一切权利归Wingkostoryr所有。但是，包括通过社区 &nbsp; &nbsp; &nbsp; &nbsp;与留言板等提供的留言的著作权在内，所有权利与责任归留言会员所有，WINGKO拥有在服务中进行刊 &nbsp; &nbsp; &nbsp; &nbsp; 载的权利。<br />
&nbsp; &nbsp; &nbsp;② 会员不能对使用服务中获得的信息进行加工、销售等，不能用于商业目的。用于非商业目的，则必须经过 &nbsp; &nbsp; &nbsp; &nbsp;WINGKO的同意。<br />
&nbsp; &nbsp; &nbsp;③ WINGKO对会员在服务中刊登或通过服务发送、接收的内容及后果不承担责任。<br />
符合下列情况时，可任意删除其留言。<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1. 有诽谤他人或侵犯隐私、损坏名誉的内容<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2. 有违反公共秩序与传统美德的内容<br />
&nbsp; &nbsp; &nbsp; &nbsp; 3. 妨碍或将要妨碍服务的提供时<br />
&nbsp; &nbsp; &nbsp; &nbsp; 4. 有与犯罪行为有关的内容<br />
&nbsp; &nbsp; &nbsp; &nbsp; 5. 有侵犯WINGKO的知识产权、他人的知识产权等其他权利的内容<br />
&nbsp; &nbsp; &nbsp; &nbsp; 6. 刊登特定产品的宣传等有其他商业目的的内容<br />
&nbsp; &nbsp; &nbsp; &nbsp; 7. 擅自修改所输入的信息<br />
&nbsp; &nbsp; &nbsp; &nbsp; 8. 盗用其他会员的用户名、密码<br />
&nbsp; &nbsp; &nbsp; &nbsp; 9. 与留言板目的不符的网上示威与灌水的内容<br />
&nbsp; &nbsp; &nbsp; &nbsp;10. 违反其他相关法规时<br />
&nbsp; &nbsp; ④ 会员同意Wingkostory在&ldquo;My Page&rdquo;内对存储容量、内容存储的有效期等进行限制 ，并同意对一定时间 &nbsp; &nbsp; &nbsp; &nbsp;未使用的&ldquo;My Page&rdquo;进行临时中断或删除。<br />
<br />
&nbsp; &nbsp;第5条 (责任限制)<br />
&nbsp; &nbsp; &nbsp;① WINGKO在因自然灾害或不可抗力因素而无法提供服务时，不承担与服务提供有关的责任。<br />
&nbsp; &nbsp; &nbsp;② WINGKO对因会员引起的服务使用中的障碍不承担责任。<br />
&nbsp; &nbsp; &nbsp;③ WINGKO对会员登出的与服务有关的信息、资料、事实的可信度、准确性等内容不承担责任。<br />
&nbsp; &nbsp; &nbsp;④ WINGKO对会员之间或会员与第三方之间以服务为媒介进行的交易等不承担责任。<br />
<br />
&nbsp; &nbsp;第6条 (纠纷的解决)<br />
&nbsp; &nbsp; &nbsp; &nbsp;本条款根据大韩民国法律制定并履行，如果WINGKO与会员间发生服务使用纠纷， 将协商由管辖民事诉 &nbsp; &nbsp; &nbsp; &nbsp;讼法中规定住所地的法院管辖。<br />
<br />
&nbsp; &nbsp;第7条 (规定的遵守)<br />
&nbsp; &nbsp; &nbsp; &nbsp;本条款未作规定的情况将依据相关法律法规，法律未作规定的部分则将按照习惯处理。<br />

                </div>
                <h4><input type="checkbox" name="use" id="use" /> 同意上述使用条款</h4>
                <br/><br/><br/>
                <h3>WingKo 同意个人信息收集</h3>
                <div class="provision">
1. 目的：旅行信息服务、在线会员管理 <br/>
2. 收集的项目：<br/>
- 必填项：国籍、使用语言、姓名、性别、出生年月日、地址、电子邮件地址<br/>
- 选填项：电话号码、手机号码、所属组织、部门与职称(团体与旅行社会员)><br/>
3. 收集方法：在主页上加入会员<br/>
4. 个人信息保留与使用时间：自同意日起至撤回同意(职权中止)时为止<br/><br/>
                </div>
                <h4><input type="checkbox" name="private" id="private"/> 同意上述使用条款</h4>
                <br/><br/><br/>
                <div class="bt_center"><a href="javascript:void();" id="next"><img src="/resources/img/member/bt_next.png" alt="下一步" /></a></div>
            </div>
           	</form>
        </div>
    </div>

</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>
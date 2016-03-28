<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="keywords" content="微企测试、微信营销、微信代运营、微信托管、微网站、微商城、微营销、微信定制开发">
<meta name="description" content="<?php echo $_SERVER['WEB_NAME']; ?>,微信公众智能服务平台,微企十大微体系:微菜单、微官网、微会员、微活动、微商城、微推送、微服务、微统计、微支付、微客服,企业微营销必备。">
        <!-- Mobile Devices Support @begin -->
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
            <meta name="apple-mobile-web-app-capable" content="yes" /> <!-- apple devices fullscreen -->
            <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
			<script src="/static/wxgjcn/src/html5.js" ></script>
    <link rel="stylesheet" type="text/css" href="/static/wxgjcn/css/bootstrap.css-2014-03-07-1.css"  media="all" />
<link rel="stylesheet" type="text/css" href="/static/wxgjcn/css/reg.css-2014-03-07-1.css"  media="all" />
<link rel="stylesheet" type="text/css" href="/static/wxgjcn/css/www/login/style.css-2014-03-07-1.css"  media="all" />
<link rel="stylesheet" type="text/css" href="/static/wxgjcn/css/www/index1/index.css-2014-03-07-1.css"  media="all" />
<script type="text/javascript" src="/static/wxgjcn/src/jQuery.js-2014-03-07-1.js" ></script>
<script type="text/javascript" src="/static/wxgjcn/src/utils/bootstrap.js-2014-03-07-1.js" ></script>
<script type="text/javascript" src="/static/wxgjcn/src/utils/omvalidate.js-2014-03-07-1.js" ></script>
<script type="text/javascript" src="/static/wxgjcn/src/www/index1/reg.js-2014-03-07-1.js" ></script>
<script type="text/javascript" src="/static/wxgjcn/src/www/placeholder.js-2014-03-07-1.js" ></script>
<script type="text/javascript" src="/static/wxgjcn/src/www/index1/weimob-index.js-2014-03-07-1.js" ></script>
        <!-- Mobile Devices Support @end -->
<!--         <link rel="stylesheet" type="text/css" href="http://stc.weimob.com/css/bootstrap.css?2013-10-21-2" media="all" /> -->
  <!-- <link rel="stylesheet" type="text/css" href="http://stc.weimob.com/css/reg.css?2013-10-21-2" media="all" /> -->
<link rel="stylesheet" href="<?php echo $CSS; ?>reg_1.css">
<link rel="stylesheet" href="<?php echo $CSS; ?>reg_2.css">
<link rel="stylesheet" href="<?php echo $CSS; ?>reg.css">
<link rel="shortcut icon" href="<?php if ($_SERVER['IS_OEM']){ ?>/favicon.ico<?php }else{ ?>/faviconmy.ico<?php } ?>" />
<title>注册 - <?php echo $_SERVER['WEB_NAME']; ?>中心</title><script type="text/javascript">var yyuc_jspath = "/@system/";</script><script type="text/javascript" src="/@system/js/jquery.js"></script><script type="text/javascript" src="/@system/js/yyucadapter.js"></script>
        <!--[if IE 7]>
            <link href="http://stc.weimob.com/css/font_awesome_ie7.css" rel="stylesheet" />
        <![endif]-->
        <!--[if lte IE 8]>
            <script src="http://stc.weimob.com/js/excanvas_min.js"></script>
        <![endif]-->
        <!--[if lte IE 9]>
            <script src="http://stc.weimob.com/js/watermark.js"></script>
        <![endif]-->
    </head>
 <body>
	<div class="nav clearfix">
	<div class="nav-content">
		<h1 class="left"><a href="/"   title="微企—国内优秀的微信公众服务平台官网">微企—国内优秀的微信公众服务平台·微信营销，如此简单！</a></h1>
		<div class="left city">
			<h2>上海</h2>
							<a href="/static/wxgjcn/city1.htm" >
					切换城市<i class="tri4"></i>
				</a>
					</div>
		<div class="right line-li">
        
			 <ul>
        <li><a href="/" >首页</a></li>
        <li><a href="/static/wxgjcn/case1.htm"  >经典案例</a></li>
	    <li class="nav_menu_li_1"><a style="width:70px; text-align:left;" class="_hover">产品中心<i></i></a>
					 <div class="sub-nav">
						 <a href="/static/wxgjcn/package.htm"  target="_black">服务套餐</a>
						 <a href="/static/wxgjcn/guide1.htm" >功能介绍</a>
						 

					 </div>

	    </li>
        <li><a href="/static/wxgjcn/proxy1.htm"  >渠道代理</a></li>
        <li><a href="/static/wxgjcn/help.htm"   target="_black">帮助</a></li>
    </ul>
            <div class="account">
        <a href="/reg.html"  class="btn-reg btn0" target="_black">가입</a>
                  <a href="/login.html" class="btn-login btn0" target="_black">등록</a>
		</div>
		</div>
	</div>
</div>

<div id="loginBox">
		<div class="login-panel">
			<h3>登录</h3>
			<div class="login-mod">
				<div class="login-err-panel dn" id="err_area">
					<span class="icon-wrapper"><i class="icon24-login err" style="margin-top:-.2em;*margin-top:0;"></i></span>
					<span id="err_tips"></span>
				</div>
				
				
				<form  action="/sys/compilations/login.php" method="post" class="login-form" id="login-form">
					<div class="login-un">
						<span class="icon-wrapper"><i class="icon24-login un"></i></span>
						<input type="text" value="" name="fT08d9e827ffbba2efe4413cb064bbf847un" id="fun" tabindex="1" class="ipt tipinput1" placeholder="请输入您的账号">
					</div>
					<div class="login-pwd">
						<span class="icon-wrapper"><i class="icon24-login pwd"></i></span>
						<input type="password" value="" name="fT08d9e827ffbba2efe4413cb064bbf847pwd" id="fpwd" tabindex="2" class="ipt tipinput1" placeholder="请输入您的密码">
					</div>
					<input type="submit" tabindex="4" class="login-btn" id="btn-login" value="">
				</form>
				<div class="login-help-panel">
					<a id="rememberPwd" class="login-remember-pwd" href="javascript:;">
						<input type="checkbox" id="rememberPwdIcon">记住帐号
					</a>
					<a class="login-forget-pwd" href="/static/wxgjcn/forgotpassword/index.html" >忘记密码？</a>
                    <a class="login-forget-pwd" href="/reg.html" >新用户注册</a>
				</div>
				
			</div>
		</div>
		<div class="login-cover" onclick="loginBox.toggle(this, event);"></div>
	</div>
	
	
<div id="ie9-tips" class="clearfix">
	<div id="tipsPanel">
		<div id="tipsDesc">系统检测到您所使用的浏览器版本较低，推荐使用<a   target="_blank">Firefox</a>或<a   target="_blank">Chrome</a>浏览器打开，否则将无法体验完整产品功能。</div>
		<a id="stopSuggestA" href="javascript:;">×</a>
	</div>
</div>
<script>
var $do_submit = false;

// 绑定回车键
$('#loginBox').keydown(function(e){
	if(13 == event.keyCode){
		login();
	}
});

	function login()
	{
		if (true == $do_submit)
		{
			return false;
		}

		var $pre_submit = '登录', $done_submit = '登录中...';
		var $username = $('#fun').val(), $password = $('#fpwd').val(), $keepalive = $('#rememberPwdIcon').val();
		$('#login_button').text($done_submit);
		$do_submit = true;

		// check
		if ('' == $username || '' == $password)
		{
			$('#err_tips').text('您输入的微企—国内优秀的微信公众服务平台号或密码错误，请重新输入！');
			$('#err_area').show();
			$('#login_button').text($pre_submit);
			$do_submit = false;
			return false;
		}

		var $login_data = {
			username:$username,
			password:$password,
			keepalive:$keepalive
		};
		$.post('/login', $login_data, function(rs){
			if(rs.errno == 200)
			{
				location.href = rs.url_route;
			}
			else
			{
				$('#err_tips').text(rs.error);
				$('#err_area').show();
				$('#login_button').text($pre_submit);
			}
			$do_submit = false;
		}, 'json');
	}
</script>

	<div class="mainbody">
		
     <div class="reg-wrapper2">
		<form id="regform" class="form-horizontal" action="" method="post">
		<?php if ($fromqq){ ?>
		<div class="control-group">
		    <label class="control-label" for="username">QQ头像</label>
		    <div class="controls" >
		       <img alt="" src="<?php echo $lastdata['pic']; ?>">
		       <span style="font-size: 18px;font-weight: bold;color: gray;">[QQ帐号关联注册]</span>
		    </div>
		</div>
		<?php } ?>
		  <div class="control-group">
		    <label class="control-label" for="username">계정명</label>
		    <div class="controls" >
		       <?php echo $user->text('un'); ?>
		      <span class="maroon">*</span><span class="help-inline">6~16자리 설정</span>
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="password">비밀번호설정</label>
		    <div class="controls">
		      <?php echo $user->password('pwd'); ?>
		      <span class="maroon">*</span><span class="help-inline">6~16자리 설정</span>
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="repassword">비밀번호확인</label>
		    <div class="controls">
		      <?php echo $user->password('repwd'); ?>
		     <?php echo Session::flush('cperr'); ?>
		    </div>
		  </div>
		  <!--
           <div class="control-group">
		    <label class="control-label" for="phone">所在区域</label>
		    <div class="controls">
		     <?php echo $user->mulselect('chinaarea',array('l_sheng','l_shi','l_xianqu')); ?>
		      <span class="maroon">*</span><span class="help-inline"></span>
		    </div>
		  </div>
		  -->
           <div class="control-group">
		    <label class="control-label" for="phone">담당자명</label>
		    <div class="controls">
		     <?php echo $user->text('lxr'); ?>
		      <span class="maroon">*</span><span class="help-inline"></span>
		    </div>
		  </div>
            <div class="control-group">
		    <label class="control-label" for="phone">휴대폰</label>
		    <div class="controls">
		     <?php echo $user->text('telephone'); ?>
		      <span class="maroon">*</span><span class="help-inline">공란없이 기재</span>
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="email">이메일주소</label>
		    <div class="controls">
		      <?php echo $user->email('email'); ?>
		      <!-- <span class="maroon">*</span><span class="help-inline">邮箱将与支付及优惠相关，请填写正确的邮箱</span> -->
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="qq">QQ</label>
		    <div class="controls">
		      <?php echo $user->text('qq'); ?>
		    </div>
		  </div>


		  <div class="control-group">
		    <label class="control-label" for="randcode">인증부호</label>
		    <div class="controls">
		     <?php echo $user->vercode('codearea',60,30,'value="" class="base_input code"'); ?>

		       <span id="codearea"></span>
		    </div>
		  </div>
		  <div class="control-group">
		  	<div class="controls">
                <button type="button" class="btn-register" onclick="registerUser()"></button>
		  	</div>
		  	</div>
		  </div>
		</form>
		
     </div>
     <!-- =========  -->
    <!--
	<div class="overlay" style="display: block; "></div>
	<div id="reg-select" style="display: block; ">
		<div class="overlay-cont">
			<div id="type1" class="reg-type">
				<h1>我还没有公众号</h1>
				<a target="_blank" href="http://mp.weixin.qq.com/" class="sel-btn">
					前往公众平台申请
				</a>
				<p>说明：公众号申请后，需要一星期才能打开开发模式。只有开发模式开启才能使用<?php echo $_SERVER['WEB_NAME']; ?>的智能服务；</p>
			</div>
			<div class="sep"></div>
			<div id="type2" class="reg-type">
				<h1>我已有公众号了</h1>
				<a id="reg-now" href="javascript:;" class="sel-btn">
					注册<?php echo $_SERVER['WEB_NAME']; ?>账号
				</a>
				<p>说明：请确认你的公众账号资料已填写完整，并具有【开发模式】的高级功能；</p>
			</div>
		</div>
	</div>
 -->
	<script type="text/javascript">
	$(function(){
		$("#reg-now").click(function(){
			$('.overlay').hide();
			$('#reg-select').hide();
			$('#username').focus();
		});
	});

	function registerUser(){
		$('.help-inline').remove();
		$('.maroon').css('display','none')
		$('#regform').validate(function(m){
		    if(m.length>0){
		        for(var i=0;i<m.length;i++){
		            //m[i].e为验证错误的表单元素
		            //m[i].m该单元的错误信息（非空错误为false，其他为信息数组）
		 			var ntip = $('<span class="help-inline" style="color:red">'+(m[i].m===false?'该项内容不能为空':m[i].m.join(','))+'</span>');
		            $(m[i].e).after(ntip.show());
		            $(m[i].e).one('blur',function(){
		            	ntip.remove();
		            });
		        }
		    }else{
		    	if(checkname($('#userun').val())){
		    		$('form').submit();
		    	}else{
		    		tusi('用户名格式不合法');
		    	}

		    }
		});
	}

	function checkname(str){
		  return str.match(/^([\u4e00-\u9fa5]|[\ufe30-\uffa0]|[A-Za-z0-9_])*$/);
	}
</script>
<div class="footer">
	<div class="footer-content clearfix">
		<div class="foot-menu">
			<p>
				<a href="/static/wxgjcn/index1.htm"  target="_blank">微企—国内优秀的微信公众服务平台首页</a>&nbsp;|&nbsp;
				<a href="/reg.html"  target="_blank">申请入驻</a>&nbsp;|&nbsp;
				<a href="/static/wxgjcn/proxy1.htm"  target="_blank">渠道代理</a>&nbsp;|&nbsp;
				<a href="/static/wxgjcn/about1.htm"  target="_blank">关于微企</a>&nbsp;|&nbsp;
				<a href="/static/wxgjcn/agents.htm"  target="_blank">授权认证</a>&nbsp;|&nbsp;
				<a href="/static/wxgjcn/jobs.htm"  target="_blank">加入微企</a>
			</p>
			<p>免费热线：400-000-0000&nbsp;&nbsp;&nbsp;QQ：2943747028&nbsp;&nbsp;&nbsp;邮箱：2943747028@qq.com</p>
			<p>地址：
								湖南省长沙市</p>
		</div>
		<div class="copyright">
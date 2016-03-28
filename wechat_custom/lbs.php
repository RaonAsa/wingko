<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<!-- Apple devices fullscreen -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- Apple devices fullscreen -->
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<base target="mainFrame" />
<link rel="stylesheet" type="text/css" href="/css/wm/index.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/wm/bootstrap_min.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/wm/bootstrap_responsive_min.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/wm/style.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/wm/themes.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/wm/todc_bootstrap.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/wm/inside.css" media="all" />
<link rel="stylesheet" type="text/css" href="/css/wm/album.css" media="all" />
<title><?php echo $_SERVER['WEB_NAME']; ?>—国内最大的微信公众服务平台</title>
<script type="text/javascript">var yyuc_jspath = "/@system/";</script>
<script type="text/javascript" src="/@system/js/jquery.js"></script>
<script type="text/javascript" src="/@system/js/yyucadapter.js"></script>
<link rel="shortcut icon" href="/favicon.ico" />
<script>

$(function() {
	$("#gotonext").click(function(){
		window.parent.$('.menu-youhui').trigger('click');
	});
});


function dellbs(id,o){
	if(id=='a'){
		if(confirm('确定删除这些lbs信息吗？')){
			var ids = [];
			$('td').find('input[type="checkbox"]:checked').each(function(){
				ids[ids.length] = $(this).val();
			});
			ajax('lbs-del.html',{ id:ids.join(',')},function(){
				$('td').find('input[type="checkbox"]:checked').each(function(){
					$(this).parent().parent().remove();
				});
			});	
		}
	}else{
		if(confirm('确定删除此条lbs信息吗？')){
			ajax('lbs-del.html',{ id:id},function(){
				$(o).parent().parent().parent().remove();
			});	
		}
	}	
}

function goto(sUrl) {
	window.location.href = sUrl;
}

function selallck(o){
	if($(o).prop('checked')){
		$('td').find('input[type="checkbox"]').prop('checked',true);
	}else{
		$('td').find('input[type="checkbox"]').prop('checked',false);
	}
}
</script>
</head>
<body class="theme-blue">
	    <div id="main">
        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span12">

                    <div class="box">
                        <div class="box-title">
                            <div class="span8">
                                <h3><i class="icon-table"></i>상가위치설정</h3>
                            </div>
      
                        </div>
						  <div class="box-content">
                            <div class="row-fluid">
                                <div class="span12 control-group">
                                    <div class="span7">
									  <button  onclick="goto('lbsadd.php')" id="add" class="btn"><i class="icon-plus"></i>추가</button>
			                          <button class="btn " onclick="dellbs('a',this)" id="del"><i class="icon-trash"></i>삭제</button>
                                    </div>   
                                </div>  
                            </div>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th style="width:10px;"><input type="checkbox" onclick="selallck(this);"></th>
					<th>상가이름</th>
					<th>상가분류</th>
					<th>상가주소</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<?php $__i=0; foreach ((array)$res as $r) { $__i++; ?>			 
			      <tr>
						<td>
						<input type="checkbox"  value="<?php echo $r->id; ?>">
						</td>
						<td><?php echo $r->name; ?></td>
						<td botid="19979">
						<?php echo $lb_arr[$r->l_ind1]; ?>-<?php echo $lb_arr[$r->l_ind2]; ?>
						</td>
						<td>
						<?php echo $cn_arr[$r->l_sheng];  echo $cn_arr[$r->l_shi];  echo $cn_arr[$r->l_xianqu]; ?>	
						<?php echo $r->address; ?>
						</td>
						<td>
						<span>
						<a href="lbsadd-<?php echo $r->id; ?>.html" class="btn"><i class="icon-edit"></i></a>
						</span>
						<span>
						<a href="javascript:;" onclick="dellbs(<?php echo $r->id; ?>,this)" class="btn"><i class="icon-remove"></i></a>
						</span>
						</td>
				  </tr>
			<?php } ?>
			</tbody>
		</table>
	</div>
	
<div id="gotonext" >
	
</div>
<br/><br/><br/></body></html>
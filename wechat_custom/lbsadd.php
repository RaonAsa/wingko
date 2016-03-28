<!DOCTYPE html>
<?php 
class LBS
{
	function has_id()
	{
		echo false;
	}

	function hidden($str)
	{
		echo "";
	}
	
	function text($str) {
		
	}

	function mulselect() {
		
	}
	
	function upload() {
		
	}
	
	function textarea() {
		
	}
}

function tk() {
	
}

$lbs = new LBS();

?>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地理位置定位</title>
<script type="text/javascript">var yyuc_jspath = "/@system/";</script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/yyucadapter.js"></script>
<link rel="stylesheet" href="/css/wm/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo $CSS; ?>admin/admin.css">
<style type="text/css">
	table td {
		min-width:50px;
		overflow:hidden;text-overflow:ellipsis;
	}
	#picsethere{
		width: 510px;
		display: block;
	}
	#picsethere img{
		max-width: 500px;
		display: block;
	}
</style>

<script src="http://api.map.baidu.com/api?v=1.5&ak=1b0ace7dde0245f796844a06fb112734"></script>
<!-- 
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=zh-CN"></script>
 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4c0hkElbhOlKPODFrAj6ieKIGQP10IGc&v=3.exp&libraries=places&sensor=false"></script>
</head>
<body>
	<h3>상가LBS설정</h3>
	<div class="alert alert-info">
	  	<p><span class="bold">설명：</span>LBS 기능 설정 후 이용자는 웨이신을 통해 획득한 상가 주소
정보를 얻을 수 있음 </p>	  	
	  	<?php if ($lbs->has_id()){ ?>
	  	<p><span class="bold">地图地址(参数可自行替换)：</span><br/>
	  	<?php echo Conf::$http_path; ?>api/map.html?mtit=<?php echo urldecode($lbs->name); ?>&amp;mcon=<?php echo urldecode($lbs->address); ?>&amp;center=<?php echo $lbs->jd; ?>,<?php echo $lbs->wd; ?>&amp;zoom=15
	  	</p>	  	
	  	<?php } ?>
	</div>
	<form class="form-horizontal" id="lbsForm" action="" method="post" onsubmit="return false;">
	<?php echo tk();  echo $lbs->hidden('id');  echo $lbs->hidden('jd');  echo $lbs->hidden('wd'); ?>
		<input type="hidden" value="54880234e716c" name="YYUC_FORM_TOKEN">
		<input type="hidden" value="" name="CVISMgpR" id="lbsid">
		<div class="control-group">
	    	<label class="control-label" for="keyword">상가이름</label>
	    	<div class="controls">
	    	<?php echo $lbs->text('name','class="span4"'); ?>
		    	<span class="maroon">*</span>
		    	<span class="help-inline">最多只能输入30个字符。</span>
	    	</div>
	  	</div>
		<div class="control-group">
	    	<label class="control-label" for="location_p">상가소속지역명</label>
	    	<div class="controls">
	    	<?php echo $lbs->mulselect('chinaarea',array('l_sheng','l_shi','l_xianqu')); ?>
	    	</div>
	  	</div>
	  
	  	<div class="control-group">
	    	<label class="control-label" for="category_f">상가분류</label>
	    	<div class="controls">
	    	<?php echo $lbs->mulselect('industry',array('l_ind1','l_ind2')); ?>
	    	</div>
	  	</div>
	 
		<div class="control-group">
			<label class="control-label" for="address">주소:</label>
			<div class="controls">
				<input type="text" value="" name="CVISMglR" id="lbsaddress" class="span5">
				<button id="locate-btn" class="btn btn-primary">定位</button>
				<span class="maroon">*</span><br>
				<span class="help-inline">주소 입력 후 “자동설정”버튼 클릭하면 지도상 위치표시 </span><br>
				<span class="help-inline"></span>
				경도 : <input type="text" value="116.403694" name="CVISMglR" id="lbsjd">
				위도 : <input type="text" value="39.916042" name="CVISMhRR" id="lbswd">	
				</div>
			</div>
		<div class="control-group">
			<div id="map" style="width: 600px;height: 300px;margin-left: 100px;"></div>
		</div>

		<!--  Google Map start -->
		<div class="control-group">
			<div id="google_map" style="width: 600px;height: 300px;margin-left: 100px;"></div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="">주소:</label>
			<div class="controls">
				<input type="text" value="" id="gmap_addr" class="span5" placeholder="Search Box">
				<div>위도 : <input type="text" value="" name="CVISMglR" id="gmap_lat"></div>
				<div>경도 : <input type="text" value="" name="CVISMhRR" id="gmap_lng"></div>	
			</div>
		</div>
		<!--  Google Map start -->
		
		<div class="control-group">
			<label class="control-label" for="address">이미지:</label>
			<div class="controls">
			<?php echo $lbs->text('tel','class="span5"'); ?>
				<span class="maroon">*</span><br>
			</div>
		</div>
		<div class="control-group">
		    <label class="control-label" for="">상가 표시 :</label>
		    <div class="controls">
			    <div class="cover-area">
					<table style="height: 30px;overflow: hidden;">
					<tr>
					<td><?php echo $lbs->upload('pic',array('text'=>'上传图片','showdel'=>false,'type'=>'png,jpeg,jpg,gif,bmp','width'=>100),null,null,'picsethere'); ?></td>
					<td valign="top" style="line-height: 30px;color:gray;">建议尺寸：700像素 * 380像素</td>
					</tr>
					</table>
					<p class="img-area cover-bd" id="picsethere">
					</p>
				</div>
		    </div>
	  	</div>
	  	<div class="control-group">
			<label class="control-label" for="detail">门店简介:</label>
			<div class="controls">
			<?php echo $lbs->textarea('content','class="span5" style="height:90px;width:520px;"'); ?>
				<span class="maroon">*</span><br><span class="help-inline">最多为1000个字符。</span>
			</div>
		</div>
 		<div class="control-group">
		    <div class="controls">
		    
		      <button id="save-btn" type="submit" class="btn btn-primary btn-large">save - 保存并开启</button>
		     
		    </div>
	    </div>
	</form>

<script type="text/javascript">
//是否从未保存过定位信息，如果从未保存过，并且有填地址信息，那么进入页面后自动定位
var located = true;
//定位坐标
var destPoint = new BMap.Point($('#lbsjd').val(),$('#lbswd').val());
$(function(){
	
	/**开始处理百度地图**/
	var map = new BMap.Map("map");
	map.centerAndZoom(new BMap.Point(destPoint.lng, destPoint.lat), 12);//初始化地图
	map.enableScrollWheelZoom();
	map.addControl(new BMap.NavigationControl());
	var marker = new BMap.Marker(destPoint);
	map.addOverlay(marker);//添加标注
	
	map.addEventListener("click", function(e){
		if(confirm("바이두 지도 위치 지정 ")){
			destPoint = e.point;
			$('#lbsjd').val(destPoint.lng);
			$('#lbswd').val(destPoint.lat);
			map.clearOverlays();
			var marker1 = new BMap.Marker(destPoint);  // 创建标注
			map.addOverlay(marker1); 
		}
	});
	
	var myValue;

	var local;
	function setPlace(){
	    map.clearOverlays();    //清除地图上所有覆盖物
	    local = new BMap.LocalSearch(map, { //智能搜索
	      renderOptions:{ map: map}
	    });
	    located = true;
	    local.setMarkersSetCallback(callback);
	    local.search(myValue);
	}
	
	function addEventListener(marker){
		marker.addEventListener("click", function(data){
			destPoint = data.target.getPosition(0);
		});
	}
	function callback(posi){
		$("#locate-btn").removeAttr("disabled");
		for(var i=0;i<posi.length;i++){
			if(i==0){
				destPoint = posi[0].point;
			}
			posi[i].marker.addEventListener("click", function(data){
				destPoint = data.target.getPosition(0);
			});  
		}
	}
	
	$("#lbsl_xianqu").change(function(){
		$("#locate-btn").attr("disabled","disabled");
		local = new BMap.LocalSearch(map, { //智能搜索
			renderOptions:{ map: map}
		});
		located = true;
		local.setMarkersSetCallback(callback);
		local.search($("#lbsl_xianqu").find('option:selected').text());
		return false;
	});
	$("#lbsl_shi").change(function(){
		$("#locate-btn").attr("disabled","disabled");
		local = new BMap.LocalSearch(map, { //智能搜索
			renderOptions:{ map: map}
		});
		located = true;
		local.setMarkersSetCallback(callback);
		local.search($("#lbsl_shi").find('option:selected').text());
		return false;
	});
// 	$("#locate-btn").click(function(){
// 		if($("#lbsaddress").val() == ""){
// 			alert("주소 위치 검색(바이두)");
// 			return ;
// 		}
// 		$("#locate-btn").attr("disabled","disabled");
// 		local = new BMap.LocalSearch(map, { //智能搜索
// 			renderOptions:{ map: map}
// 		});
// 		located = true;
// 		local.setMarkersSetCallback(callback);
// 		local.search($("#lbsaddress").val());
// 		return false;
// 	});
	$("#locate-gmap-btn").click(function(){
		alert('here');
		if($("#gmap_addr").val() == ""){
			alert("구글 지도 위치 검색");
			return ;
		}
		$("#gmap_addr").attr("disabled","disabled");

		return false;
	});
	/**结束百度地图处理**/
	$("#close-btn").click(function(){
    	if(confirm("你确定要停用LBS功能？")){
    		var submitData = {
    			"action":"close",
    			"wuid":19979,
    			"lid":null
    		};
    		$.post("/admin/lbsinfo",submitData,function(data){
    			if(data.success){
    				window.location.reload();
    			} else{
    				alert("停用失败");
    			}
    		},"json");
    	}
    });

// 	$("#lbsForm").submit(function(){
// 		var cansv= true;
// 		$(this).find('input[type="text"],textarea').each(function(){
// 			if($.trim($(this).val())==''){
// 				cansv = false;
// 				$(this).css('backgroundColor','yellow');
// 				$(this).one('focus',function(){
// 					$(this).css('backgroundColor','transparent');
// 				});
// 			}
// 		});
// 		if(!cansv){
// 			tusi('请将信息填写完整');
// 		}else if($('#picsethere').find('img').size()<1){
//     		cansv = false;
//     		tusi('请上传商家图片');
//     	}
//     	return cansv;
//     });

	// Google Map 관련 내역 추가 
	var x = $('#lbsjd').val();
	var	y = $('#lbswd').val();
	var gmap_markers = [];
	var latLng = new google.maps.LatLng(y, x);
	var mapOptions = {
			zoom: 15,
			center: latLng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	var gmap = new google.maps.Map(document.getElementById('google_map'), mapOptions);

// 	  var defaultBounds = new google.maps.LatLngBounds(
// 		      new google.maps.LatLng(-33.8902, 151.1759),
// 		      new google.maps.LatLng(-33.8474, 151.2631));
//		  gmap.fitBounds(defaultBounds);
		  
	var gmap_marker = new google.maps.Marker({
	    position: latLng,
	    map: gmap
	});
	
	placeMarker(new google.maps.LatLng(y, x), gmap);

	var geocoder = new google.maps.Geocoder();

	google.maps.event.addListener(gmap, 'click', function(e) {
		if(confirm("맵에서 위치 지정 (구글 맵) ")) {
			var location = e.latLng;
			geocoder.geocode({
				'latLng' : location
			},
			function (results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					$("#gmap_addr").val(results[0].formatted_address);
					$("#gmap_lat").val(results[0].geometry.location.lat());
					$("#gmap_lng").val(results[0].geometry.location.lng());
				} else {
					alert("Geocoder failed due to : " + status);
				}
			});
			placeMarker(location, gmap);
		}
	});

	// Create the search box and link it to the UI element.
	var search_input = /** @type {HTMLInputElement} */(
	      document.getElementById('gmap_addr'));
	gmap.controls[google.maps.ControlPosition.TOP_LEFT].push(search_input);
		
	var searchBox = new google.maps.places.SearchBox(
			    /** @type {HTMLInputElement} */(search_input));

	  // Listen for the event fired when the user selects an item from the
	  // pick list. Retrieve the matching places for that item.
	google.maps.event.addListener(searchBox, 'places_changed', function() {
	    var places = searchBox.getPlaces();

	    
	    if (places.length == 0) {
	      return;
	    }
	    for (var i = 0, gmap_marker; gmap_marker = gmap_markers[i]; i++) {
	    	gmap_marker.setMap(null);
	    }

	   

	    // For each place, get the icon, place name, and location.
	    gmap_markers = [];
	    var bounds = new google.maps.LatLngBounds();
	    for (var i = 0, place; place = places[i]; i++) {
	      var image = {
	        url: place.icon,
	        size: new google.maps.Size(71, 71),
	        origin: new google.maps.Point(0, 0),
	        anchor: new google.maps.Point(17, 34),
	        scaledSize: new google.maps.Size(25, 25)
	      };

	      // Create a marker for each place.
	      var marker = new google.maps.Marker({
	        map: gmap,
	        icon: image,
	        title: place.name,
	        position: place.geometry.location
	      });

	      gmap_markers.push(marker);

	      bounds.extend(place.geometry.location);
	    }
//		  gmap.setCenter();
//		  gmap.setZoom(15);

	    gmap.fitBounds(bounds);
	});

	// Bias the SearchBox results towards places that are within the bounds of the
	  // current map's viewport.
	google.maps.event.addListener(gmap, 'bounds_changed', function() {
		var bounds = gmap.getBounds();
	  	searchBox.setBounds(bounds);
	});
		  			    	  	
// 	function makeMarker(options){
// 		var pushPin = new google.maps.Marker({map:map});
// 		pushPin.setOptions(options);

// 		google.maps.event.addListener(pushPin, "click", function(){
// 			infoWindow.setOptions(options);
// 			infoWindow.open(gmap, pushPin);
// 			//if(this.sidebarButton)this.sidebarButton.button.focus();
// 		});
// 		//markerBounds.extend(options.position);
// 		//markerArray.push(pushPin);
// 	}

	function placeMarker(position, map) {
		if (!gmap_marker) {
			gmap_marker = new google.maps.Marker({
			    position: position,
			    map: map
			});
		} else {
			gmap_marker.setMap(null);
			gmap_marker = new google.maps.Marker({
		    	position: position,
		    	map: map
			});
		}
		map.panTo(position);
	}
		 
});

</script>
<br/><br/><br/></body>

</html>
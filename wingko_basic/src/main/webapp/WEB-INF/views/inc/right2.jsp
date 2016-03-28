<%--
  - 작성자  yshsy
  - 작성일자 2013. 8. 1.
  - 내용
  - : 우측 메뉴
  --%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var urls = document.URL;
		if ( urls.indexOf('/sub/') > -1 ) {
			if (urls.indexOf('/sub/shopping.do') > -1) {
				getRightAd(57);
			} else if (urls.indexOf('/sub/lodging.do') > -1) {
				getRightAd(58);
			} else if (urls.indexOf('/sub/gourmet.do') > -1) {
				getRightAd(59);
			} else if (urls.indexOf('/sub/beauty.do') > -1) {
				getRightAd(60);
			} else if (urls.indexOf('/sub/medical.do') > -1) {
				getRightAd(61);
			} else if (urls.indexOf('/sub/culture.do') > -1) {
				getRightAd(62);
			} else {
				getRightAd(56);
			}
		} else {
			getRightAd(56);
		}
		getCategory(1);	
		getLocation(1);

		$("#select_category").change(function() {
			var category_no = $(this).val();
			getSubCategory(category_no);
			
		});
		$("#select_location").change(function() {
			var location_no = $(this).val();
			getSubLocation(location_no);
		});
	
		$("#btn_store_search").click(function() {
			$("#frm_store_search").submit();
		});
	});

	var getRightAd = function(parent_ad_no) {
		$.ajax({
			url: "/ad/ad_list.do?a="+parent_ad_no,
			dataType: "json",
			beforeSend: function(){
				//$('#loading').show().fadeIn('fast');
			},
			complete: function(data){
				// console.log('광고 로드');
				var obj = jQuery.parseJSON(data.responseText);
				// console.log(obj);
				if (obj.count == 0) {
					getRightAd(56);
				}
				$.each(obj.adList, function(key, val) {
					var adhtml = "",
						_ad_no = val.ad_no,
						_image = val.image,
						_link = val.link
						_position = val.position;
					/* // console.log("ad_no" + _ad_no);
					// console.log("image" + _image);
					// console.log("link" + _link); */

					adhtml = "<a href=\""+_link+"\"  target=\"_blank\"><img src=\"http://www.wingkostory.com/upload/ad/"+_image+"\" alt=\"광고\" class=\"sp67\" /></a>";
					$("#ad"+_position).attr("style", "margin-bottom: 5px;");
					$("#ad"+_position).html(adhtml);
				});
			}
		});
	};
	
	var t_select_category = "${select_category}";
	var t_select_location = "${select_location}";
	var t_category_no = "${store.category_no}";
	var t_location_no = "${store.location_no}";
	
	var getCategory = function(depth) {
		$.ajax({
			url: "/json_category.do?depth="+depth,
			dataType: "json",
			beforeSend: function(){

			},
			complete: function(data){
				var obj = jQuery.parseJSON(data.responseText);
				$("#select_category").find('option').each(function(){
					$(this).remove();
				});
				$("#select_category").append("<option value=''>--类别--</option>");
				$.each(obj, function(key, val) {
					if (t_select_category == val.value) {
						$("#select_category").append("<option value='"+val.value+"' selected>"+val.title+"</option>");
						getSubCategory(t_select_category);
					} else {
						$("#select_category").append("<option value='"+val.value+"'>"+val.title+"</option>");	
					}
				});
			}
		});
	};
	var getSubCategory = function(category_no) {
		$.ajax({
			url: "/json_category.do?depth=2&category_no="+category_no,
			dataType: "json",
			beforeSend: function(){
				//$('#loading').show().fadeIn('fast');
			},
			complete: function(data){
				var obj = jQuery.parseJSON(data.responseText);
				$("#select_category_sub").find('option').each(function(){
					$(this).remove();
				});
				$.each(obj, function(key, val) {
					if (t_category_no == val.value) {
						$("#select_category_sub").append("<option value='"+val.value+"' selected>"+val.title+"</option>");	
					} else {
						$("#select_category_sub").append("<option value='"+val.value+"'>"+val.title+"</option>");
					}
				});
			}
		});
	};
	var getLocation = function(depth) {
		$.ajax({
			url: "/json_location.do?depth="+depth,
			dataType: "json",
			beforeSend: function(){
				//$('#loading').show().fadeIn('fast');
			},
			complete: function(data){
				var obj = jQuery.parseJSON(data.responseText);
				$("#select_location").find('option').each(function(){
					$(this).remove();
				});
				$("#select_location").append("<option value=''>--类别--</option>");
				$.each(obj, function(key, val) {
					if (t_select_location == val.value) {
						$("#select_location").append("<option value='"+val.value+"' selected>"+val.title+"</option>");
						getSubLocation(t_select_location);
					} else {
						$("#select_location").append("<option value='"+val.value+"'>"+val.title+"</option>");	
					}
				});
			}
		});
	};
	var getSubLocation = function(location_no) {
		$.ajax({
			url: "/json_location.do?depth=2&location_no="+location_no,
			dataType: "json",
			beforeSend: function(){
				//$('#loading').show().fadeIn('fast');
			},
			complete: function(data){
				var obj = jQuery.parseJSON(data.responseText);
				$("#select_location_sub").find('option').each(function(){
					$(this).remove();
				});
				$.each(obj, function(key, val) {
					if (t_location_no == val.value) {
						$("#select_location_sub").append("<option value='"+val.value+"' selected>"+val.title+"</option>");
					} else {
						$("#select_location_sub").append("<option value='"+val.value+"'>"+val.title+"</option>");	
					}
				});
			}
		});
	}

	
</script>
    <div id="Right">
    	<div id="ad1"><!-- <a href="#"><img src="/resources/img/banner/right_b01.png" alt="배너1" class="sp67" /> --></a></div>
    	<div id="ad2"><!-- <a href="#"><img src="/resources/img/banner/right_b02.png" alt="배너2" class="sp67" /> --></a></div>
        <a href="/deal/main.do"><img src="/resources/img/banner/deal.png" alt="이달의 딜" class="sp67_d" style="margin-bottom: 5px;" /></a>
    	<div id="ad3"><!-- <a href="#"><img src="/resources/img/banner/right_b03.png" alt="배너3" class="sp67" /> --></a></div>
    	<div id="ad4"><!-- <a href="#"><img src="/resources/img/banner/right_b04.png" alt="배너4" class="sp67" /> --></a></div>
    	<div id="ad5"><!-- <a href="#"><img src="/resources/img/banner/right_b05.png" alt="배너5" class="sp67" /> --></a></div>
        <img src="/resources/img/title/store_search.png" alt="가게점포검색"  />
        <div class="search_store">
        	<form id="frm_store_search" action="/search/store_result.do">
        	选择<br/>
            <select class="select_store" name="select_category" id="select_category">
            	<option value="">--类别--</option>
            </select>
            <select class="select_store"  name="category_no" id="select_category_sub">
            	<option value="">--类别--</option>
            </select><br/>
        	位置<br/>
            <select class="select_store" name="select_location" id="select_location">
            	<option value="">--类别--</option>
            </select>
            <select class="select_store"  name="location_no" id="select_location_sub">
            	<option value="">--类别--</option>
            </select><br/>
            <div class="bt_right"><img id="btn_store_search" src="/resources/img/button/store_search.png" alt="검색 检索" class="hand" /></div>
            </form>
        </div>
        <div id="ad6"><!-- <a href="#"><img src="/resources/img/banner/right_02.png" alt="배너" /></a> --></div>
    </div>
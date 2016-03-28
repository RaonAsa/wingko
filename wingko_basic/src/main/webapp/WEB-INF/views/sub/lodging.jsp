<%--
  - 작성자   ysh
  - 작성일자 2013. 8. 28.
  - 내용
  -
  -
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
<meta name="author" content="wingkostory">
<meta name="keywords" content="韩国旅游攻略 韩国自助游 首尔自助游攻略 韩国购物 首尔购物攻略 首尔美容 韩国整容旅游 首尔美食 首尔住宿 首尔" />
<meta name="description" content="wingkostory，韩国自助游攻略、最新购物、美食、住宿、美容、韩国娱乐信息、韩国整容旅游资讯。" />
<title>韩国自助游攻略网_WINGKOSTORY</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sub.css" />
<link rel="shortcut icon" href="/resources/img/favicon.ico" >
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/message.js"></script>
<script language="javascript">

$(document).ready( function() {
	if(document.location.hash) {
		var t = "", p = "";
		var HashLocationName = document.location.hash;
		HashLocationName = HashLocationName.replace("#","");
		var arr = HashLocationName.split("^");
		for ( var i= 0; i< arr.length; i++) {
			var temp = arr[i].split("=");
			if (temp.length == 2) {
				if (temp[0] == "t") { t = temp[1]; }
				if (temp[0] == "p") { p = temp[1]; }
			}
			if (t != "" && p != "") {
				if (t <= 3) {
					store.changeTab(t, p);
					store.changeTab(4, 1);	
				} else {
					store.changeTab(0, 1);
					store.changeTab(t, p);
				}
			}
		}
	} else {
		store.changeTab(0, 1);
		store.changeTab(4, 1);	
	}
});

var store = {
	sub : "lodging",
	location_no : "${store.location_no}",
	tab : {
		on: ["/resources/img/menu/lodging_tab01_on.png", "/resources/img/menu/lodging_tab02_on.png", "/resources/img/menu/lodging_tab03_on.png", "/resources/img/menu/lodging_tab04_on.png",
		     "/resources/img/menu/lodging_tab05_on.png", "/resources/img/menu/lodging_tab06_on.png", "/resources/img/menu/lodging_tab07_on.png"],
		off: ["/resources/img/menu/lodging_tab01.png", "/resources/img/menu/lodging_tab02.png", "/resources/img/menu/lodging_tab03.png", "/resources/img/menu/lodging_tab04.png",
		     "/resources/img/menu/lodging_tab05.png", "/resources/img/menu/lodging_tab06.png", "/resources/img/menu/lodging_tab07.png"],
		category: [20, 21, 22, 23, 39, 40, 41],	// category_no
		id: ["li_20", "li_21", "li_22", "li_23", "li_39", "li_40", "li_41"]	// tab li id
	},
	changeTab : function(sel, page) {
		var no = sel + 1;
		if (sel <= 3) {
			for ( var i = 0; i <= 3; i++) {
				if (sel == i) {
					$("#"+this.tab.id[i]).removeClass("no");
					$("#"+this.tab.id[i]).addClass("sel");
					$("#"+this.tab.id[i] + " > img").attr("src", this.tab.on[i]);
				} else {
					$("#"+this.tab.id[i]).removeClass("sel");
					$("#"+this.tab.id[i]).removeClass("no");
					$("#"+this.tab.id[i] + " > img").attr("src", this.tab.off[i]);
				}
				if ( no == i) {
					$("#"+this.tab.id[i]).addClass("no");
				}
			}
		} else {
			for ( var i = 4; i <= 6; i++) {
				if (sel == i) {
					$("#"+this.tab.id[i]).removeClass("no");
					$("#"+this.tab.id[i]).addClass("sel");
					$("#"+this.tab.id[i] + " > img").attr("src", this.tab.on[i]);
				} else {
					$("#"+this.tab.id[i]).removeClass("sel");
					$("#"+this.tab.id[i]).removeClass("no");
					$("#"+this.tab.id[i] + " > img").attr("src", this.tab.off[i]);
				}
				if ( no == i) {
					$("#"+this.tab.id[i]).addClass("no");
				}
			}
		}
		this.getSubList(sel, page);
	},
	getSubList : function(sel, page) {
		$.ajax({
			url: "/sub/get_sub.do",
			data: "location_no="+this.location_no+"&category_no="+this.tab.category[sel]+"&page="+page,
			dataType: "json",
			beforeSend: function(){
				//$('#loading').show().fadeIn('fast');
			},
			complete: function(data){
				var obj = jQuery.parseJSON(data.responseText),
					list = obj.list,
					i = 0,
					listHtml = "",
					pageHtml = "",
					pageInfo = {
						page : obj.page,
						pageSize : obj.pageSize,
						currentBlock : obj.currentBlock,
						totalBlock : obj.totalBlock,
						totalPage : obj.totalPage,
						startPageNum : obj.startPageNum,
						endPageNum : obj.endPageNum
					};

				// 리스트 html
				if (list.length == 0) {
					listHtml += "<tr><td colspan='4' class='space'></td></tr>";
					listHtml += "<tr><td colspan='4' class='space' align='center'>无菜单选项</td></tr>";
					listHtml += "<tr><td colspan='4' class='space'></td></tr>";
				} else {
					for ( var j = 0; j < list.length; j++) {
						var store = list[j],
							a = store.location_no,
							b = store.category_no,
							c = store.store_no,
							d = pageInfo.page;
						
						if (j % 2 == 0) {
							if ( j > 0) { listHtml += "<tr><td colspan='4' class='space'></td></tr>"; }
							listHtml += '<tr>';
							i = 0;
						}

						listHtml += "<th onclick=\"javascript:view('"+sel+"', '"+a+"', '"+b+"', '"+c+"', '"+d+"')\" class='hand'><img src='http://www.wingkostory.com/upload/store/"+store.image_thumb+"' alt=''></th>";
						listHtml += "<td>";
						listHtml += "<div onclick=\"javascript:view('"+sel+"', '"+a+"', '"+b+"', '"+c+"', '"+d+"')\" class='hand'>";
						listHtml += "<span>"+store.title+"</span><br />"+store.description;
						listHtml += "</div>";
						listHtml += "</td>";

						if (j % 2 == 1) { listHtml += '</tr>'; }
						i++;
					}
					for ( var j = 1; j <= 2; j++) {
						if (i < j) { listHtml += "<th></th><td></td>"; i++; }
						if ( i == 2) { listHtml += "</tr><tr><td colspan='4' class='space'></td></tr>"; }
					}
					
				}
				// 페이징 html
				pageHtml += "<li onclick='javascript:prevPage(" + sel + ", "+pageInfo.currentBlock+", "+pageInfo.startPageNum+");'><img src='/resources/img/menu/page_prev.png' alt='prev' /></li>";
				for ( var i = pageInfo.startPageNum; i < pageInfo.endPageNum; i++) {
					if (pageInfo.totalPage == 0) {
						pageHtml += "<li class='on'>"+i+"</li>";
					}
					if (i > pageInfo.totalPage || i == pageInfo.endPageNum) {
						break;
					} else {
						if (i == page) {
							pageHtml += "<li onclick='javascript:goPage(" + sel + ", "+i+");' class='on'>"+i+"</li>";
						} else {
							pageHtml += "<li onclick='javascript:goPage(" + sel + ", "+i+");'>"+i+"</li>";
						}
					}
				}
				pageHtml += "<li class='end' onclick='javascript:nextPage(" + sel + ", "+pageInfo.currentBlock+", "+pageInfo.totalBlock+", "+pageInfo.endPageNum+");'><img src='/resources/img/menu/page_next.png' alt='next' /></li>";

				if (sel <= 3) {
					$("#list_1").html(listHtml);
					$("#page_number_1").html(pageHtml);
					// console.log(sel + ": add list1");
				} else {
					$("#list_2").html(listHtml);
					$("#page_number_2").html(pageHtml);
					// console.log(sel + ": add list2");
				}
			}
		});
	}//
};

// 이전 페이지
function prevPage(sel, currentBlock, startPageNum){
	if( currentBlock != 1 ){
		store.changeTab(sel, startPageNum-1);
	}else{
		alert(m.bbs.prev);
	}
}
// 다음  페이지
function nextPage(sel, currentBlock, totalBlock, endPageNum){

	if( currentBlock != totalBlock && totalBlock != 0 ){ 
		store.changeTab(sel, endPageNum);
	}else{
		alert(m.bbs.next);
	}
}

// 페이지 이동
function goPage(sel, goPage){
	store.changeTab(sel, goPage);
}

function view(sel, location_no, parent_category_no, store_no, page) {
	//alert(travel_no);
	document.location.hash = '#t='+sel+'^p='+page;
	location.href = '/store/main.do?m='+store.sub+'&location_no='+location_no+'&parent_category_no='+parent_category_no+'&store_no='+store_no;
}
</script>
</head>

<body>
<div id="Wrapper">

	<!-- TOP Include -->
	<c:import url="../inc/top.jsp" charEncoding="UTF-8" />

	<div id="Content">
    	<ul class="location">
        	<li class="first"><img src="/resources/img/home.png" alt="home" /></li>
        	<li>住宿</li>
        	<li class="end">
        		<c:if test="${store.location_no == '12'}">首尔</c:if>
        		<c:if test="${store.location_no == '13'}">济州</c:if>
        		<c:if test="${store.location_no == '14'}">京畿</c:if>
        		<c:if test="${store.location_no == '15'}">釜山</c:if>
        		<c:if test="${store.location_no == '16'}">江原</c:if>
        		<c:if test="${store.location_no == '17'}">其他地区</c:if>
        	</li>
        </ul>
        <ul class="sub_tab"> <!--서브 메인 탭-->
        	<a href="lodging.do?location_no=12"><li <c:if test="${store.location_no == '12'}">class="on small"</c:if>>首尔</li></a><!--서울--><!--첫번째 탭에 반드시 클래스 small-->
            <a href="lodging.do?location_no=13"><li <c:if test="${store.location_no == '13'}">class="on small"</c:if>>济州</li></a><!--제주-->
            <a href="lodging.do?location_no=14"><li <c:if test="${store.location_no == '14'}">class="on small"</c:if>>京畿</li></a><!--경기-->
            <a href="lodging.do?location_no=15"><li <c:if test="${store.location_no == '15'}">class="on small"</c:if>>釜山</li></a><!--부산-->
            <a href="lodging.do?location_no=16"><li <c:if test="${store.location_no == '16'}">class="on small"</c:if>>江原</li></a><!--강원-->
            <a href="lodging.do?location_no=17"><li <c:if test="${store.location_no == '17'}">class="on small"</c:if>>其他地区</li></a><!--기타지역-->
        </ul>
        <div class="area_detail"><!--지도, 쇼핑지역 안내-->
        	<div class="map">
            	<div class="place_map"><!-- 상세지도 -->${categoryLocation.map_info}</div><!--지도-->
                <div class="place_txt"><!--설명-->
                	${categoryLocation.info}
                		<!-- 서울지역 대표적인 쇼핑지역 안내 <br/>
                        에디터기능 사용 -->
                </div>
            </div>
        </div>
        
        <ul class="tab_detail_c4" style="margin-top:45px;"><!--호텔, 레지던스, 모텔, 유스호스텔 탭-->
        	<a href="javascript:store.changeTab(0, 1);"><li id="li_20"><img src="/resources/img/menu/lodging_tab01.png" alt="酒店" /></li></a>
        	<a href="javascript:store.changeTab(1, 1);"><li id="li_21"><img src="/resources/img/menu/lodging_tab02.png" alt="公寓式客房" /></li></a>
        	<a href="javascript:store.changeTab(2, 1);"><li id="li_22"><img src="/resources/img/menu/lodging_tab03.png" alt="旅馆" /></li></a>
        	<a href="javascript:store.changeTab(3, 1);"><li id="li_23" class="end"><img src="/resources/img/menu/lodging_tab04.png" alt="青年旅舍" /></li></a>
        </ul>
        <table class="detail_c2">
        	<caption>호텔</caption>
            <colgroup>
            	<col width="22%" />
                <col width="28%" />
                <col width="22%" />
                <col width="28%" />
            </colgroup>
            
			<tbody id="list_1"></tbody>
        </table>

        <!--페이지번호-->
        <ul class="page_number" id="page_number_1"></ul>
        
        <c:if test="${ad != null}">
	        <br/><br/>
	        <a href="${ad.link}" target="_blank"><img src="http://www.wingkostory.com/upload/ad/${ad.image}" /></a>
        </c:if>

        <br/><br/><br/><br/><!--IE6,7특성때문에 이 부분 꼭 삽입-->
        <ul class="tab_detail_c3"><!--게스트하우스, 홈스테이, 캠핑 탭-->
        	<a href="javascript:store.changeTab(4, 1);"><li id="li_39"><img src="/resources/img/menu/lodging_tab05.png" alt="宾馆" /></li></a>
        	<a href="javascript:store.changeTab(5, 1);"><li id="li_40"><img src="/resources/img/menu/lodging_tab06.png" alt="家庭寄宿" /></li></a>
        	<a href="javascript:store.changeTab(6, 1);"><li id="li_41" class="end"><img src="/resources/img/menu/lodging_tab07.png" alt="野营" /></li></a>
        </ul>
        <table class="detail_c2">
        	<caption>게스트하우스</caption>
            <colgroup>
            	<col width="22%" />
                <col width="28%" />
                <col width="22%" />
                <col width="28%" />
            </colgroup>

            <tbody id="list_2"></tbody>
        </table>
        <!--페이지번호-->
        <ul class="page_number" id="page_number_2"></ul>
    </div>
    

    <!-- RIGHT Include -->
	<c:import url="../inc/right.jsp" charEncoding="UTF-8" />
    
</div>

<!-- BOTTOM Include -->
<c:import url="../inc/bottom.jsp" charEncoding="UTF-8" />
</body>
</html>

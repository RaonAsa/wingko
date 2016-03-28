/*!
 * meeroojin
 * Date: 2013-08-22
 * 
 * function for wingko.
 * 
 	var wing = new WingCalender(tag_id);
	wing.showWing(); // today
	wing.showWing(2013, 8); // select date
	
*/


var WingCalender = function (tag_obj){
	this.onClickDay;
	this.onClickMonth;
	this.onClickKeyData;
	this.onShow;

	this.root = $(tag_obj);

	this.year;
	this.month;
	this.day;

	this.weekday_start; // 1day week
	this.month_endday; // 28 ro 30 or 31
};

WingCalender.prototype.getDayTD = function(n_day){
	n_day = Number(n_day);
	return $('.wingshow2 td[day='+n_day+']');
};

WingCalender.prototype.setBoxTD = function(n_day){
	this.getDayTD(n_day).addClass('data');
};

// <img src="http://yshsy.com/design/img/button/bt_data_close.png" alt="close" align="right" />
WingCalender.prototype.addData = function(n_day, key, data){
	var _this = this;
	
	var obj_day = this.getDayTD(n_day);
	obj_day.addClass('data'); // add css linebox
	
	var obj_data = $('<div item_id="' +key+ '">' +data+ '</div>');
	var data_list = $("div[item_id]", obj_day);
	var data_cnt = data_list.length;	
	
	if( data_cnt == 3){
		var obj_img = $('<img src="/resources/img/button/bt_data_close.png" alt="close" align="right" />');
		obj_day.append(obj_img);
		
		obj_img.click(function(){
			if(obj_img.attr("src") == "/resources/img/button/bt_data_close.png"){
				obj_img.attr("src", "/resources/img/button/bt_data_more.png");
				$("div[item_id]", obj_day).css("display", "block");
				obj_day.append( $(this));
			}else{
				obj_img.attr("src", "/resources/img/button/bt_data_close.png");
				$("div[item_id]", obj_day).each(function(index){
					if(index >= 3){
						$(this).css("display", "none");
					}
				});
			}
		});
	}
	
	if( data_cnt >= 3){
		obj_data.css("display", "none");
	}
	
	obj_day.append(obj_data);
	
	obj_data.click(function(){
		if(_this.onClickKeyData){
			_this.onClickKeyData(key);
		}
	});
		
};

WingCalender.prototype.removeData = function(key){
	var root_obj = $(".wingshow2");
	// remove data
	var div_data = $('td div[item_id=' +key+ ']', root_obj);
	var table_td = div_data.closest("td");
	div_data.remove(); 
	
	if($("div[item_id]", table_td).length <= 3){
		$("img", table_td).remove();
	}
	
	
	$('td.data', root_obj).each(function(){ // remove css linebox
		var this_css = $(this);
		if($('div[item_id]', this_css).size() == 0){
			this_css.removeClass('data');
		}
	});
};

WingCalender.prototype.showWing = function(n_year, n_month){

	this.day = 0;
	if(n_year && n_month){
		this.year = Number(n_year);
		this.month = Number(n_month);
	}else{
		var date= new Date();
		this.year = date.getFullYear();
		this.month = date.getMonth() + 1;
	}

	// now date
	var cur_date = new Date();
	if( cur_date.getFullYear() == this.year && cur_date.getMonth() == this.month -1){
		this.day = cur_date.getDate();
	}

	var dateStart = new Date(this.year, this.month -1, 1);
	var dateLast = new Date(this.year, this.month, 0);
	
	this.weekday_start = dateStart.getDay(); // 0 : sunday
	this.month_endday = dateLast.getDate(); // 28 or 30 or 31

	// make Calendar
	//alert(this.year + '-' + this.month + '-' + this.day + ', ' + this.weekday_start + ', ' + this.month_endday);
	this.makeCalendar();

};


WingCalender.prototype.makeCalendar = function(){
	var _this = this;

	_this.root.empty();
	_this.root.html( this.getHtmlTitle() + this.getHtmlBody() );

	var show_date = _this.year + '-' + _this.month + '-01';
	var param = {wing_date : show_date};

	$.post("./json_event.do", param, function(json, status){

		if(status == "success"){
			if(json.list){
				$.each(json.list, function(key, item){
					var arr_date = item.wing_date.split("-");
					var td_day = _this.getDayTD(arr_date[2]); // td day
					td_day.append('<div calender_id="' +item.calender_id+ '" style="color:#0A637D;">' +item.wing_name+ '</div>');
				});
			}else{
				alert('error data format');
			}
		}
	}, "json");
	
	if(_this.onShow){
		_this.onShow(_this.year, _this.month);
	}

	// click month
	$('.wingshow1 .w_month_list a').click( function(){
		var n_month = $('img', this).attr('alt');
		if(n_month != _this.month){
			_this.showWing(_this.year, n_month);
		}
		return false;
	});

	// click day
	$('.wingshow2 table td[day]').click( function(){
		var n_day = $(this).attr('day');
		if(_this.onClickDay){
			_this.onClickDay(this, _this.year, _this.month, n_day);
		}
		return false;
	});
};



WingCalender.prototype.getHtmlTitle = function(){

	var arrMonthStr = ['JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER', 'NOVEMBER', 'DECEMBER'];

	var year_num = this.year;
	var month_text = arrMonthStr[this.month];
	var month_num = this.month;
	var month_str = month_num < 10 ? '0' + month_num : month_num;


var html_body = '<div class="wingshow1">' + 
'	<div class="w_month"><div class="wing_month">' +month_str+ '</div></div>' + 
'	<div class="w_year">' + year_num + '<br/>' +month_text+ '</div>' + 
'	<div class="w_month_list">' + 
'		<ul>' + // li content
'		</ul>' +
'	</div>' +
'</div>' ;

	var header = $("<div></div>").append(html_body);
	var list_body = $(".w_month_list ul", header);
	for(var i=1; i<=12; i++){
		var str_mm = i < 10 ? '0' +i : i;
		var img_name;
		if( i == month_num){
			img_name = 'month' +str_mm+ '_on.png';
		}else{
			img_name = 'month' +str_mm+ '.png';
		}
		
		if( i == 12){
			list_body.append('<li class="end"><a href="#" year="' +year_num+ '" month="'+i+'"><img src="/resources/img/icon/' +img_name+ '" alt="' + i + '" /></a></li>');
		}else{
			list_body.append('<li><a href="#" year="' +year_num+ '" month="'+i+'"><img src="/resources/img/icon/' +img_name+ '" alt="' + i + '" /></a></li>');
		}
	}

	return header.html();
};

WingCalender.prototype.getHtmlBody = function(){
	//var n_year = this.year;
	//var n_month = this.month;
	var n_day = this.day;
	var n_weekday_start = this.weekday_start;
	var n_month_endday = this.month_endday;

var html_body = '<div class="wingshow2">' +
'	<table>' +
'		<caption>윙쇼달력</caption>' +
'		<colgroup>' +
'			<col width="106px" />' +
'			<col width="107px" />' +
'			<col width="107px" />' +
'			<col width="107px" />' +
'			<col width="107px" />' +
'			<col width="107px" />' +
'			<col width="106px" />' +
'		</colgroup>' + // tr content
'	</table>' +
'</div>' +
'<img src="/resources/img/bg_calendar_03.png" alt="달력아랫부분" style="margin-bottom:30px;" />';


	var header = $("<div></div>").append(html_body);
	var table_body = $(".wingshow2 table", header);

	var day_count = 0;
	var isEndLind = false;

	do{
		var table_tr = $('<tr></tr>');
		table_body.append(table_tr);

		// last tr
		if(day_count + 6 >= n_month_endday) isEndLind = true;

		for(var i=0; i<7; ++i){

			var table_td = $('<td></td>');
			table_tr.append(table_td);

			if(isEndLind == true) table_td.addClass('end');

			if(i==0){ // sun
				table_td.addClass('sun');
			}else if(i==6){ // sat
				table_td.addClass('sat');
			}

			// 1 day check
			if(day_count < 1 && n_weekday_start == i) {
				day_count = 1;
			}

			if(day_count > 0 && day_count <= n_month_endday){

				table_td.html('<div>'+day_count+'</div>');
				table_td.attr('day', day_count);

				if(day_count == n_day){
					table_td.addClass('choice');
					//table_td.addClass('data');
				}

				day_count++; // day count
			}
		}

	}while( isEndLind == false)

	return header.html();
};


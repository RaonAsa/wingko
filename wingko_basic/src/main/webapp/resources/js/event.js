function openPopup(){
	var event_popup = true,
	urls = "/event/event.html",
	width = '360',
	height = '517';
	//http://www.wingtkostory.com 520

	if (event_popup) {
		
		var sw  = screen.availWidth ;
		var sh  = screen.availHeight ;

		px=(sw - width)/2 ;
		py=(sh - height)/2 ;

		var set  = 'top=' + py + ',left=' + px + ',width=' + width + ',height=' + height + ',toolbar=0,resizable=0,status=0,scrollbars=auto';
		window.open (urls, 'wingtkostory' , set);

		/*var win = window.open();
		if (win == null || typeof(win) == "undefined" || (win == null && win.outerWidth == 0) || (win != null && win.outerHeight == 0) || win.test == "undefined") {
			alert('팝업을 허용해 주세요.');
			if(win) {
			    win.close();
			}
			return;
		} else if (win) {
			if (win.innerWidth === 0) {
				alert('팝업을 허용해 주세요.');
			}
		} else {
			var sw  = screen.availWidth ;
			var sh  = screen.availHeight ;
	
			px=(sw - width)/2 ;
			py=(sh - height)/2 ;
	
			var set  = 'top=' + py + ',left=' + px + ',width=' + width + ',height=' + height + ',toolbar=0,resizable=0,status=0,scrollbars=auto';
			window.open (urls, 'wingtkostory' , set);
			
			return;
		}*/
	}

	/*if(win) {    // 팝업창이 떠있다면 close();
		win.close();
	}*/
}

function getCookie(name) {
	var nameOfCookie = name + "=";
	var x = 0;
	while (x != document.cookie.length) {
		alert('a');
		var y = (x+nameOfCookie.length);
		if (document.cookie.substring(x, y) == nameOfCookie) {
			if ( (endOfCookie = document.cookie.indexOf(";", y) == -1) ) {
				endOfCookie = document.cookie.length;
				
				return unescape(document.cookie.substring(y, endOfCookie));
			}
			x = document.cookie.indexOf(" ", x) + 1;
			if (x == 0) {
				break;
			}
		}
	}
	return "";
}


window.onload = function(){      // 페이지 로딩 후 즉시 함수 실행(window.onload)
	//if (getCookie("event") != "1") {
		closePopup();
	//}
}

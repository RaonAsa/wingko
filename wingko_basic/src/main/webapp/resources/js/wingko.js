/*!
 * ysh
 * Date: 2013-08-17
 * 
 * function for wingko.
 */


// 댓글 남기기
var insertRipple = function (user_no, parent_code, data_no, content, callback) {
	if (user_no == '') {
		alert('로그인이 필요합니다.');
		location.href="/login/login.do"
	} else {
		if (confirm("리뷰를 등록하시겠습니까?")) {
			var url = "/json/ripple/ripple_insert?user_no="+user_no+"&parent_code="+parent_code+"&data_no="+data_no+"&content="+content;
			$.getJSON(url, function (data) {
				if ("success" == data.result) {
					callback(data.result, true);
				} else {
					callback(data.result);
				}
			}).fail(function () {
				callback(false);
			});
		} else {
			return false;
		}		
	}

};



// 추천하기
var insertRecommend = function (user_no, parent_code, parent_no) {
	if (user_no == '') {
		if ( confirm(m.confirm.login) ) {
			location.href = '/login.do';
		} else {
			return;
		}
	} else {
		var url = "/json_recommendinsert.do?user_no="+user_no+"&parent_code="+parent_code+"&parent_no="+parent_no;
		$.getJSON(url, function (data) {
			//console.log(data);
			if (data == "1") {
				alert("추천하였습니다");
			} else if (data == "-1") {
				alert("이미 추천하였습니다");
			}
		});
	}
};




// 스크랩
var insertScrap = function (user_no, parent_code, parent_no) {
	if (user_no == '') {
		if ( confirm(m.confirm.login) ) {
			location.href = '/login.do';
		} else {
			return;
		}
	} else {
		var url = "/json_scrapinsert.do?user_no="+user_no+"&parent_code="+parent_code+"&parent_no="+parent_no;
		$.getJSON(url, function (data) {
			//console.log(data);
			if (data == "1") {
				alert("스크랩하였습니다");
			} else if (data == "-1") {
				alert("이미 스크랩하였습니다");
			}
		});
	}
};


//ajax 결과 처리  callback 함수
var ajaxResult = function (result, refresh) {
	if ("success" == result) {
		if (refresh) {
			location.reload();
		}
	} else if ("fail" == result) {
		//alert("실패");
		alert("오류가 발생하였습니다. 개발팀에 문의하세요.");
	} else {
		alert("오류가 발생하였습니다. 개발팀에 문의하세요.");
	}
};


var filedown = function(filename) {
	filename = encodeURIComponent(filename);
	location.href = "/filedown.do?filename="+filename;
}
var filedownPath = function(filepath, filename) {
	filename = encodeURIComponent(filename);
	location.href = "/filedown.do?filepath="+filepath+"&filename="+filename;
}

// 댓글의 글자 140자를 체크함.
function checkContentSize(oContent, oByte) {
	var maxByte = 140,
	contentByte = 0,
	currentByte = 0,
	content = oContent.val(),
	tempContent = '',
	tempByte = 0;

	for ( var i = 0; i < content.length; i++) {
		currentByte = content.charCodeAt(i);
		if (currentByte > 127) {
			contentByte += 2;
		} else {
			contentByte++;
		}
		if (contentByte <= 140) {
			tempContent = content.substring(0, i);
			tempByte = contentByte;
		}
	}
	if (contentByte > maxByte) {
		alert("메세지는 " + maxByte + " Byte 까지 입력 가능합니다.");
		oContent.val(tempContent);
		oByte.text(tempByte);
		return;
	} else {
		oByte.text(contentByte);
	}
}

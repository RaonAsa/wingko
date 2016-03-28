<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>jQuery File Upload Example</title>
</head>
<body>
<span>Add files...</span>
<input id="fileupload" type="file" name="files[]" data-url="/admin/product/test.do" multiple>
<script src="/resources/js/jquery-1.9.1.js"></script>
<script src="/resources/js/vendor/jquery.ui.widget.js"></script>
<script src="/resources/js/jquery.iframe-transport.js"></script>
<script src="/resources/js/jquery.fileupload.js"></script>
<script>
$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        done: function (e, data) {
        	var result = $.parseJSON(data.jqXHR.responseText);
        	// console.dir(result.file);

        	$.each(result, function(key, val){
        		$('<img/>').attr("src", val).appendTo(document.body);
        	});
        }
    }).on('fileuploadprogressall', function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .bar').css(
            'width',
            progress + '%'
        );
    });
});
</script>

<div id="progress" style="width: 100%;">
	<div class="bar" style="width: 0%; background:url(/resources/admin/img/progressbar.gif) no-repeat;"></div>
</div>

</body> 
</html>
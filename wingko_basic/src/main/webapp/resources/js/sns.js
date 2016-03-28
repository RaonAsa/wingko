var goSns = function() {
	(this.location);
};
var that = this;

var SNS = {
		qq : function (){
			var link = encodeURIComponent(that.location),
				title = encodeURIComponent(document.title);

			var url = 'http://s.jiathis.com/?webid=kaixin001&url=' + link + '&title=' + title;
			window.open(url, '');
		},
		weibo : function (){
			var link = encodeURIComponent(that.location),
			title = encodeURIComponent(document.title);

			var url = 'http://s.jiathis.com/?webid=tsina&url=' + link + '&title=' + title;
			window.open(url, '');
		},
		renren : function (){
			var link = encodeURIComponent(that.location),
			title = encodeURIComponent(document.title);

			var url = 'http://s.jiathis.com/?webid=renren&url=' + link + '&title=' + title;
			window.open(url, '');
		}
};
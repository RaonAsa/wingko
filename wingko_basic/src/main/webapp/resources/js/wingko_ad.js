/*!
 * ysh
 * Date: 2013-08-29
 * 
 * function for wingko.
 */

var adProto = {
		no: "",
		ad_no: "",
		title: "",
		content: "",
		link: "",
		image: "",
		toString: function() {
			return "AD [no=" + no + ", ad_no=" + ad_no
				+ ", title=" + title + ", content=" + content
				+ ", link=" + link + ", image=" + image + "]";
		},
		click: function() {
			alert('click');
			window.open(this.link, "_blank"); 
		}
};




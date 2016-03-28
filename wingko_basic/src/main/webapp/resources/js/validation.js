/*!
 * ysh
 * Date: 2013-08-17
 * 
 * function for wingko.
 */

var _validation = {
	id : function(val) {
		var regx = /[A-Za-z0-9]/;
		return regx.test(val);
	},
	email : function(val) {
		var regx = /^(?:\w+\.?)*\w+@(?:\w+\.)+\w+$/;;
		//console.log(val);
		return regx.test(val);
	}
};
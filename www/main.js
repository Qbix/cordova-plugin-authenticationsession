/*global cordova, module*/

module.exports = {

	start: function(redirectScheme, requestURL, cb, errorCb) {
    	cordova.exec(cb, errorCb, "AuthenticationSession", 'start', [redirectScheme, requestURL]);
  	}
  	
};

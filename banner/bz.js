function bzGetFlashPlayerBZ30F5B3EC1CF3410A8EA0() {
	var div = document.getElementById('SWBZ30F5B3EC1CF3410A8EA0');
	if (div) {
		div.innerHTML = '<p style="background-color:#ffffff;color:#000000;padding:1em;">You have an old version of Flash Player. <a href="http://www.adobe.com/go/getflash/" target="_top">Get the latest Flash player.</a></p>';
	} else {
		alert("no SWBZ30F5B3EC1CF3410A8EA0 div");
	}
}
function bzEmbedSWFBZ30F5B3EC1CF3410A8EA0() {
	if (swfobject.hasFlashPlayerVersion("9.0.45")) {
		var flashvars = {
			swfId: "SWBZ30F5B3EC1CF3410A8EA0",
			xmlPath: _urlBZ30F5B3EC1CF3410A8EA0 + "bz.xml",
			imgPath: _urlBZ30F5B3EC1CF3410A8EA0 + "img",
			urlType: "_blank",
			showInfo: "1",
			themeMode: "2"
		};
		var params = {
			wmode: "transparent",
			allowscriptaccess: "always"
		};
		var attributes = {};
		swfobject.embedSWF(_urlBZ30F5B3EC1CF3410A8EA0 + "bzAnimation.swf", "SWBZ30F5B3EC1CF3410A8EA0", "700", "280", "9.0.45", false, flashvars, params, attributes);
	} else {
		swfobject.addDomLoadEvent(bzGetFlashPlayerBZ30F5B3EC1CF3410A8EA0);
	}
}
bzEmbedSWFBZ30F5B3EC1CF3410A8EA0();

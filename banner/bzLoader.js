if( !_urlBZ30F5B3EC1CF3410A8EA0 ) {
	var _urlBZ30F5B3EC1CF3410A8EA0 = null;
	var scripts = document.getElementsByTagName("script");
	for( var i=0;i<scripts.length;i++ ) {
		var s = scripts[i];
		if( s.src && s.src.match(/bzLoader\.js/) ) {
			if (s.src.length>11) {
				_urlBZ30F5B3EC1CF3410A8EA0 = s.src.substring(0,s.src.length-11);
			} else {
				_urlBZ30F5B3EC1CF3410A8EA0 = "./";
			}
		}
	}
}
var _scriptsBZ30F5B3EC1CF3410A8EA0 = new Array();
_scriptsBZ30F5B3EC1CF3410A8EA0[0] = 'swfobject.js';
_scriptsBZ30F5B3EC1CF3410A8EA0[1] = 'bz.js';
for( var i=0;i<_scriptsBZ30F5B3EC1CF3410A8EA0.length;i++ ) {
	var urlC = _urlBZ30F5B3EC1CF3410A8EA0+_scriptsBZ30F5B3EC1CF3410A8EA0[i];
	document.write('<script type="text/javascript" src="'+ urlC +'"><\/script>');
}
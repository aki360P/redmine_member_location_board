  var eventsJSON = [];
  var event_json_text =[];

$(function(){
    $("#rmlb_check1").click(function() {
        if (this.checked) {
            console.log ("(cookie saved) rmlb_check1_auto-reload=1")
            document.cookie = 'rmlb_check1_auto-reload=1;';
            load_checkbox();
        } else {
            console.log ("(cookie saved) rmlb_check1_auto-reload=0")
            document.cookie = 'rmlb_check1_auto-reload=0;';
            load_checkbox();
        }
    });
    
    
    function doReload() { 
        if (document.getElementById("rmlb_check1").checked){ window.location.reload(); }
    }
    
	function GetCookie( name ){
		var result = null;
		
		var cookieName = name + '=';
		var allcookies = document.cookie;
		
		var position = allcookies.indexOf( cookieName );
		if( position != -1 )
		{
			var startIndex = position + cookieName.length;
			
			var endIndex = allcookies.indexOf( ';', startIndex );
			if( endIndex == -1 )
			{
				endIndex = allcookies.length;
			}
			
			result = decodeURIComponent(
				allcookies.substring( startIndex, endIndex ) );
		}
		
		return result;
	}
	
	function load_checkbox(){
		if ( GetCookie("rmlb_check1_auto-reload") == '1') {
			document.getElementById("rmlb_check1").checked = true;
			setTimeout(doReload, 5000);
		} else {
		}
	}
	
	load_checkbox();
	


})

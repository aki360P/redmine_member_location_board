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
	
	
		var getEventsJSON = function() {
			var url = baseUrl + '/projects/' + project_id + '/rmlb_locations.json';
			var offset = 0;
			console.log("ajax読み込み %s", url);
			
			$.ajax({
				url : url,
				dataType : 'json',
				
				
				success: function(res){ 
					console.log("ajax読み込み成功 %s", url);
					console.dir(res);
					
					buildEventsJSON(res, offset == 0);  //offset==0のときはtrue
					},
					
				error: function(){ console.log("ajax失敗 %s", url);  }
				
			});
	};
	
	var buildEventsJSON = function(eventsRawJSON, clear) {
          console.log('Building JSON');
          var count = eventsRawJSON.length;
          var event = eventsRawJSON;
          
          //clearにtrue送られてきたときのときは，初期化
          if (clear) {
              eventsJSON = {events:[]};
          }
          
          for (var i = 0; i < count; i++) {
              eventsJSON["events"].push({
              			user_id: event[i].user_id,
						user_priority: event[i].user_priority,
						location: event[i].location,
						color: event[i].color,
						start_time: event[i].start_time,
						end_time: event[i].end_time,
						memo: event[i].memo,
						updated_on: event[i].updated_on
              });
          }
          return true;
      };
	
	
	// getEventsJSON();
});
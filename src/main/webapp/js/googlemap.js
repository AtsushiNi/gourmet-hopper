$(document).ready(function() {
	shopsJson = shopsJson.filter(json => json.lat !== 0)
	
	const pins = shopsJson.map(json => {return ({location: new google.maps.LatLng(json.lat, json.lng), apiId: json.apiId})})
	
	let centerLat = 0
	let centerLng = 0
	shopsJson.forEach(json => {
		centerLat += json.lat
		centerLng += json.lng
	})
	centerLat /= shopsJson.length
	centerLng /= shopsJson.length
	
	const center = new google.maps.LatLng(centerLat, centerLng);
	
	var Options = {
		zoom: 15,      //地図の縮尺値
		center: center,    //地図の中心座標
		mapTypeId: 'roadmap'   //地図の種類
	};
	var map = new google.maps.Map(document.getElementById('map'), Options);
	
	pins.forEach(pin => {
		const marker = new google.maps.Marker({
			map: map,
			position: pin.location,
			title: pin.apiId,
			optimize: false
		});
		marker.addListener("click", () => {
			let target = $('#'+marker.getTitle())
			$('#shop-list').animate({
				scrollTop: $(target).offset().top
			}, 1000, 'swing', function() {
				window.location.hash = target.attr('id')
			})
			
			$("#shop-list div").removeClass("active-item")
			$("#shop-list div").addClass("deactive-item")
			$(target).addClass("active-item")
			$(target).removeClass("deactive-item")
		})
	});
	
	$("#map").on("mouseleave", function() {
			$("#shop-list div").removeClass("deactive-item")
			$("#shop-list div").addClass("active-item")		
	})
})
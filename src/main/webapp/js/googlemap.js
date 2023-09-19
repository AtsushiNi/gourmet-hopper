const center = new google.maps.LatLng(35.6811673, 139.7670516);
const pins = [new google.maps.LatLng(35.6811673, 139.7670516),new google.maps.LatLng(35.6787599, 139.7720196)];
var Options = {
	zoom: 15,      //地図の縮尺値
	center: center,    //地図の中心座標
	mapTypeId: 'roadmap'   //地図の種類
};
var map = new google.maps.Map(document.getElementById('map'), Options);

pins.forEach(pin => {
	const Marker = new google.maps.Marker({
		map: map,
		position: pin
	});
});  
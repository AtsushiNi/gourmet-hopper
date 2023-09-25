$(document).ready(function() {
	$("#large-area-button").on("click", () => {
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "/java-training-1.0/ajaxEndpoint/middleArea", true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.onload = function() {
			if(xhr.status === 200) {
				let responseData = xhr.responseText;
				const middleAreas = JSON.parse(responseData)
				middleAreas.forEach(middleArea => {
					const newDiv = $("<div>"+"<a href=control?action_name=search&middleAreaCode="+middleArea.code+">"+middleArea.name+"</a>"+"</div>")
					$("#middle-area-list").append(newDiv)
				})
			}
 		}
 		xhr.send();
	})
	
	$('[data-toggle="popover"]').popover();
	$('[data-toggle="popover"]').on('shown.bs.popover', function () {
    // ポップオーバー内の<div>に新しい要素を追加
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "/java-training-1.0/ajaxEndpoint/middleArea", true);
	xhr.setRequestHeader("Content-Type", "application/json");
	xhr.onload = function() {
		if(xhr.status === 200) {
			let responseData = xhr.responseText;
			const middleAreas = JSON.parse(responseData)
			middleAreas.forEach(middleArea => {
				const newDiv = $("<div>"+"<a href=control?action_name=search&middleAreaCode="+middleArea.code+">"+middleArea.name+"</a>"+"</div>")
				$("#middle-areas").add(newDiv)
			})
		}
	}
	xhr.send();
  });
})
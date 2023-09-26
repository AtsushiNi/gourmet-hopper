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

    $(".active-item").on("click", function() {
		const apiId = $(this).attr("id")
		window.location.href = "http://localhost:8080/java-training-1.0/control?action_name=shop_detail&apiId="+apiId
	})
	
	// エリア検索
	$("#drop-down").on("show.bs.dropdown", function () {
		$.get("/java-training-1.0/ajaxEndpoint/middleArea", function(response) {
	      const areas = response.data
	      const chunkSize = Math.ceil(areas.length / 3)
	      let n = 0;
	      for(let i=0; i<areas.length; i+= chunkSize) {
	        const chunk = areas.slice(i, i + chunkSize)
	        $(".area-col").eq(n).children().remove()
	        chunk.forEach(area => {
	          const div = $("<a class='row mb-1' href=control?action_name=search&middleAreaCode="+area.code+">" + area.name + "</a>")
	          $(".area-col").eq(n).append(div)
	        })
	        n++;
	      }
		})
	})
})

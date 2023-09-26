$(document).ready(function() {
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
	          const div = $("<a class='row mb-1' href=control?action_name=search&middleAreaCode="+area.code+"&areaName="+area.name+">" + area.name + "</a>")
	          $(".area-col").eq(n).append(div)
	        })
	        n++;
	      }
		})
	})
})

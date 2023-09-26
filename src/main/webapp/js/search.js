$(document).ready(function() {
	$('#community-select').on('change', function() {
		var selectedCommunityId = $(this).val();
		window.location.href = "http://localhost:8080/java-training-1.0/control?action_name=topcommunity&communityId="+selectedCommunityId
    });
    
    $(".active-item").on("click", function() {
		const apiId = $(this).attr("id")
		window.location.href = "http://localhost:8080/java-training-1.0/control?action_name=shop_detail&apiId="+apiId
	})
})

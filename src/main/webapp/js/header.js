$(document).ready(function() {
	$('#community-select').on('change', function() {
		var selectedCommunityId = $(this).val();
		window.location.href = "http://localhost:8080/java-training-1.0/control?action_name=topcommunity&communityId="+selectedCommunityId
    });

/*    
    $("#header-avatar").on("click", function() {
		$("#dropdown").addClass("show")
		$(".dropdown-toggle").attr("aria-expanded", "true")
		$(".dropdown-menu").addClass("show")
		
	})
    $("#header-avatar").on("click", function() {
		$(".dropdown-toggle").dropdown()
		
	})
*/
})

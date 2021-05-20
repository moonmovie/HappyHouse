function returnResult() {
	
	$.ajax({
		url : "re.html",
		type : "POST",
		success : function test(a){
			$(".aptResult").children().css('display', 'none');
			$(".aptResult").html(a);
		},
		error : function error() {
			alert("error");
		}
	});
}

$(document).ready(function() {
	$('#signUp').on('click', function() {
		$.ajax({
			url : "signUp.html",
			type : "POST",
			success : function test(a) {
				$("#main").children().css('display', 'none');
				$("#main").html(a);
			},
			error : function error() {
				alert("error");
			}
		});
	})
});

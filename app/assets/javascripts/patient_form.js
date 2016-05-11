$(document).ready(function() {

	$('#patient_basic_info button').on("click", function(e) {
		e.preventDefault();
		$('#patient_basic_info').slideUp(1000);
		$('#patient_contact_info').slideDown(1000);
	});

	$('#patient_contact_info button').on("click", function(e) {
		e.preventDefault();
		$('#patient_contact_info').slideUp(1000);
		$('#alternate_contact_info').slideDown(1000);
	});

	$('#alternate_contact_info button').on("click", function(e) {
		e.preventDefault();
		$('#alternate_contact_info').slideUp(1000);
		$('#patient_transportation').slideDown(1000);
	});

	$('#patient_transportation button').on("click", function(e) {
		e.preventDefault();
		$('#patient_transportation').slideUp(1000);
		$('#patient_payer_info').slideDown(1000);
	});

	$('#center_submit').on("click", function() {
		$('.row').show();
	});

});
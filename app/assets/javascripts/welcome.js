$(function(){
	$('div[onload]').trigger('onload');
});

function arrangeTable(){
	document.getElementById('submission_row').className = "col-md-4";
	document.getElementById('submission_box').className = "col-md-12";
	document.getElementById('table-row').className = "col-md-8";
	document.getElementById('notice-box').style.backgroundColor = "transparent";
}
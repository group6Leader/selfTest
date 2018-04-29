/**
 * 
 */

$(document).ready(function() {

	if($('#board_Category').val() == '병원 평가'){
		$('.rating').show()
	}else{
		$('.rating').hide()
	}
})

function del(board_Num) {
	
	if(confirm("정말 삭제하시겠습니까?")){
		location.href='./delete?board_Num=' + board_Num;
	}
}

function edit(board_Num) {
	
	if(confirm("정말 수정하시겠습니까?")){
		location.href='./edit?board_Num=' + board_Num;
	}
}

function del2(board_Num, reply_Num) {
	
	if(confirm("정말 삭제하시겠습니까?")){
		location.href='../reply/delete?board_Num=' + board_Num + '&reply_Num=' + reply_Num;
	}
}

function editForm(board_Num, reply_Num, text) {
	
	var div = document.getElementById("div"+reply_Num);
	
	var str = '<form name="editForm' + reply_Num + '" action="../reply/edit" method="post">';
	str += '<input type="hidden" name="reply_Num" value="'+reply_Num+'">';
	str += '<input type="hidden" name="board_Num" value="'+board_Num+'">';
	str += '&nbsp;';
	str += '<input type="text" name="text" value="' + text + '" style="width:600px;">' + '<a href="javascript:editResult(document.editForm' + reply_Num + ')">[저장]</a>' + '<a href="javascript:editCancel(document.getElementById(\'div' + reply_Num + '\'))">[취소]</a>';
	str += '</form>';
	div.innerHTML = str;
	
}

/*str += '&nbsp;';
str += '<a href="javascript:editResult(document.editForm' + reply_Num + ')">[저장]</a>';
str += '&nbsp;';
str += '<a href="javascript:editCancel(document.getElementById(\'div' + reply_Num + '\'))">[취소]</a>';*/

function editResult(form) {
	if (confirm('수정된 내용을 저장하시겠습니까?')) {
		form.submit();
	}
}

function editCancel(div) {
	
	div.innerHTML = '';
}

function checkReply() {
	var text = $('#text').val();
	/*alert(text);*/
	
	if(text == '') {
		alert("댓글을 입력해주세요");
		return false;
	}

	return true;	
}

$(':radio').change(function() {
	  console.log('New star rating: ' + this.value);
});

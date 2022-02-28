
$(document).ready(function(){
	
	// 글 삭제
	
	// 댓글 삭제
	
	var content = '';
	
	// 댓글 수정
	$('.btnCommentModify').click(function(){
		
		var tag = $(this);
		var mode = $(this).text();    			    			
		var textarea = $(this).parent().prev();
		
		if(mode == '수정'){
			// 수정모드
			content = textarea.val(); 
			
			$(this).prev().css('display', 'none');
			$(this).next().css('display', 'inline');
			$(this).text('수정완료');
			textarea.attr('readonly', false).focus();
			textarea.css({
				'background': 'white',
				'outline': '1px solid gray'
			});
			
		}else{
			// 수정완료 모드
			
			var seq     = textarea.attr('data-seq');
			var comment = textarea.val(); 
			
			var jsonData = {
					'seq': seq,
					'comment': comment
				};
			
			$.ajax({
				url: '/Farmstory3/board/updateComment.do',
				type: 'post',
				data: jsonData,   // 서버로 전송하는 데이터(JSON) 지정
				dataType: 'json', // 서버로 부터 전달되는 데이터 종류
				success: function(data){
					if(data.result == 1){
						alert('댓글 수정이 성공 했습니다.');
						
						// 수정모드 해제
						tag.text('수정');
						tag.prev().css('display', 'inline');
						tag.next().css('display', 'none');    			    			    							
		    			textarea.attr('readonly', true);
		    			textarea.css({
		    				'background': 'transparent',
		    				'outline': 'none'
		    			});
		    			
					}else{
						alert('댓글 수정이 실패 했습니다.');
					}
				}
			});
		}
		return false;
	});
	
	// 댓글 수정 취소
	$('.btnCommentCancel').click(function(e){
		e.preventDefault();
		$(this).prev().text('수정');
		$(this).prev().prev().css('display', 'inline');
		$(this).css('display', 'none');
		
		var textarea = $(this).parent().prev();
		
		textarea.val(content);
		textarea.attr('readonly', true);
		textarea.css({
			'background': 'transparent',
			'outline': 'none'
		});	
	});
	$('.btnCancel').click(function(){
		var textarea = $(this).parent().prev();
		textarea.val(content);		
		textarea.text('')
	});
});

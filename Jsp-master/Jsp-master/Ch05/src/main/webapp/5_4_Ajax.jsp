<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5_4_Ajax</title>
	<%--
		날짜 : 2021/08/09
		이름 : 김철학
		내용 : AJAX 실습하기
		
		AJAX(Asynchronous Javascript And Xml)
		  - 일반적인 페이지 요청을 위한 HTTP 통신과 다르게 데이터 요청을 위한 부분 통신(비동기)
		  - 데이터 결과는 일반적으로 Json 사용 
	--%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			
			// 데이터 출력 태그객체 선택
			var tds = $('tr > td:nth-child(2)');
			
			// 버튼 이벤트 구현
			$('button').click(function(){
				
				// Ajax통신(데이터 요청)
				$.ajax({
					url: './5_1_Json.jsp',
					type: 'get',
					dataType: 'json',
					success: function(data){
						tds.eq(0).text(data.uid);
						tds.eq(1).text(data.name);			
						tds.eq(2).text(data.hp);			
						tds.eq(3).text(data.age);			
					}
				});
			});
		});
	</script>
	
</head>
<body>
	<h3>4.Ajax 통신 실습하기</h3>
	
	<button>데이터 가져오기</button>
	
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>-</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>-</td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td>-</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>-</td>
		</tr>	
	</table>

</body>
</html>
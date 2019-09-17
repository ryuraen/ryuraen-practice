<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판만들기</title>
</head>
<body>
	<form action="insert.jsp" method="post" onsubmit="return formCheck();">
	제목 : <input type="text" name="title" placeholder="제목을 입력하세요.<필수>"	/> <br> 
	작성자 : <input type="text" name="writer" placeholder="작성자를 입력하세요.<필수>" /><br> 
	날짜 : <input type="text" name="regdate" placeholder="날짜를 입력하세요.<필수>" /><br> 
	내용 : <textarea rows="10" cols="20" name="content" placeholder="내용을 입력하세요.<필수>" ></textarea> <br> 
		 <input type="submit" />
	</form>

	<script>
		function formCheck() {
			var title = document.forms[0].title.value;
			// 사용하기 쉽도록 변수를 선언하여 담아주고,
			var writer = document.forms[0].writer.value;
			var regdate = document.forms[0].regdate.value;
			var content = document.forms[0].content.value; // 추가되었습니다. 글내용

			if (title == null || title == "") { // null인지 비교한 뒤
				alert('제목을 입력하세요'); // 경고창을 띄우고
				document.forms[0].title.focus(); // 해당태그에 포커스를 준뒤
				return false; // false를 리턴합니다.
			}
			if (writer == null || writer == "") {
				alert('작성자를 입력하세요');
				document.forms[0].writer.focus();
				return false;
			}

			// 글작성폼에 내용을 추가하였습니다. 게시판에 글내용은 당연히 있어야겠죠?
			// 추가할 html코드 : content : <textarea rows="10" cols="20" name="content"></textarea><br>

			if (content == null || content == "") {
				alert('내용을 입력하세요');
				document.forms[0].content.focus();
				return false;
			}

			if (regdate == null || regdate == "") {
				alert('날짜를 입력하세요');
				document.forms[0].regdate.focus();
				return false;
			}
		}
	</script>
</body>
</html>
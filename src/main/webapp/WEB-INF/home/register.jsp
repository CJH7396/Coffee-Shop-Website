<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>register coffee</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
</head>

<body>
	<p style="font-size: 50px; background-color: White; width: 50%;">커피등록</p>
	<label for="name">커피이름</label>
	<input type="text" name="name" id="name" />
	<label for="price">가격</label>
	<input type="text" name="price" id="price" />
	<label for="inven">재고</label>
	<input type="text" name="inven" id="inven" />
	<br>

	<script>
		function postDataFromAPI() { //Coffee Register function
			if ($("#name").val() == "")
				alert("이름을 다시 설정하세요!");
			else if ($("#price").val() <= 0)
				alert("가격을 다시 설정하세요!");
			else if ($("#inven").val() <= 0)
				alert("재고를 다시 설정하세요!");
			else {
				var modelObj = {
					name : $("#name").val(),
					price : $("#price").val(),
					inven : $("#inven").val()

				};
				console.log("post data:" + modelObj);

				$.ajax({
					type : "POST",
					url : "/postdata",
					headers : {
						"Content-Type" : "application/json",
					},
					data : JSON.stringify(modelObj),
					success : function(data) {
						console.log("POST API RESPONSE::" + data);
						alert("등록되었습니다!")

					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
			}
		}

		//등록 후 redirect 설정
		function redirect() {
			window.location = "/register"
		}
	</script>
	<br>
	<input type="button" name="postData" id="postData" value="커피등록"
		onclick="postDataFromAPI();" />
	<input type="button" value="리스트조회" onclick="location.href='/detail'">
	<input type="button" value="메인으로" onclick="location.href='/'">
</body>
</html>
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
	<p style="font-size: 50px; background-color: White; width: 50%;">Ŀ�ǵ��</p>
	<label for="name">Ŀ���̸�</label>
	<input type="text" name="name" id="name" />
	<label for="price">����</label>
	<input type="text" name="price" id="price" />
	<label for="inven">���</label>
	<input type="text" name="inven" id="inven" />
	<br>

	<script>
		function postDataFromAPI() { //Coffee Register function
			if ($("#name").val() == "")
				alert("�̸��� �ٽ� �����ϼ���!");
			else if ($("#price").val() <= 0)
				alert("������ �ٽ� �����ϼ���!");
			else if ($("#inven").val() <= 0)
				alert("��� �ٽ� �����ϼ���!");
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
						alert("��ϵǾ����ϴ�!")

					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
			}
		}

		//��� �� redirect ����
		function redirect() {
			window.location = "/register"
		}
	</script>
	<br>
	<input type="button" name="postData" id="postData" value="Ŀ�ǵ��"
		onclick="postDataFromAPI();" />
	<input type="button" value="����Ʈ��ȸ" onclick="location.href='/detail'">
	<input type="button" value="��������" onclick="location.href='/'">
</body>
</html>
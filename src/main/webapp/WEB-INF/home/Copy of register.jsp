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
<!--  	<label for="id">id</label>
	<input type="text" name="id" id="id" />-->
	<label for="name">Ŀ���̸�</label>
	<input type="text" name="name" id="name" />
	<br>
	<label for="price">����</label>
	<input type="text" name="price" id="price" />
	<label for="inven">���</label>
	<input type="text" name="inven" id="inven" />
	<br>

	<script>
		function postDataFromAPI() {
			var modelObj = {

		//		id : $("#id").val(),
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

		function deleteDataFromAPI(id) {
			var modelObj = {
				id : id,
				name : $("#name1").val(),
				price : $("#price1").val(),
		//		inven : $("#inven1").val(),
				flag : 1
			};
			$.ajax({
				type : "POST",
				url : "/postdata",
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify(modelObj),
				success : function(data) {
					console.log("POST API RESPONSE::" + data);
					alert("�����Ǿ����ϴ�!")
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
		//��� �� redirect ����
		function redirect() {
			window.location = "/"
		}
		function getDataFromAPI() {
			$.ajax({
						url : "/list/show",
						type : 'GET',
						dataType : 'json',
						success : function(data) {
							var htmls = '';
							htmls += "<h1>����Ʈ ��ȸ</h1>";
							$
									.each(
											data,
											function() {
												if (this['flag'] != 1) {
													htmls += "<tr>";
													htmls += "<label for='id'>ID : </label>";
													htmls += "<input type='text' name='id' size=5 id='id' value="+this['id'] + " readonly='readonly' />";
													htmls += "<label for='name'> �̸� : </label>";
													htmls += "<input type='text' name='name' size=5 id='name' value="+this['name'] + "  />";
													htmls += "<label for='regdate'> �����  : </label>";
													htmls += "<input type='text' name='regdate' size=20 id='regdate' value="+this['regdate']+"  />";
													//	htmls += "<label for='inven'>���  : </label>";
													//	htmls += "<input type='text' name='inven' size=10 id ='inven' value="+this['inven']+"  />";
													htmls += '&nbsp;<td><input type="button" name="detail" id="detail" value="����ȸ" onclick = "detail('
															+ this['id']
															+ ')"></td>';
													htmls += '&nbsp;<td><input type="button" name="detail" id="detail" value="����ȸ" onclick = "sellDataFromAPI('+ this['id']
															+ ')"></td>';		
													//	htmls += '<td><input type="button" name="update" id="update" value="�����ϱ�" onclick ="updateDataFromAPI();"/></td>'
							    					//	htmls += '<td><input type="button" name="showdetail" id="showdetail" value="�󼼺���" onclick="detail('+this['id']+') </td>'
													htmls += "</tr>";
													htmls += "<br>";
												}
											})
							document.write(htmls);
						},
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});
		}

		function sellDataFromAPI(id) {
			var modelObj = {
				id : id,
				name : $("#name1").val(),
				price : $("#price1").val(),
				inven : $("#inven1").val()
			};
			$.ajax({
				type : "POST",
				url : "/postdata",
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify(modelObj),
				success : function(data) {
					console.log("POST API RESPONSE::" + data);
					alert("������ �Ϸ�Ǿ����ϴ�!")
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}

		function detail(id) {
			$
					.ajax({
						url : "/detail/" + id,
						type : 'GET',
						dataType : 'json',
						success : function(data) {
							var htmls = '';
							htmls += "<h1>�� ��ȸ</h1>";
							var tmp = '';
							if (this['flag'] != 1) {
								tmp += data['id'];
								htmls += "<tr>";
								htmls += "<label for='id'>ID : </label>";
								htmls += "<input type='text' name='id' size=5 id='id1' value="+data['id'] + " readonly='readonly' />";
								htmls += "<label for='name'> �̸� : </label>";
								htmls += "<input type='text' name='name' size=5 id='name1' value="+data['name'] + "  />";
								htmls += "<label for='price'> ����  : </label>";
								htmls += "<input type='text' name='price' size=10 id='price1' value="+data['price']+"  />";
								htmls += "<label for='inven'> ���  : </label>";
								htmls += "<input type='text' name='inven' size=10 id ='inven1' value="+data['inven']+"  /><br>";
								htmls += "<label for='regdate'>�����  : </label>";
								htmls += "<input type='text' name='regdate' size=20 id='regdate' value="+data['regdate']+"  />";
								htmls += "<label for='moddate'> ������  : </label>";
								htmls += "<input type='text' name='moddate' size=20 id='moddate' value="+data['moddate']+"  />";
								//	htmls += '<td><input type="button" name="detail" id="detail" value="����ȸ" onclick ="location.href='/detail'"/></td>'
								htmls += '&nbsp;<td><input type="button" name="update" id="update" value="�����ϱ�" onclick ="updateDataFromAPI('+tmp+');"/></td>'
								htmls += '&nbsp;<td><input type="button" name="delete" id="delete" value="�����ϱ�" onclick ="deleteDataFromAPI('+tmp+');"/></td>'
								
								//	htmls += '<td><input type="button" name="showdetail" id="showdetail" value="�󼼺���" onclick="detail('+this['id']+') </td>'
								htmls += "</tr>";
								htmls += "<br>";
							}
							document.write(htmls);
						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
						
					});
		}


		function updateDataFromAPI(id) {
			var modelObj = {
				id : id,
				name : $("#name1").val(),
				price : $("#price1").val(),
				inven : $("#inven1").val()
			};
			$.ajax({
				type : "POST",
				url : "/postdata",
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify(modelObj),
				success : function(data) {
					console.log("POST API RESPONSE::" + data);
					alert("������ �Ϸ�Ǿ����ϴ�!")
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}

		window.onload = function () {
		      $.ajax({
		         type : "GET",
		         url : "http://9.194.109.109:8000/getShopList",
		         headers : {
		            "Content-Type" : "application/json",
		         },
		         crossOrigin: true,
		         success : function(data) {
		            console.log("GET API RESPONSE::" + data);
		         },
		         error : function(jqXHR, textStatus, errorThrown) {
		         }
		      });//ajax
		   }

	</script>
	<br>
	<input type="button" name="postData" id="postData" value="Ŀ�ǵ��"
		onclick="postDataFromAPI();" />
	<input type="button" name="getData" id="getData" value="Ŀ����ȸ"
		onclick="getDataFromAPI();" />
	<input type="button" value="��������" onclick="location.href='/'">
</body>
</html>
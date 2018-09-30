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
<!--  	<label for="id">id</label>
	<input type="text" name="id" id="id" />-->
	<label for="name">커피이름</label>
	<input type="text" name="name" id="name" />
	<br>
	<label for="price">가격</label>
	<input type="text" name="price" id="price" />
	<label for="inven">재고</label>
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
					alert("등록되었습니다!")
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
					alert("삭제되었습니다!")
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
		//등록 후 redirect 설정
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
							htmls += "<h1>리스트 조회</h1>";
							$
									.each(
											data,
											function() {
												if (this['flag'] != 1) {
													htmls += "<tr>";
													htmls += "<label for='id'>ID : </label>";
													htmls += "<input type='text' name='id' size=5 id='id' value="+this['id'] + " readonly='readonly' />";
													htmls += "<label for='name'> 이름 : </label>";
													htmls += "<input type='text' name='name' size=5 id='name' value="+this['name'] + "  />";
													htmls += "<label for='regdate'> 등록일  : </label>";
													htmls += "<input type='text' name='regdate' size=20 id='regdate' value="+this['regdate']+"  />";
													//	htmls += "<label for='inven'>재고  : </label>";
													//	htmls += "<input type='text' name='inven' size=10 id ='inven' value="+this['inven']+"  />";
													htmls += '&nbsp;<td><input type="button" name="detail" id="detail" value="상세조회" onclick = "detail('
															+ this['id']
															+ ')"></td>';
													htmls += '&nbsp;<td><input type="button" name="detail" id="detail" value="상세조회" onclick = "sellDataFromAPI('+ this['id']
															+ ')"></td>';		
													//	htmls += '<td><input type="button" name="update" id="update" value="수정하기" onclick ="updateDataFromAPI();"/></td>'
							    					//	htmls += '<td><input type="button" name="showdetail" id="showdetail" value="상세보기" onclick="detail('+this['id']+') </td>'
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
					alert("수정이 완료되었습니다!")
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
							htmls += "<h1>상세 조회</h1>";
							var tmp = '';
							if (this['flag'] != 1) {
								tmp += data['id'];
								htmls += "<tr>";
								htmls += "<label for='id'>ID : </label>";
								htmls += "<input type='text' name='id' size=5 id='id1' value="+data['id'] + " readonly='readonly' />";
								htmls += "<label for='name'> 이름 : </label>";
								htmls += "<input type='text' name='name' size=5 id='name1' value="+data['name'] + "  />";
								htmls += "<label for='price'> 가격  : </label>";
								htmls += "<input type='text' name='price' size=10 id='price1' value="+data['price']+"  />";
								htmls += "<label for='inven'> 재고  : </label>";
								htmls += "<input type='text' name='inven' size=10 id ='inven1' value="+data['inven']+"  /><br>";
								htmls += "<label for='regdate'>등록일  : </label>";
								htmls += "<input type='text' name='regdate' size=20 id='regdate' value="+data['regdate']+"  />";
								htmls += "<label for='moddate'> 수정일  : </label>";
								htmls += "<input type='text' name='moddate' size=20 id='moddate' value="+data['moddate']+"  />";
								//	htmls += '<td><input type="button" name="detail" id="detail" value="상세조회" onclick ="location.href='/detail'"/></td>'
								htmls += '&nbsp;<td><input type="button" name="update" id="update" value="수정하기" onclick ="updateDataFromAPI('+tmp+');"/></td>'
								htmls += '&nbsp;<td><input type="button" name="delete" id="delete" value="삭제하기" onclick ="deleteDataFromAPI('+tmp+');"/></td>'
								
								//	htmls += '<td><input type="button" name="showdetail" id="showdetail" value="상세보기" onclick="detail('+this['id']+') </td>'
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
					alert("수정이 완료되었습니다!")
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
	<input type="button" name="postData" id="postData" value="커피등록"
		onclick="postDataFromAPI();" />
	<input type="button" name="getData" id="getData" value="커피조회"
		onclick="getDataFromAPI();" />
	<input type="button" value="메인으로" onclick="location.href='/'">
</body>
</html>
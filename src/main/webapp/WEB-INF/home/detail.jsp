<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Coffee List</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
</head>

<body>

	<script>
		window.onload = function() {	//커피의 리스트를 조회하는 함수(샵리스트 포함)
			var shopList = "";
			$
					.ajax({
						url : "/list/show",
						type : 'GET',
						dataType : 'json',
						async : false,
						success : function(data) {
							var htmls = '';

							htmls += "<h1>리스트 조회</h1>";
							$
									.each(
											data,
											function() {
												if (this['flag'] != 1) {
													htmls += "<tr>";
													//	htmls += "<label for='id'>ID : </label>";
													//	htmls += "<input type='text' name='id' size=5 id='id' value="+this['id'] + " readonly='readonly' />";
													htmls += "<label for='name'> 이름 : </label>";
													htmls += "<input type='text' name='name' size=5 id='name' value="+this['name'] + "></input>";
													htmls += "<label for='regdate'> 등록일  : </label>";
													htmls += "<input type='text' name='regdate' size=6 id='regdate' value="+this['regdate']+"  />";
													shopList = "";

													htmls += "<label for='shoplist'> 샵리스트  : </label>";
													htmls += "<input type='text' name='shoplist' size=25 id='shoplist' value="
															+ getShopList(this['id'])
															+ "></input>";
													htmls += "&nbsp;<td><a href='/detail/"+this['id']+"'>상세정보</a></td>";
													htmls += "</tr>";
													htmls += "<br>";

												}
											})
							htmls += "<br>";
							htmls += "<td><a href='/'>메인으로</a></td>";
							htmls += "<br>";
							htmls += "<br>";
							htmls += "<td><a href='/register'>커피등록</a></td>";
							document.write(htmls);
						},
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});
		}

		function getShopList(id) {	//Cors를 이용하여 샵 어플리케이션에서 샵 리스트를 가져오는 함수
			shopList = "";
			var s_id = id;
			console.log(s_id);
			$.ajax({
				type : "GET",
				url : "http://9.194.109.109:8000/getShopList/" + s_id,
				crossOrigin : true,
				async : false,
				success : function(data) {
					console.log("잘들어와");
					$.each(data, function(index, value) {
						console.log(index + "번쨰" + value.name);
						if (index == (data.length - 1)) {
							shopList += value.name
						} else {
							shopList += value.name + ",";
						}
					});
					console.log(s_id + "의 shop리스트" + shopList);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("error");
				}
			});//ajax
			return shopList;
		}

		
/* 		function redirect() { //등록 후 redirect 설정
			window.location = "/"
		} 
 */
	</script>
	<br>

</body>
</html>
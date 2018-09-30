<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	<p style="font-size: 50px; background-color: White; width: 50%;">커피조회</p>
	<script>

		window.onload = function(){
			detail();
			}

		function detail(){ //해당하는 ID의 상세정보를 보여주는 함수
		$
				.ajax({
					url : "/moredetail/" + ${id},
					type : 'GET',
					dataType : 'json',
					success : function(data) {
						var htmls = '';
						htmls += "<h1>상세 조회</h1>";
						var tmp = '';
						if (this['flag'] != 1) {
							tmp += data['id'];
							htmls += "<tr>";
							htmls += "<label for='name'> 이름 : </label>";
							htmls += "<input type='text' name='name' size=10 id='name1' value="+data['name'] + "  />";
							htmls += "<label for='price'> 가격  : </label>";
							htmls += "<input type='text' name='price' size=10 id='price1' value="+data['price']+"  />";
							htmls += "<label for='inven'> 재고  : </label>";
							htmls += "<input type='text' name='inven' size=10 id ='inven1' value="+data['inven']+"  /><br>";
							htmls += "<label for='regdate'> 등록일  : </label>";
							htmls += "<input type='text' name='regdate' size=6 id='regdate' value="+data['regdate']+" readonly='readonly' />";
							htmls += "<label for='moddate'> 수정일  : </label>";
							htmls += "<input type='text' name='moddate' size=6 id='moddate' value="+data['moddate']+" readonly='readonly' /><br>";
							htmls += "<label for='totamount'> 총판매량 : </label>";
							htmls += "<input type='text' name='totamount' size=10 id='totamount' value="+data['totamount']+" readonly='readonly' />";
							htmls += "<label for='totsale'> 총판매액  : </label>";
							htmls += "<input type='text' name='totsale' size=10 id='totsale' value="+data['totsale']+" readonly='readonly' /><br><br>";
							htmls += '&nbsp;<td><input type="button" name="shopdetail" id="shopdetail" value="샵상세조회" onclick ="getShopDetail('+tmp+');"/></td>'
							htmls += '&nbsp;<td><input type="button" name="update" id="update" value="수정하기" onclick ="updateDataFromAPI('+tmp+');"/></td>'
							htmls += '&nbsp;<td><input type="button" name="delete" id="delete" value="삭제하기" onclick ="deleteDataFromAPI('+tmp+');"/></td>'
							htmls += "</tr>";
							htmls += "<br>";
							htmls += "<br>";
						}
						htmls += "<td><a href='/'>메인으로</a></td>";
						htmls += "<br>";
						htmls += "<br>";
						htmls += "<td><a href='/register'>커피등록</a></td>";
						htmls += "<br>";
						htmls += "<br>";
						htmls += "<td><a href='/detail'>리스트조회</a></td>";
						document.write(htmls);
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
					
				});
	}

		function deleteDataFromAPI(id) { //해당하는 ID의 특정값들을 삭제해주는 함수
			var modelObj = {
				id : id,
				name : $("#name1").val(),
				totamount : $("#totamount1").val(),
				totsale : $("#totsale1").val(),
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


		function updateDataFromAPI(id) {	//해당하는 ID의 특정 값들을 수정해주는 함수
			if ($("#name1").val() == "")
				alert("이름을 다시 설정하세요!");
			else if ($("#price1").val() <= 0)
				alert("가격을 다시 설정하세요!");
			else if ($("#inven1").val() <= 0)
				alert("재고를 다시 설정하세요!");
			else {
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
		}

		function getShopDetail(id) {	//샵 어플리케이션으로부터 샵의 상세정보를 가져오는 함수
			shopdetail ="";
			console.log("!!!!")
			console.log(id)
               $.ajax({
                        type : "GET",
                        url : "http://9.194.109.109:8000/getShopList/"+id,
                        crossOrigin : true,
                        async:false,
                        success : function(data) {
                        	console.log(data)
                        	var htmls = '';
    						htmls += "<h1>샵 상세조회</h1>";
    						$.each(	data,
									function() {
    						//var tmp = '';
    						if (this['flag'] != 1) {
    						//	tmp += data['id'];
    							htmls += "<tr>";
    							htmls += "<label for='id'>ID : </label>";
    							htmls += "<input type='text' name='id' size=5 id='id' value="+this['id'] + " readonly='readonly' />";
    							htmls += "<label for='name'> 이름 : </label>";
    							htmls += "<input type='text' name='name' size=5 id='name' value="+this['name'] + "  />";
    							htmls += "<label for='regdate'>등록일  : </label>";
    							htmls += "<input type='text' name='regdate' size=6 id='regdate' value="+this['regdate']+"  />";
    							htmls += "<label for='moddate'> 수정일  : </label>";
    							htmls += "<input type='text' name='moddate' size=6 id='moddate' value="+this['moddate']+"  />";
    							htmls += "</tr>";
    							htmls += "<br>";
    							htmls += "<br>";

    						}
    						})
    					document.write(htmls);                

                        },
                        error : function(jqXHR, textStatus,
                              errorThrown) {
                           console.log("error");
                        }
                     });
            }

	</script>
	<br>
</body>
</html>
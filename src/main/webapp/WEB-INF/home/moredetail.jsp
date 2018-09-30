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
	<p style="font-size: 50px; background-color: White; width: 50%;">Ŀ����ȸ</p>
	<script>

		window.onload = function(){
			detail();
			}

		function detail(){ //�ش��ϴ� ID�� �������� �����ִ� �Լ�
		$
				.ajax({
					url : "/moredetail/" + ${id},
					type : 'GET',
					dataType : 'json',
					success : function(data) {
						var htmls = '';
						htmls += "<h1>�� ��ȸ</h1>";
						var tmp = '';
						if (this['flag'] != 1) {
							tmp += data['id'];
							htmls += "<tr>";
							htmls += "<label for='name'> �̸� : </label>";
							htmls += "<input type='text' name='name' size=10 id='name1' value="+data['name'] + "  />";
							htmls += "<label for='price'> ����  : </label>";
							htmls += "<input type='text' name='price' size=10 id='price1' value="+data['price']+"  />";
							htmls += "<label for='inven'> ���  : </label>";
							htmls += "<input type='text' name='inven' size=10 id ='inven1' value="+data['inven']+"  /><br>";
							htmls += "<label for='regdate'> �����  : </label>";
							htmls += "<input type='text' name='regdate' size=6 id='regdate' value="+data['regdate']+" readonly='readonly' />";
							htmls += "<label for='moddate'> ������  : </label>";
							htmls += "<input type='text' name='moddate' size=6 id='moddate' value="+data['moddate']+" readonly='readonly' /><br>";
							htmls += "<label for='totamount'> ���Ǹŷ� : </label>";
							htmls += "<input type='text' name='totamount' size=10 id='totamount' value="+data['totamount']+" readonly='readonly' />";
							htmls += "<label for='totsale'> ���Ǹž�  : </label>";
							htmls += "<input type='text' name='totsale' size=10 id='totsale' value="+data['totsale']+" readonly='readonly' /><br><br>";
							htmls += '&nbsp;<td><input type="button" name="shopdetail" id="shopdetail" value="������ȸ" onclick ="getShopDetail('+tmp+');"/></td>'
							htmls += '&nbsp;<td><input type="button" name="update" id="update" value="�����ϱ�" onclick ="updateDataFromAPI('+tmp+');"/></td>'
							htmls += '&nbsp;<td><input type="button" name="delete" id="delete" value="�����ϱ�" onclick ="deleteDataFromAPI('+tmp+');"/></td>'
							htmls += "</tr>";
							htmls += "<br>";
							htmls += "<br>";
						}
						htmls += "<td><a href='/'>��������</a></td>";
						htmls += "<br>";
						htmls += "<br>";
						htmls += "<td><a href='/register'>Ŀ�ǵ��</a></td>";
						htmls += "<br>";
						htmls += "<br>";
						htmls += "<td><a href='/detail'>����Ʈ��ȸ</a></td>";
						document.write(htmls);
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
					
				});
	}

		function deleteDataFromAPI(id) { //�ش��ϴ� ID�� Ư�������� �������ִ� �Լ�
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
					alert("�����Ǿ����ϴ�!")
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}


		function updateDataFromAPI(id) {	//�ش��ϴ� ID�� Ư�� ������ �������ִ� �Լ�
			if ($("#name1").val() == "")
				alert("�̸��� �ٽ� �����ϼ���!");
			else if ($("#price1").val() <= 0)
				alert("������ �ٽ� �����ϼ���!");
			else if ($("#inven1").val() <= 0)
				alert("��� �ٽ� �����ϼ���!");
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
					alert("������ �Ϸ�Ǿ����ϴ�!")
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
		}

		function getShopDetail(id) {	//�� ���ø����̼����κ��� ���� �������� �������� �Լ�
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
    						htmls += "<h1>�� ����ȸ</h1>";
    						$.each(	data,
									function() {
    						//var tmp = '';
    						if (this['flag'] != 1) {
    						//	tmp += data['id'];
    							htmls += "<tr>";
    							htmls += "<label for='id'>ID : </label>";
    							htmls += "<input type='text' name='id' size=5 id='id' value="+this['id'] + " readonly='readonly' />";
    							htmls += "<label for='name'> �̸� : </label>";
    							htmls += "<input type='text' name='name' size=5 id='name' value="+this['name'] + "  />";
    							htmls += "<label for='regdate'>�����  : </label>";
    							htmls += "<input type='text' name='regdate' size=6 id='regdate' value="+this['regdate']+"  />";
    							htmls += "<label for='moddate'> ������  : </label>";
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
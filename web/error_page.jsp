<%-- 
    Document   : error_page
    Created on : Nov 15, 2020, 9:23:41 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xin lỗi! Đã xảy ra lỗi</title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .primary-background{background: blue!important; }
            
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
        </style>

    </head>
    <body>
        <div class="container text-center"  >
            <img src="img/error.png" class="img-fluid" style="width: 30%" >
            <!--class img-fluid tạo responsitive hình ảnh thích ứng khung hình-->
            <h3 class="display-3">Xin lỗi... Trang tải đã bị lỗi!Thử lại..</h3>
            <%=exception%>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home </a>
        </div>


    </body>
</html>

<%-- 
    Document   : index
    Created on : Nov 15, 2020, 9:22:26 AM
    Author     : Admin
--%>



<%@page import="jpanblog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jpanblog.entities.Post"%>
<%@page import="jpanblog.dao.PostDao"%>
<%@page import="jpanblog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<% 
     User user=(User)session.getAttribute("currentUser");
    
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
     Post post1 = d.getPostByPostId(1);
     Post post2 = d.getPostByPostId(2);
     Post post3 = d.getPostByPostId(3);
     Post post4 = d.getPostByPostId(4);
     Post post5 = d.getPostByPostId(5);
     Post post6 = d.getPostByPostId(6);
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JPan Blog</title>

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

        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>


        <!--banner-->

        <div class="container-fluid p-0 m-0">
            <!--class container để phân chia với class phía trên (chia để phân bố cho đều)-->
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <!--display-3 là hiện thị kích thước class đó va khung-->
                    <h3 class="display-3">Welcome to JpanBlog </h3> 

                    <p>Chào mừng đến với Jpan Blog - 
                        Blog mở cho người học tiếng Nhật! JpanBlog là một blog cá nhân của mình chia sẻ kiến thức và kinh nghiệm trong việc học tiếng Nhật
                    </p>
                    <p>
                       日本人学習者向けのブログオープン！ JpanBlog は、日本語学習の知識と経験を共有する個人的なブログです。 
                    </p>

                    <button class="btn btn-outline-light btn-lg"> <span class="fa fa fa-user-plus"></span> Xin Chào! </button>
                    <a href="login_page.htm" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span> Login</a>

                </div>
            </div>






        </div>



        <!--//cards-->

        <div class="container">

            <div class="row mb-2">

                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title"><%= post1.getpTitle()%></h5>
                            <p class="card-text"><%= post1.getpContent().substring(0, 100) %> ...</p>
                            <a href="show_blog_page.jsp?post_id=<%= post1.getPid()%>" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title"><%= post2.getpTitle()%></h5>
                            <p class="card-text"><%= post2.getpContent().substring(0, 100) %> ...</p>
                            <a href="show_blog_page.jsp?post_id=<%= post2.getPid()%>" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title"><%= post3.getpTitle()%></h5>
                            <p class="card-text"><%= post3.getpContent().substring(0, 100) %> ...</p>
                            <a href="show_blog_page.jsp?post_id=<%= post3.getPid()%>" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>


            </div>




            <div class="row">

                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title"><%= post5.getpTitle()%></h5>
                            <p class="card-text"><%= post5.getpContent().substring(0, 100) %> ...</p>
                            <a href="show_blog_page.jsp?post_id=<%= post4.getPid()%>" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title"><%= post4.getpTitle()%></h5>
                            <p class="card-text"><%= post4.getpContent().substring(0, 100) %> ...</p>
                            <a href="show_blog_page.jsp?post_id=<%= post5.getPid()%>" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title"><%= post6.getpTitle()%></h5>
                            <p class="card-text"><%= post6.getpContent().substring(0, 100) %> ...</p>
                            <a href="show_blog_page.jsp?post_id=<%= post6.getPid()%>" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>


            </div>

        </div>



        <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>


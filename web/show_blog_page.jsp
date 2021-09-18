<%-- 
    Document   : show_blog_page
    Created on : Nov 15, 2020, 9:56:52 AM
    Author     : Admin
--%>

<%@page import="jpanblog.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jpanblog.entities.Category"%>
<%@page import="jpanblog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="jpanblog.dao.UserDao"%>
<%@page import="jpanblog.entities.Post"%>
<%@page import="jpanblog.dao.PostDao"%>
<%@page import="jpanblog.helper.ConnectionProvider"%>
<%@page import="jpanblog.entities.User"%>
<%@page  errorPage="error_page.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.htm");
    }


%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%> || Học tiếng nhật cùng Minh </title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

            .primary-background{background: blue!important; }

            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;

            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;

            }
            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }

            body{
                background:url(img/bg.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }

        </style>
    </head>
    <body>


        <!--navbar--> 

        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>   JPan Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"> <span class="	fa fa-bell-o"></span> Tiếng nhật cho bạn <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="	fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Từ Vựng</a>
                            <a class="dropdown-item" href="#">Ngữ pháp</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Chia sẽ</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="https://www.facebook.com/NhatMinh7899/"> <span class="	fa fa-address-card-o"></span> Liên hệ</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="	fa fa-asterisk"></span> Viết Post</a>
                    </li>



                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span> <%= user.getName()%> </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus "></span> Đăng xuất</a>
                    </li>
                </ul>
            </div>
        </nav>



        <!--end of navbar-->
         <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div> 

        <%
                session.removeAttribute("msg");
            }
        %>
        <!--main content of body-->


        <div class="container">

            <div class="row my-4">

                <div class="col-md-8 offset-md-2">


                    <div class="card">

                        <div class="card-header primary-background text-white">

                            <h4 class="post-title"><%= p.getpTitle()%></h4>


                        </div>

                        <div class="card-body">

                            <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">


                            <div class="row my-3 row-user">
                                <div class="col-md-8">

                                    <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>

                                    <p class="post-user-info"> <a href="#!"> <%= ud.getUserByUserId(p.getUserId()).getName()%></a> đã đăng : </p>
                                </div>

                                <div class="col-md-4">
                                    <p class="post-date"> <%=  DateFormat.getDateTimeInstance().format(p.getpDate())%>  </p>
                                </div>
                            </div>


                            <p class="post-content"><%= p.getpContent()%></p> 

                            <br>
                            <br>


                        </div>
                        <div class="card-footer primary-background">
                            <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                            %>
                            <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
                            <%
                                if (p.getUserId() == user.getId()) {
                            %>
                            <button type="submit" id="btn_delete" class="btn btn-outline-primary" data-toggle="modal" data-target="#deletemodel" >Xóa</button>
                            <% } %>

                        </div>

                        </div>
                                               
                </div>

            </div>

        </div>



        <!--end of main content  of body-->


        <!--profile modal-->
        <!--deletemodel-->
            <div class="modal fade" id="deletemodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Xóa bài viết</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="deletebtn_mess" action="/DeletePostControll" method="POST">
                            
                            <div class="form-group">
                                <h3>Mã User: </h3>
                                <select class="form-control" name="uid">
                                    <option><%= p.getUserId() %></option>
                                </select>
                                    <%
                                       int uid = p.getUserId();
                                        int pid = p.getPid();
                                      String deleteURL = "DeletePostControll?uid="+uid+"&pid="+pid;
                                    %>
                            </div>
                            <div class="form-group">
                                <h3>Mã Post: </h3>
                                <select class="form-control" name="pid">                                
                                    <option><%= p.getPid() %></option>
                                </select>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary"> Xóa</button>
                            </div>
                        </form>
                      
                     </div>

                </div>
            </div>
        </div>
        
        <!--end delete-->


        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"> JPan Blog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td> <%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Giới tính :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Trạng thái :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Đăng kí :</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Chỉnh sửa thông tin</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><%= user.getEmail()%>" </td>
                                        </tr>
                                        <tr>
                                            <td>Tên :</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Mật khẩu :</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Giới tính :</td>
                                            <td> <%= user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About  :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                                </textarea>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ảnh đại diện:</td>
                                            <td>
                                                <input type="file" name="image" class="form-control" >
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>    

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of profile modal-->

        <!--add post modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Viết lên bài post của bạn.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="Add_Post_Controll" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Chọn chuyên mục---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Hình ảnh</label>
                                <br>
                                <input type="file" name="pic"  >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>


        <!--END add post modal-->







        <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

<!--        <script>
            $(document).ready(function (){
                $('btn_delete').click(function(){
                    $("#deletebtn_mess").show();
                });
            });
        </script>-->
        
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;

                                    $('#edit-profile-button').click(function ()
                                    {

                                        if (editStatus == false)
                                        {
                                            $("#profile-details").hide();

                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else
                                        {
                                            $("#profile-details").show();

                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit")

                                        }


                                    })
                                });

        </script>

        
        <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "Add_Post_Controll",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Lưu thành công! ", "success");
                            } else
                            {
                                swal("Error!!", "Lỗi! Xin kiểm tra lại! ", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Lỗi hệ thống", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
        
        <script>
            $(document).ready(function (e) {
                $("#deletebtn_mess").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "DeletePostControll",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() === 'done')
                            {

                                 swal("Good job!", "Xóa thành công bài viết", "success")
                                        .then((value) => {
                                            window.location = "profile.jsp"
                                        });
                            } else
                            {

                                swal("Error!!", data, "error"); //Hiện thị lỗi khi không dki thành công
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            console.log(data)
                            swal("Error!!", data, "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
    </body>
</html>


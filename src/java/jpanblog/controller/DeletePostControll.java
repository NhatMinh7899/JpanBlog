/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpanblog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jpanblog.dao.PostDao;
import jpanblog.entities.Message;
import jpanblog.entities.User;
import jpanblog.helper.ConnectionProvider;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class DeletePostControll extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            String postId = request.getParameter("pid");
            int UserId = Integer.parseInt(request.getParameter("uid"));
            PostDao pDao = new PostDao(ConnectionProvider.getConnection());
            Message sc = new Message("Delete Successfully", "success", "alert-success");
            Message er = new Message("Xóa thất bại", "error", "alert-danger");
            Message norule = new Message("Bạn không có quyền xóa post này", "error", "alert-danger");
            int pid = Integer.parseInt(postId);
            if(user.getId() == UserId){
                if(pDao.deletePost(pid)){
                    out.println("done");
//                    session.setAttribute("msg", sc);
//                    response.sendRedirect("profile.jsp");
                } else {
                    out.println("error");
//                    session.setAttribute("msg", er);
                }
            } else {
                out.println("No, bạn không có quyền");
//                session.setAttribute("msg", norule);
            }
       
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

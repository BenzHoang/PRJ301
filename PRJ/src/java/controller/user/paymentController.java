/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import dao.CustomerDAO;
import dao.OrdersDAO;
import dto.Account;
import dto.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
public class paymentController extends HttpServlet {

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
 /*
            1. lay Accid cua user login            
            2. insert 1 row vao bang order
            3. lay orderid vua chen o buoc 2
            4. insert cac item trong gio hang vao bang order detail
            5. xoa giohang trong session
            6. chuyen sang trang index.jsp 
            
             */
            CustomerDAO Cusdao = new CustomerDAO();
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("Account");
            if (acc != null && acc.getType() == 1) {
                request.setAttribute("ERROR", "Cannot order with accout Staff");
                request.getRequestDispatcher("MainController?action=viewCart").forward(request, response);
            }
            if (acc != null) {
                int accid = acc.getAccountID();
                int cusid = Cusdao.getCustomerByAccId(accid).getCustomerID();
                HashMap<Integer, Integer> giohang = (HashMap<Integer, Integer>) session.getAttribute("cart");
                int totalProduct = 0;
                for (int quantity : giohang.values()) {
                    totalProduct += quantity;
                }
                OrdersDAO d = new OrdersDAO();
                String dateRequired = request.getParameter("dateRequired");
                String dateShip = request.getParameter("dateShip");
                String addressShip = request.getParameter("addressShip");

                Orders newOrder = new Orders().builder()
                        .customerID(cusid)
                        .requiredDate(dateRequired)
                        .shippedDate(dateShip)
                        .totalProducts(totalProduct)
                        .shipAddress(addressShip).build();

                int result = d.insertOrder(newOrder, giohang);
                if (result > 0) {
                    session.removeAttribute("cart");
                    session.removeAttribute("cartSize");
                    request.setAttribute("nofication", "Order successfully! Thank you for your order!");
                    request.getRequestDispatcher("MainController?action=homePage").forward(request, response);
                } else {
                    request.setAttribute("ERROR", "PAYMENT FAIL");
                    request.getRequestDispatcher("MainController?action=viewCart").forward(request, response);
                }

            } else {
                request.setAttribute("ERROR", "You need to login before ORDER");
                request.getRequestDispatcher("MainController?action=viewCart").forward(request, response);
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

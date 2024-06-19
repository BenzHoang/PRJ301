/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Acer
 */
@MultipartConfig
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "loginPage.jsp";
    private static final String REGIS_PAGE = "register.jsp";
    private static final String HOME_PAGE = "homePage.jsp";
    private static final String DASHBOARD_DETAILS = "admin/dashboardOrderDetail.jsp";
    private static final String DASHBOARD = "admin/dashboard.jsp";
    private static final String CUSTOMER_PAGE = "admin/customersPage.jsp";
    private static final String CUSTOMERINFOR_PAGE = "admin/customersInforPage.jsp";
    private static final String REPORT_PAGE = "admin/reportStatistics.jsp";
    private static final String PRODUCT_PAGE = "admin/productPage.jsp";
    private static final String PROFILE_PAGE = "profilePage.jsp";
    private static final String ACCOUNT_PAGE = "accountPage.jsp";
    private static final String HISTORY_PAGE = "historyPage.jsp";
    private static final String HISTORYDETAIL_PAGE = "historyDetailPage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String url = LOGIN_PAGE;
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action") == null ? "listProducts" : request.getParameter("action");
            switch (action) {
                case "login":
                    url = "loginController";
                    break;
                case "loginPage":
                    url = LOGIN_PAGE;
                    break;
                case "RegisPage":
                    url = REGIS_PAGE;
                    break;
                case "register":
                    url = "registerController";
                    break;
                case "logout":
                    url = "logoutController";
                    break;
                case "pageAdmin":
                    url = "dashboardAdminController";
                    break;
                case "listProducts":
                    url = "listProductsController";
                    break;
                case "homePage":
                    url = HOME_PAGE;
                    break;
                case "viewOrderDetail":
                    url = "viewOrderDetailController";
                    break;
                case "detailsDashboard":
                    url = DASHBOARD_DETAILS;
                    break;
                case "viewOrder":
                    url = DASHBOARD;
                    break;
                case "listCustomer":
                    url = "listCustomerController";
                    break;
                case "deleteAccount":
                    url = "deleteAccountController";
                    break;
                case "pageCustomer":
                    url = CUSTOMER_PAGE;
                    break;
                case "viewInforAccount":
                    url = "viewInforAccountController";
                    break;
                case "InforAccountPage":
                    url = CUSTOMERINFOR_PAGE;
                    break;
                case "updateCustomer":
                    url = "updateCustomerController";
                    break;
                case "listProductAdmin":
                    url = "listProductAdminController";
                    break;
                case "productPage":
                    url = PRODUCT_PAGE;
                    break;
                case "deleteOrderDetail":
                    url = "deleteOrderDetailController";
                    break;
                case "viewCart": {
                    url = "ViewCart.jsp";
                    break;
                }
                case "addToCart": {
                    url = "addProductToCartController";
                    break;
                }
                case "removeProductInCart":
                    url = "removeProductInCartController";
                    break;
                case "updateQuantityCart":
                    url = "updateQuantityProductInCartController";
                    break;
                case "payment":
                    url = "paymentController";
                    break;
                case "profilePage":
                    url = PROFILE_PAGE;
                    break;
                case "accountPage":
                    url = ACCOUNT_PAGE;
                    break;
                case "updateAccout":
                    url = "updateAccountController";
                    break;
                case "changeStatus":
                    url = "changeStatusController";
                    break;
                case "CancelOrder":
                    url = "CancelOrderController";
                    break;
                case "viewHistory":
                    url = "viewHistoryController";
                    break;
                case "historyPage":
                    url = HISTORY_PAGE;
                    break;
                case "CancelOrderUser":
                    url = "cancelStatusController";
                    break;
                case "viewHistoryDetail":
                    url = "detailUserController";
                    break;
                case "historyDetailPage":
                    url = HISTORYDETAIL_PAGE;
                    break;
                case "updateOrderDetailUser":
                    url = "updateOrderDetailUserController";
                    break;
                case "deleteOrderDetailUser":
                    url = "deleteOrderDetailUserController";
                    break;
                case "reportStatistics":
                    url = REPORT_PAGE;
                    break;
                case "loadReportStatis":
                    url = "loadReportStatisController";
                    break;
                case "addProduct": {
                    url = "createProductController";
                    break;
                }
                case "removeProduct": {
                    url = "removeProductsController";
                    break;
                }
                case "editProduct": {
                    url = "updateProductController";
                    break;
                }
                case "searchProduct": {
                    url = "searchProductsController";
                    break;
                }
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher(url).forward(request, response);
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

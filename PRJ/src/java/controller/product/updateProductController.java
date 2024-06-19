/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.product;

import controller.Service.Used;
import dao.productDAO;
import dto.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Admins
 */
@MultipartConfig
public class updateProductController extends HttpServlet {

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
            productDAO PDAO = new productDAO();
            int productID = Integer.parseInt(request.getParameter("productID"));
            String productName = request.getParameter("name");
            int supplierID = Integer.parseInt(request.getParameter("supplier"));
            int categoryID = Integer.parseInt(request.getParameter("category"));
            double unitPrice = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            //xu ly hinh anh
            String uploadDirectory = getServletContext().getRealPath("");
            String saveDirectory = uploadDirectory.replace("\\build\\web\\", "\\web\\");
            Part filePart = request.getPart("image");
            Product product = PDAO.getProduct(productID);
            String oldIMGpath = product.getProductImage();
            if (!filePart.getSubmittedFileName().isEmpty()) {
                String imagePathSave = Used.uploadIMAGE(filePart, saveDirectory, "IMG", uploadDirectory);
                if(!oldIMGpath.isEmpty()){
                     boolean check = Used.deleteExistImage(saveDirectory +  oldIMGpath );
                }
                if (imagePathSave != null) {
                    if (PDAO.updateProduct(productName, supplierID, categoryID, unitPrice, imagePathSave, description, productID) > 0) {
                        response.sendRedirect("MainController?action=listProductAdmin");
                    } else {
                        sendError(request, response, "Cannot update product!!","listProductAdmin");
                    }
                } else {
                    sendError(request, response, "Something wrong with product image","listProductAdmin");
                }
            } else {
                if (PDAO.updateProduct(productName, supplierID, categoryID,  unitPrice, oldIMGpath, description, productID) > 0) {
                    response.sendRedirect("MainController?action=listProductAdmin");
                } else {
                    sendError(request, response, "Cannot update product!!","listProductAdmin");
                }
            }
        }
    }
   private void sendError(HttpServletRequest request, HttpServletResponse response, String errorMessage, String path) {
        try {
            request.setAttribute("nofication", errorMessage);
            request.getRequestDispatcher("MainController?action="+path).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
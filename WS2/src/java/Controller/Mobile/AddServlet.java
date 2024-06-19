package Controller.Mobile;

import Dao.MobileDAO;
import Model.Mobile;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddServlet", urlPatterns = {"/add"})
public class AddServlet extends HttpServlet {

    private final String displayMessPage = "DisplayMessage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String mobileID, description, mobileName, producerName;
        int yearOfProduction, quantity;
        boolean notSale = true;
        float price;

        String message = "Something went wrong";
        String url = displayMessPage;
        try {
            mobileID = request.getParameter("txtMobiID");
            description = request.getParameter("txtDes");
            price = Float.parseFloat(request.getParameter("txtPrice"));
            mobileName = request.getParameter("txtName");
            producerName = request.getParameter("txtProName");
            yearOfProduction = Integer.parseInt(request.getParameter("txtYear"));
            quantity = Integer.parseInt(request.getParameter("txtQuan"));
            String sale = request.getParameter("chkIsSaled");
            if (sale == null) {
                notSale = false;
            }
            if (!mobileID.isEmpty()) {
                Mobile mobile = new Mobile(mobileID, description, price, mobileName, producerName, yearOfProduction, quantity, notSale);
                MobileDAO mobileDao = new MobileDAO();
                if (mobileDao.addMobile(mobile) == true) {
                    message = "The mobile '" + mobileID + "' has been added successfully";
                }
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        request.setAttribute("action", "Add a new mobile");
        request.setAttribute("page", "list");
        request.setAttribute("message", message);
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
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

package Controller.Cart;

import Model.CartItem;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "UpdateCartController", urlPatterns = {"/updatecart"})
public class UpdateCartController extends HttpServlet {

    private final String cartController = "cart";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = cartController;
        String message, itemId;
        int newQuantity;
        CartItem item = null;
        HashMap<String, CartItem> cart = null;
        try {
            itemId = request.getParameter("Id");
            newQuantity = Integer.parseInt(request.getParameter("quantity"));
            if (itemId != null) {
                HttpSession sessionCart = request.getSession();
                cart = (HashMap<String, CartItem>) sessionCart.getAttribute("Cart");
                item = cart.get(itemId);
                item.setQuantity(newQuantity);
                message = "Your cart has updated succesfully.";
                request.setAttribute("Message", "<h4>" + message + "</h4>");
                url = cartController + "?action=View";
            }
        } catch (Exception ex) {
            log("UpdateCartController has error: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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

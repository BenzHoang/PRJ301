package Controller.Cart;

import Model.CartItem;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SaveCartController", urlPatterns = {"/savecart"})
public class SaveCartController extends HttpServlet {

    private final String cartController = "cart";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = null;
        String message = null;
        HashMap<String, CartItem> itemInCart = null;
        try {
            HttpSession shoppingCart = request.getSession();
            itemInCart = (HashMap<String, CartItem>) shoppingCart.getAttribute("Cart");
            CartUtil cart = new CartUtil();
            if (itemInCart != null) {
                String strItemsInCart = cart.convertCartToString(new ArrayList <CartItem>(itemInCart.values()));
                cart.saveCartToCookie(request, response, strItemsInCart);
                message = "Your cart has been saved successfully.";
            } else {
                message = "Your cart is empty.";
            }
            url = cartController + "?action=View";
        } catch (Exception ex) {
            log("SaveCartController has error: " + ex.getMessage());
        } finally {
             request.setAttribute("Message", "<h4>" + message + "</h4>");
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

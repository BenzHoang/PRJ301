package Controller.Cart;

import Dao.MobileDAO;
import Model.CartItem;
import Model.Mobile;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "AddCartController", urlPatterns = {"/addcart"})
public class AddCartController extends HttpServlet {

    private final String addCartpage = "process";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = null;
        String message, bookId;
        Mobile selectMobile = null;
        CartItem item = null;
        HashMap<String, CartItem> itemsInCart = null;
        try {
            MobileDAO bookDAO = new MobileDAO();
            HttpSession shoppingCart = request.getSession();
            itemsInCart = (HashMap<String, CartItem>) shoppingCart.getAttribute("Cart");
            bookId = request.getParameter("id");
            selectMobile = bookDAO.getMobileByID(bookId);
            if (itemsInCart == null) {
                itemsInCart = new HashMap<String, CartItem>();
                shoppingCart.setAttribute("Cart", itemsInCart);
            }
            item = itemsInCart.get(selectMobile.getMobileID());
            if (item == null) {
                item = new CartItem(selectMobile.getMobileID(), selectMobile.getMobileName(), 1, selectMobile.getPrice());
                itemsInCart.put(item.getItemId(), item);
                message = "The book " + item.getItemName() + " has been added to cart successfully.";
            }else{
                item.setQuantity(item.getQuantity() + 1);
                message = "The cart has been updated successfully.";
            }
            url = addCartpage + "?action=ViewMobileList";
            request.setAttribute("Message", "<h4>" + message + "</h4>");
        } catch (Exception ex) {
            log("Hasing error in AddCartMobileController: " + ex.getMessage());
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

package Controller.User;

import Model.User;
import Model.UserDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddUserServlet", urlPatterns = {"/adduser"})
public class AddUserServlet extends HttpServlet {

    private final String displaymessage = "DisplayMessage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String userName, password, lastName, admin;
        boolean isAdmin = true;
        String message = "Something went wrong";
        String url = displaymessage;
        try {
            userName = request.getParameter("txtUser");
            password = request.getParameter("txtPass");
            lastName = request.getParameter("txtLastName");
            admin = request.getParameter("chkIsAdmin");
            if (admin == null) {
                isAdmin = false;
            }
            if (!userName.isEmpty()) {
                User user = new User(userName, password, lastName, isAdmin);
                UserDAO userDao = new UserDAO();
                if (userDao.addUser(user) == true) {
                    message = "The user '" + userName + "' has been added successfully";
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            request.setAttribute("action", "Add new user's website");
            request.setAttribute("page", "Login.jsp");
            request.setAttribute("message", message);
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

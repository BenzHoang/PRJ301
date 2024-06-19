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

@WebServlet(name = "MobileIDServlet", urlPatterns = {"/mobileid"})
public class MobileIDServlet extends HttpServlet {

    private final String detailPage = "Details.jsp";
    private final String updatePage = "Update.jsp";
    private final String deletePage = "Delete.jsp";
    private final String displayMesPage = "DisplayMessage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = displayMesPage, actionurl, mobileID;
        String message = "Something went wrong";
        try {
            mobileID = request.getParameter("id");
            actionurl = request.getParameter("action");
            MobileDAO mobileDao = new MobileDAO();
            Mobile mobile = mobileDao.getMobileByID(mobileID);
            if (mobile != null) {
                request.setAttribute("data", mobile);
                switch (actionurl) {
                    case "update":
                        url = updatePage;
                        break;
                    case "view":
                        url = detailPage;
                        break;
                    case "delete":
                        url = deletePage;
                        break;
                }
            } else {
                message = "The mobile '" + mobileID + "' not found";
                request.setAttribute("action", "Mobile Details");
                request.setAttribute("page", "list");
                request.setAttribute("message", message);
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
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

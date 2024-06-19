/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Car;

import Model.Car;
import Model.CarDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CarIDServlet", urlPatterns = {"/carid"})
public class CarIDServlet extends HttpServlet {

    private final String detailPage = "Details.jsp";
    private final String updatePage = "Update.jsp";
    private final String deletePage = "Delete.jsp";
    private final String displayMessagePage = "DisplayMessage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int carID;
        String url = displayMessagePage;
        String actionurl = request.getParameter("action");
        String message = "Something went wrong";
        CarDAO carDao = new CarDAO();
        try {
            carID = Integer.parseInt(request.getParameter("id"));
            if (carID != 0) {
                Car car = carDao.getCarById(carID);
                if (car != null) {
                    request.setAttribute("data", car);
                    switch (actionurl) {
                        case "view":
                            url = detailPage;                         
                            break;
                        case "update":
                            url = updatePage;
                            break;
                        case "delete":
                            url = deletePage;
                            break;
                    }
                }
            } else {
                message = "The car '" + carID + "' not found";
                request.setAttribute("action", "Car Details");
                request.setAttribute("page", "ViewCarController");
                request.setAttribute("message", message);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
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

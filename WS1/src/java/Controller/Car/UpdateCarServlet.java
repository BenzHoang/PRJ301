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

@WebServlet(name = "UpdateServlet", urlPatterns = {"/update"})
public class UpdateCarServlet extends HttpServlet {

    private final String displayMessagePage = "DisplayMessage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int carID;
        String carName, manufacturer;
        double price;
        int releasedYear;

        String message = "Something went wrong";
        String url = displayMessagePage;
        try {
            carID = Integer.parseInt(request.getParameter("txtID"));
            carName = request.getParameter("txtName");
            manufacturer = request.getParameter("txtManu");
            price = Double.parseDouble(request.getParameter("txtPrice"));
            releasedYear = Integer.parseInt(request.getParameter("txtYear"));
            if (carID != 0) {
                Car car = new Car(carID, carName, manufacturer, price, releasedYear);
                CarDAO carDao = new CarDAO();
                if (carDao.updateACar(car) == true) {
                    message = "The car '" + carID + "' has been updated successfully";
                }
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            request.setAttribute("action", "Update a car's info");
            request.setAttribute("page", "list");
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

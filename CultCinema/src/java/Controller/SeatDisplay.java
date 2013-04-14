/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Booking;
import Bean.Section;
import Bean.Venue;
import DAO.BookingDAO;
import DAO.SectionDAO;
import DAO.VenueDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 52165627
 */
public class SeatDisplay extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            doPost(request,response);
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String sectionSelect = request.getParameter("sectionSelect");
            Section selectSection = new Section();
            selectSection.setSectionID(Integer.parseInt(sectionSelect));
            Venue selectVenue=new Venue();
            SectionDAO secDAO=new SectionDAO();
            
            
            selectVenue.setVenueID(secDAO.getSectionVenue(selectSection));
            
            
            VenueDAO vdao=new VenueDAO();
     
            vdao.setVenueObj(selectVenue);
            BookingDAO bkDAO=new BookingDAO();
            List<Booking> lsBooking = null;
            
            lsBooking=bkDAO.getBookingList(selectSection);
         
            request.setAttribute("lsBooking", lsBooking);
            request.setAttribute("selectVenue", selectVenue);
            request.setAttribute("selectSection", selectSection);
            
            request.getRequestDispatcher("seat.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SeatDisplay.class.getName()).log(Level.SEVERE, null, ex);
        }
        
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

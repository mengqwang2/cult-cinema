/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Booking;
import Bean.Movie;
import Bean.Section;
import Bean.Venue;
import DAO.MovieDAO;
import DAO.SectionDAO;
import DAO.VenueDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mengqwang
 */
public class PurchaseControl extends HttpServlet {

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
        doGet(request,response);
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
        try {
            Integer seatNo = Integer.parseInt(request.getParameter("count"));
            Integer sectionID=Integer.parseInt(request.getParameter("sectionID"));
            Section selectSection=new Section();
            SectionDAO sdao=new SectionDAO();
            sdao.getSection(sectionID, selectSection);
            Booking bkInfo=new Booking();
            bkInfo.setSeat(seatNo);
            bkInfo.setSectionID(selectSection.getSectionID());
            MovieDAO mvdao=new MovieDAO();
            Movie mvInfo=mvdao.getMovieInfo(selectSection.getMovieID());
            Venue vInfo=new Venue();
            vInfo.setVenueID(selectSection.getVenueID());
            VenueDAO vdao=new VenueDAO();
            vdao.setVenueObj(vInfo);
            
            request.setAttribute("bookingInfo", bkInfo);
            request.setAttribute("movieInfo", mvInfo);
            request.setAttribute("sectionInfo", selectSection);
            request.setAttribute("venueInfo", vInfo);
            request.getRequestDispatcher("purchase.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PurchaseControl.class.getName()).log(Level.SEVERE, null, ex);
        }

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

        doGet(request, response);
        
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
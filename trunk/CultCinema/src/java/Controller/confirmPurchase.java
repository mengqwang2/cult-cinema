/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Booking;
import Bean.Member;
import DAO.BookingDAO;
import DAO.MemberDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mengqwang
 */
public class confirmPurchase extends HttpServlet {

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
       doPost(request, response);
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
        doPost(request, response);
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
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session=request.getSession();
            int memberID=(Integer)session.getAttribute("memberID");
            int sectionID=Integer.parseInt(request.getParameter("sectionID"));
            int loyaltyUse=Integer.parseInt(request.getParameter("loyaltyUse"));
            int loyaltyAdd=Integer.parseInt(request.getParameter("loyaltyAdd"));
            int payment=Integer.parseInt(request.getParameter("payment"));
            String seatNo=request.getParameter("seatNo");
            int nSeats=0;
            String[] indiSeats=seatNo.split(",");
            nSeats=indiSeats.length;
            int[] seatArr;
            seatArr=new int[nSeats];
            for(int i=0;i<nSeats;i++)
            {
                seatArr[i]=Integer.parseInt(indiSeats[i]);
            }
            List<Booking> bkInfo=new ArrayList<Booking>();
            for(int i=0;i<nSeats;i++)
            {
                Booking indibk=new Booking();
                indibk.setSeat(seatArr[i]);
                indibk.setSectionID(sectionID);
                indibk.setMemberID(memberID);
                indibk.setStatus("RP");
                indibk.setPayment(payment);
                bkInfo.add(indibk);
            }
            //update booking info
            for(Booking bk:bkInfo)
            {
                BookingDAO bkdao=new BookingDAO();
                bkdao.addBkRecord(bk);
            }
            
            //update user loyalty
            Member m=new Member();
            m.setMemberID(memberID);
            MemberDAO mdao=new MemberDAO();
            mdao.getMember(m);
            mdao.setMember(m,m.getPassword(),m.getName(),m.getAddress(),m.getTel(),m.getGender(),m.getMail(),m.getLoyalty()-loyaltyUse+loyaltyAdd);
            
            
        } finally {            
            out.close();
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

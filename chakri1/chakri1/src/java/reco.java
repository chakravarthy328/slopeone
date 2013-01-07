/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import com.sun.corba.se.impl.naming.cosnaming.InterOperableNamingImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CHAKRI
 */
@WebServlet(name = "reco", urlPatterns = {"/reco"})
public class reco extends HttpServlet {
    Connection con;
    Statement st;
    int uni = 3;
    ResultSet rs,rs1;    
    int max=0;
//    int dbmat[][];            
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
        
        String s1,s2;
        response.setContentType("text/html;charset=UTF-8");        
        PrintWriter out = response.getWriter();                
        ArrayList<String> recos = new ArrayList<String>();
        ArrayList<String> recos1 = new ArrayList<String>();
        
        ArrayList<Float> arr1 = new ArrayList<Float>();
        float cc = 0;
        for(int in = 0;in < uni; in++){
            cc = Float.parseFloat(request.getParameter("rating"+(in+1)));
            arr1.add(cc);
        }
                
        s1 = request.getParameter("speed");        
      // ******* Get max rating and their corresponding categories *******
        

        /* Get reco from max value */                      
        
        try {
            HttpSession session = request.getSession();
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/chakri1", "chakri", "chakri");
            st = con.createStatement();            
            ArrayList<String> users = new ArrayList<String>();
            
            String x = "select * from slopeone";
            int rowcount = 0;
            rs1 = st.executeQuery(x);            
            while(rs1.next()){                                
                rowcount++;
            }                        
            
            int dbmax[][] = new int[rowcount][8];
            float xx[] = new float[uni];
            float avmat[][] = new float[uni][rowcount-uni];
            float predictions[] = new float[rowcount-uni];
            float predictions1[] = new float[rowcount-uni];
            
            
            // ******* create array matrix from existing database *******
            
            for(int n=1;n<9;n++){
            users.add("user"+n);
            }
            
            int i = 0; 
            int u = 0;
            Iterator ite = users.iterator();
            
            while(u<8){
            
            String x1 = "select " + users.get(u) + " from slopeone";
            String us = "";
            String us1 = "";
            rs = st.executeQuery(x1);            
            
            int ix = 0;
            while(rs.next()){                                
                us = users.get(u);
                us1 = rs.getString(us);
                Integer t1 = Integer.parseInt(us1);
                dbmax[ix][u] = t1;                        
                ix++;
            }
            u++;
        }
            
            // ******* create a matrix with average of differences and add them to the ratings of new user *******
         for(int k=3;k<rowcount;k++)  {
                                    
            ArrayList<Float> arf1 = new ArrayList<Float>();
        
        
            for (int n=0;n<8;n++){
            
            for(int in = 0; in < uni ; in++)    {
            xx[in] = xx[in] + (dbmax[in][n] - dbmax [k][n]);                                    
            }
            }        
            
            for(int in = 0; in < uni ; in++)    {
            arf1.add(in, xx[in]/8);            
            xx[in] = 0;
            }
            for(int in = 0; in < uni ; in++)    {            
            avmat[in][k-uni] = arf1.get(in) + arr1.get(in);             
            }
         }
            
         // ******* Predict the rating of new user from the average matrix *******
         
         for(int i1 = 0; i1 < rowcount-uni; i1++){
             int in = 0;
             float x3 = 0;
             while(in < uni){
                 x3 = x3 + avmat[in][i1];
                 in++;
            }
             predictions[i1] = x3/uni;             
             predictions1[i1] = x3/uni;             
         }
            
         // Get the highest values of predicted ratings by sorting into ne array  
         
            Arrays.sort(predictions1);
            
            ArrayList<Integer> inds = new ArrayList<Integer>();
            int len = predictions.length;
            for(int in = len - 1; in >= 0; in --){
                int test = 0;
            for(int ka = 0; ka < len; ka ++){            
                if(predictions1[in] == predictions[ka]){                   
                    int aa = 0;
                            inds.add(ka);
                            test = 1;
                                                                   
                    if(test==1){
                        break;
                    }
            
                }
            }
            }

           // ******* get the top rated laptops from database *******
            
            String o = "";
           int ax = inds.size();
           if(s1 == null)    {
           o = "select * from slopeone where id = " ;    
           for (int in = 0; in < ax; in ++){    
           if(in == ax-1){
           o = o + inds.get(in) ;
           }else{
           o = o + inds.get(in) + " or id = ";
           }
           }
           
        }
           else{
           o = "select * from slopeone where (id = " ;        
           for (int in = 0; in < ax; in ++){    
           if(in == ax-1){
           o = o + inds.get(in) + ") and speed = '" + s1 + "'"; ;
           }else{
           o = o + inds.get(in) + " or id = ";
           }
           }                  
           }
             rs1 = st.executeQuery(o);  
             
             // ******* transfer to ui *******
             
             while(rs1.next()){
             recos.add(rs1.getString("model"));
             recos1.add(rs1.getString("speed"));
                     }
            request.setAttribute("recos",recos);
            request.setAttribute("speed",recos1);
         
            RequestDispatcher dispatcher = request.getRequestDispatcher("out.jsp");
            dispatcher.forward(request, response);
                                        
        }
        catch(Exception e){out.println(e);}
        finally {            
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
        processRequest(request, response);
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



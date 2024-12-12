package com.activity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.Dbconn;

/**
 * Servlet implementation class registerpage
 */
@WebServlet("/registerpage")
public class registerpage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerpage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		String role=request.getParameter("role");
		String fullname = request.getParameter("uname");
        String mobileno = request.getParameter("mobileno");
        String emailid = request.getParameter("email");
        String dob = request.getParameter("dob");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
       
        int flag = 0;
        try {
            Connection conn = Dbconn.conn();
            Statement st = conn.createStatement();
            Statement st1 = conn.createStatement();
            if (flag == 0) {
                int t = 0;
                 
                ResultSet rs = st1.executeQuery("select * from tblregister where Email_Id='" + emailid + "' or Mobile='" + mobileno + "'");
                if (rs.next()) {
                    t = 1;
                    if(rs.getString("Email_Id").toString().contains(emailid))
                    {
                    	pw.println("<script> alert('Allready Exist Email');</script>");
                    }
                    else if(rs.getString("Mobile").toString().contains(mobileno))
                    {
                    	pw.println("<script> alert('Allready Exist Mobile Number');</script>");
                    }
                    
                    RequestDispatcher rd = request.getRequestDispatcher("/RegisterPage.jsp");
					rd.include(request, response);
                } else {
                    t = 0;
                }
                if (t == 0) {
                	if(role.contains("User"))
                	{
                		 st.executeUpdate("insert into tblregister(Full_Name,Email_Id,Address,Mobile,Gender,DOB,Password) values('" + fullname + "','" + emailid + "','" + address + "','" + mobileno + "','" + gender + "','" + dob + "','" + password + "')");
                         
                	}
                	else if(role.contains("Hospital"))
                	{
                		st.executeUpdate("insert into tblhospitalregister(Full_Name,Email_Id,Address,Mobile,Gender,DOB,Password) values('" + fullname + "','" + emailid + "','" + address + "','" + mobileno + "','" + gender + "','" + dob + "','" + password + "')");
                        	
                	}
                	
                     pw.println("<script> alert(' Registerd Successfully');</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("/LoginPage.jsp");
					rd.include(request, response);
                }
                
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
	}

}

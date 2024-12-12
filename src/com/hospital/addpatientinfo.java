package com.hospital;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Blockchain.ptop;

import com.connection.Dbconn;

/**
 * Servlet implementation class addpatientinfo
 */
@WebServlet("/addpatientinfo")
public class addpatientinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addpatientinfo() {
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
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(true);
		String hospitalname = (String) session.getAttribute("H_Full_Name");
		String hospitalemail = (String) session.getAttribute("H_Email_Id");
		String id = request.getParameter("id");
		
		String systolic_bp = request.getParameter("systolic_bp");
		String diastolic_bp = request.getParameter("diastolic_bp");
		
		
		String heart_rate = request.getParameter("heart_rate");
		String QT_interval = request.getParameter("QT_interval");
		
		
		String PR_interval = request.getParameter("PR_interval");
		String oxy_saturation = request.getParameter("oxy_saturation");
		
		
		String temperature = request.getParameter("temperature");
		

		int flag = 0;
		try {
			Connection conn = Dbconn.conn();
			Statement st = conn.createStatement();

			st.executeUpdate("insert into sensor_data(systolic_bp,diastolic_bp,heart_rate,QT_interval,PR_interval,oxy_saturation,temp_sensor,pid) values('"
					+ systolic_bp
					+ "','"
					+ diastolic_bp
					+ "','"
					+ heart_rate
					+ "','"
					+ QT_interval
					+ "','"
					+ PR_interval + "','"+oxy_saturation+"','"+temperature+"','"+id+"')");
			int noofnode=4;
			String data=id+"#"+systolic_bp+"#"+diastolic_bp+"#"+heart_rate+"#"+QT_interval+"#"+PR_interval+"#"+oxy_saturation+"#"+temperature;
		ptop.ptopverify(noofnode,data);
			
			pw.println("<script> alert(' Add Patient Successfully');</script>");
			RequestDispatcher rd = request
					.getRequestDispatcher("/HospitalHomePage.jsp");
			rd.include(request, response);

		} catch (Exception ex) {
			System.out.println(ex);
		}
	}

}

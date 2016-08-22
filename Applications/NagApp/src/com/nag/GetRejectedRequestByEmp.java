package com.nag;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nag.bean.EmployeeDetails;
import com.nag.bean.TravelRequestMaster;
import com.nag.dao.DataBaseConnection;

/**
 * Servlet implementation class GetRejectedRequestByEmp
 */
@WebServlet("/GetRejectedReqByEmp")
public class GetRejectedRequestByEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRejectedRequestByEmp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("begin - get aprroved req servlet");
		DataBaseConnection dbHandler = new DataBaseConnection();		
		HttpSession session = request.getSession();	
		RequestDispatcher rd;
		
		EmployeeDetails empDetails = (EmployeeDetails)session.getAttribute("loginUserDetails");
		String empDetailsId = empDetails.getEmployeeDetailsId();
		Map <String, TravelRequestMaster> rejectedRequestByEmpMap = dbHandler.getRejectedRequestByEmployee(empDetailsId);
		System.out.println("approved requests by employee servelt:::"+rejectedRequestByEmpMap.size());
		rd = request.getRequestDispatcher("DisplayRejectedRequestByEmp.jsp");		
		request.setAttribute("rejectedRequestByEmpMap", rejectedRequestByEmpMap);
		rd.forward(request,response);
	}

}
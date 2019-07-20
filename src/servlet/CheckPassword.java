package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserLoginDAO;
import net.sf.json.JSONObject;

public class CheckPassword extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
		 * Constructor of the object.
		 */
	public CheckPassword() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.doPost(request, response);
		
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String occupation=request.getParameter("occupation");
		String username=request.getParameter("username");
		String inputPassword=request.getParameter("password");
		String password=null;
		HttpSession session=request.getSession();
		UserLoginDAO u=new UserLoginDAO();
		JSONObject result=new JSONObject();
		password=u.checkPass(username,occupation);
		
		if(inputPassword.equals(password)){
			result.put("error", false);
			session.setAttribute("username",username);
			String remember=request.getParameter("remember");
		//	System.out.println(remember);
			if(remember!=null){
					Cookie cookie=new Cookie("autologin",username+"-"+password);
					cookie.setMaxAge(Integer.parseInt(remember));
					cookie.setPath(request.getContextPath());
					response.addCookie(cookie);
			}
		}else{
			result.put("error", true);
		}
//		result.put("name", "zhangsan");
		out.print(result);
		out.flush();
		out.close();
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}

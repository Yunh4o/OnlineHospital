package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class DoUserNameFilter
 */
public class DoUserNameFilter implements Filter {

    /**
     * Default constructor. 
     */
    public DoUserNameFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest) servletRequest;
		HttpSession session=request.getSession();
		Object o=session.getAttribute("username");
		String path=request.getServletPath();//获取请求路径
		System.out.println(o);
		System.out.println(path);
		if(path.contains(".jpg")||path.contains(".png")||path.contains(".css")||path.contains(".js")){
			filterChain.doFilter(servletRequest, servletResponse);
		}else if(o==null&&path.indexOf("index/CheckNameServlet/CheckPassword")<0){//请求路径不包括登录的界面
			request.getRequestDispatcher("index.jsp").forward(servletRequest, servletResponse);//防止再次请求
		}else{
			filterChain.doFilter(servletRequest, servletResponse);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	
}
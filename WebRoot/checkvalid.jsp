<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

		Cookie[] cookies=request.getCookies();
		String autologin=null;
		if (cookies !=null) {
			for (int i = 0; i<cookies.length; i++) {
			    if ("autologin".equals(cookies[i].getName())) {
			        autologin=cookies[i].getValue();
			        break;
			    }
			}   
		}
		if (autologin!=null) {
		    String[] parts=autologin.split("-");
		    String name=parts[0];
		    String pwd=parts[1];
		    session.setAttribute("username", name);
		}
		
%>
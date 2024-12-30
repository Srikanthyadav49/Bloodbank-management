<%
String Username=request.getParameter("username");
String Password=request.getParameter("password");
if("admin".equals(Username) && "admin".equals(Password)) {
	response.sendRedirect("home.jsp");
	}
else{
	response.sendRedirect("adminLogin.jsp?msg=invalid");
	}
%>
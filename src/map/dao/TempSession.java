package map.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class TempSession {
	public static HttpSession getAdminSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
        session.setAttribute("type", "admin");
        session.setAttribute("isAdmin", true);
        return session;
	}
	
	public static HttpSession getMemberSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
        session.setAttribute("type", "member");
        session.setAttribute("isAdmin", false);
        return session;
	}
}

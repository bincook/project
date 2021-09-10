package sign;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class sign {

    String user_id = "ysj";
    String user_pwd = "1234";
    String host = "26.168.126.112";
    String port = "3306";
    String database = "test";
    Connection conn;

    public int userid_check(HttpServletRequest request) throws Exception {
        return 0;
    }

    public void insert_user_info(signDto signD) throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://" + host + ":" + port + "/" + database;
        conn = DriverManager.getConnection(url, user_id, user_pwd);

        String sql = "insert into member (email, password) values (?, ?)";
        PreparedStatement p1 = conn.prepareStatement(sql);
        p1.setString(1, signD.getEmail());
        p1.setString(2, signD.getPassword());
        p1.executeUpdate();
        p1.close();
        conn.close();
    }

    public void member_login_ok(signDto signD, HttpSession session, HttpServletResponse response) throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://" + host + ":" + port + "/" + database;
        conn = DriverManager.getConnection(url, user_id, user_pwd);

        String sql = "select * from member where email = ? and password = ?";

        PreparedStatement p1 = conn.prepareStatement(sql);
        p1.setString(1, signD.getEmail());
        p1.setString(2, signD.getPassword());
        ResultSet rs = p1.executeQuery();
        if (rs.next()) {
            session.setAttribute("email", rs.getString("email"));

            response.sendRedirect("sign-in.jsp");
        } else {
            response.sendRedirect("sign-in.jsp");
        }
    }
}

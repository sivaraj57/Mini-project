

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String username = request.getParameter("txtName");
        String password = request.getParameter("pswd");
        String email = request.getParameter("email");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "alekhya2116");

            PreparedStatement ps = con.prepareStatement("INSERT INTO login (name, email, password) VALUES (?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            int rows = ps.executeUpdate();
            out.print(rows);
            
            

            if (rows>0) {
            	HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("index.html");
            } else {
            	out.println("<font color=red size=18>Login Failed!!<br>");
            	out.println("<a href='login.jsp'>Try Again!!</a>");
            }

          
            ps.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
	}



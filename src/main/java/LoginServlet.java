

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("txt");
        String email = request.getParameter("email");
        String password = request.getParameter("pswd");

        if (validateUser(username, password,email)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("index.html");
        } else {
            response.sendRedirect("index.html");
        }
    }

    private boolean validateUser(String username, String password,String email) {
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbUser = "system";
        String dbPassword = "alekhya2116";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            String query = "INSERT INTO login (name, email, password) VALUES (?, ?, ?) ";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            
            int rows = preparedStatement.executeUpdate();
           

            if (rows>0) {
                
                preparedStatement.close();
                connection.close();
                return true;
            }

           
            preparedStatement.close();
            connection.close();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Voyager Railways</title>
        <!--<link rel="stylesheet" href="stylesheets/main.css">-->
        <style>
            body {
              background-image: url('train.jpg');
              background-repeat: no-repeat;
              background-attachment: fixed;  
              background-size: cover;
            }
           header{
                background-color: white;
                height: 100px;
            }
            header img{
                float: left;
            }
            header nav{
                padding-right: 10px;
                text-align:right;
                font-size: 30px;
            }
            nav a{
                text-decoration: none;
                margin-left: 10px;
            }
            *{
                margin: 0;
            }
            .searchbox{
                background-color: aliceblue;
                width:300px;
                margin-left: 500px;
                margin-top: 80px;
                padding: 10px;
                float: left;

            }
            .leftbox{
                float: left;
                margin: 100px;
                margin-top: 275px;
                font-size: 25px;

            }
            .r1{
                margin: 20px;
                text-align: center;
            }

            #foot{
                position:absolute;
                bottom: 0;
                background-color: bisque;
                width: 100%;
                text-align: center;
            }
            </style>
    </head>



    <%@ page import = "java.io.*,java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>

    <%
    if(("POST".equalsIgnoreCase(request.getMethod())))
    {
		String DB_URL="jdbc:mysql://localhost/employer";
		String USER = "root";
		String PASS = "rajagiri";
		

		Statement stmt= null;
		String sql=null;
        
		try
		{
			
			java.sql.Connection con;
			con = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = con.createStatement();
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
            sql = "SELECT fname FROM Users where uname=? and pass=?";
			PreparedStatement preSta = con.prepareStatement(sql);
            preSta.setString(1, uname);
            preSta.setString(2, pass);
			ResultSet rs = preSta.executeQuery();
			
			if(rs.next())
			{
                session.setAttribute("user",uname); 
                out.println("<script>window.location.assign(\"./account.jsp\")</script>");
			}
			else
			{
                out.println("<script>window.alert(\"Invalid Username/Password\")</script>");
			}
			
			rs.close();
			stmt.close();
			con.close();
		}
		catch(SQLException se)
		{
			//Handle errors for JDBC
			se.printStackTrace();
		}
		catch(Exception e)
		{
			//Handle errors for Class.forName
			e.printStackTrace();
		}
		finally
		{
			//finally block used to close resources
			try
			{
				if(stmt!=null)
				stmt.close();
			}
			catch(SQLException se2)
			{
			} // nothing we can do
			
			
        } //end try
    }
    %>












    <body>
        <header class="primary-header container group">
            <h1 class="logo">
                <a href="index.jsp"><img src="rlogo.jpg" height="100" width="100"><br></a>
            </h1>
            

            <nav class="nav primary-nav">
                <a href="index.jsp">Home</a>
                <a href="register.jsp">Register</a>
                
            </nav>
        </header>

        <!--Introduction-->
        <insidebox>
        

        <section class="searchbox">
            <section class="r1">
                <h1 id="rh">LOGIN</h1>
                <form class="rf" method="POST" action=""><br>
                 <label for="uname">Username:</label><br>
                 <input type="text" id="uname" name="uname" required><br><br>
                 <label for="pass">Password:</label><br>
                 <input type="password" id="pswd" name="pass" required><br><br><br>
                 
                   <input type="submit" value="Login">
                </form>
             </section> 
                 
        </section>

        
        </insidebox>
        <br>
        <div id="foot">
            <small>&copy; Voyager Railways</small>
        </div>
        

        
    </body>
</html>

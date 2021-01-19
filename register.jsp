
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Voyager Railways</title>
        <!--<link rel="stylesheet" href="stylesheets/main.css">-->
        <style>
            body {
              background-image: url('./train.jpg');
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
                margin-top: 20px;
               
                float: left;

            }
            .leftbox{
                float: left;
                margin: 100px;
                margin-top: 275px;
                font-size: 25px;

            }
            .r1{
                margin: 10px;
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
            sql = "SELECT fname FROM Users where uname=?";
			PreparedStatement preSta = con.prepareStatement(sql);
			preSta.setString(1, uname);
			ResultSet rs = preSta.executeQuery();
			
			if(rs.next())
			{
                out.println("<script>window.alert(\"Username exists\")</script>");
			}
			else
			{
                String lname = request.getParameter("lname");
                String fname = request.getParameter("fname");
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String gender = request.getParameter("gender");
                int age = Integer.parseInt(request.getParameter("age"));
                String addr = request.getParameter("addr");
				sql = "INSERT INTO Users VALUES(?,?,?,?,?,?,?,?);";
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1, uname);
                preparedStatement.setString(2, fname);
                preparedStatement.setString(3, lname);
                preparedStatement.setString(4, email);
                preparedStatement.setString(5, pass);
                preparedStatement.setString(6, gender);
                preparedStatement.setInt(7, age);
                preparedStatement.setString(8, addr);
                preparedStatement.executeUpdate();
                
                out.println("<script>window.location.assign(\"./login.jsp\")</script>");
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
                <a href="index.jsp"><img src="./rlogo.jpg" height="100" width="100"><br></a>
            </h1>
            

            <nav class="nav primary-nav">
                <a href="index.jsp">Home</a>
                <a href="login.jsp">Login</a>
                
            </nav>
        </header>

        <!--Introduction-->
        <insidebox>
        

        <section class="searchbox">
            <section class="r1">
                <h1 id="rh">REGISTRATION FORM</h1>
                <form class="rf" method="POST" action="" ><br>
                    <label for="uname">User name:</label><br>
                 <input type="text" id="uname" name="uname" required><br>
                 <label for="fname">First name:</label><br>
                 <input type="text" id="fname" name="fname" required><br>
                 <label for="lname">Last name:</label><br>
                 <input type="text" id="lname" name="lname" required><br>
                 <label for="email">E-Mail ID:</label><br>
                 <input type="email" id="email" name="email" required><br>
                 <label for="pswd">Password:</label><br>
                 <input type="password" id="pswd" name="pass" required><br>
                 <label for="gender"> Gender:</label><br>
                 <input type="radio" name="gender" value="m" />Male 
                 <input type="radio" name="gender" value="f" />Female 
                 <input type="radio" name="gender" value="o">Other<br>
                 <label for="age">Age:</label><br>
                 <input type="number" id="age" name="age" required><br><br>
                 Address<br>
                 <textarea id="addr" name="addr" rows="3" cols="30" required>
                 </textarea>
     
           
     
     
                   </select> <br><br>
                   <input type="submit" value="Submit">
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

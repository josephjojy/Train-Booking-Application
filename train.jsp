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
                width:1000px;
                margin-left: 100px;
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
            th{
                padding-top: 20px;
                padding-right: 150px;;
            }
            </style>
    </head>


    






    <body>
        <header class="primary-header container group">
            <h1 class="logo">
                <a href="index.jsp"><img src="./rlogo.jpg" height="100" width="100"><br></a>
            </h1>
            

            <nav class="nav primary-nav">
                <a href="index.jsp">Home</a>
                <%
            
            if(session.getAttribute("user")==null)
            {
                out.println("<a href='register.jsp'>Register</a><a href='login.jsp'>Login</a>");
            }
            else{
                out.println("<a href='account.jsp'>"+(String)session.getAttribute("user")+"</a>");
            }
        %>
                
            </nav>
        </header>

        <!--Introduction-->
        <insidebox>
        

        <section class="searchbox">
            <section class="r1">
                <%@ page import = "java.io.*,java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>

    <%
    if(("POST".equalsIgnoreCase(request.getMethod())))
    {
		String DB_URL="jdbc:mysql://localhost/employer";
		String USER = "root";
		String PASS = "rajagiri";
		

		Statement stmt= null;
		String sql=null;
        
		
			
			java.sql.Connection con;
			con = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = con.createStatement();



            int from =Integer.parseInt(request.getParameter("from"));
            int to = Integer.parseInt(request.getParameter("to"));
            String datet=request.getParameter("date");
            

            sql = "create OR REPLACE VIEW trainreq as (SELECT trno,aarv,barv FROM trainstops where astno=? and bstno=? and aarv<barv)";
			PreparedStatement preSta = con.prepareStatement(sql);
            preSta.setInt(1, from);
            preSta.setInt(2, to);
			preSta.executeUpdate();
            
           
            sql = "select t.name,tr.trno ,tr.aarv,tr.barv from train t , trainreq tr where t.trno=tr.trno";
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
			

               out.println("<h2>Train List on "+datet+"</h2><br>"); 
               out.println("<table><tr><th>Train Name</th><th>Train No</th><th>Departure Time</th> <th>Arrival Time</th> <th>Book Now</th> </tr>");
                   while(rs.next())
                   {   String tname=rs.getString("name");
                        String trno=rs.getString("trno");
                        String aarv=rs.getString("aarv");
                        String barv=rs.getString("barv");
                       out.println("<form action=\"./book.jsp\" method=\"POST\">"+
                            "<input type=\"hidden\" name=\"tname\" value="+tname+">"+
                            "<input type=\"hidden\" name=\"trno\" value="+trno+">"+
                            "<input type=\"hidden\" name=\"sst\" value="+from+">"+
                            "<input type=\"hidden\" name=\"sdt\" value="+to+">"+
                            "<input type=\"hidden\" name=\"datet\" value="+datet+">"+
                            "<input type=\"hidden\" name=\"aarv\" value="+aarv+">"+
                            "<input type=\"hidden\" name=\"barv\" value="+barv+">"+
                            "<tr><th>"+tname+"</th><th>"+trno+"</th><th>"+aarv+"hrs</th><th>"+barv+"hrs</th><th><input type=\"submit\" value=\"Book\"></th></tr>"+
                        "</form>");
                   }
                   
              out.println("</table> ") ;   
              
        
               rs.close();
               stmt.close();
               con.close();
                }
               %> 

        </section>
        </section>

        
        </insidebox>
        <br>
        <div id="foot">
            <small>&copy; Voyager Railways</small>
        </div>
        

        
    </body>
</html>

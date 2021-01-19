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
                <a href="account.jsp">Account</a>
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


            String datet=request.getParameter("date");
            String tname=request.getParameter("tname");
            int trno =Integer.parseInt(request.getParameter("trno"));
            String aarv=request.getParameter("aarv");
            String barv=request.getParameter("barv");
            String Src=request.getParameter("sst");
            String Desc=request.getParameter("sdt");
            String pname=request.getParameter("name");
            String gender=request.getParameter("gender");
            int age =Integer.parseInt(request.getParameter("age"));
            
            String uname=(String)session.getAttribute("user");  

            Random random = new Random();
            int tno=Integer.parseInt(aarv + String.valueOf(random.nextInt(9999)));
            int pnr=Integer.parseInt(barv + String.valueOf(random.nextInt(9999)));
            sql = "Insert into Ticket values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement preSta = con.prepareStatement(sql);
            preSta.setInt(1, tno);
            preSta.setInt(2, pnr);
            preSta.setInt(3, trno);
            preSta.setString(4, pname);
            preSta.setString(5, gender);
            preSta.setInt(6, age);
            preSta.setString(7, Src);
            preSta.setString(8, Desc);
            preSta.setString(9 ,uname);
            preSta.setInt(10, 1);
            preSta.executeUpdate();
			
            
               out.println("<h2>Booking Details</h2><br>"); 
                       out.println("<br>Train Name : "+tname+
                       "<br>Train No : "+trno+
                       "<br>PNR : "+pnr+
                       "<br>Date : "+datet+
                       "<br>Start Station : "+Src+
                       "<br>Time : "+aarv+
                       "<br>Stop Station : "+Desc+
                       "<br>Time : "+barv+
                       "<br>Passanger Name : "+pname+
                       "<br>Age : "+age+
                       "<br>Gender : "+gender+
                       "<br><strong>Booked</strong>");
                     
              
        
               
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

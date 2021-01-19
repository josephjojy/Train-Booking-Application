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


            int pno =Integer.parseInt(request.getParameter("pnr"));
            

            sql = "Select * from Ticket where pnr=?";
			PreparedStatement preSta = con.prepareStatement(sql);
            preSta.setInt(1, pno);
            ResultSet rs=preSta.executeQuery();
			
            while(rs.next()){
                sql = "Select Name from train where trno=?";
                PreparedStatement preStat = con.prepareStatement(sql);
                int n = Integer.parseInt(rs.getString("tno"));
                preStat.setInt(1,n);
                ResultSet rst=preStat.executeQuery();
                rst.next();
                out.println("<h2>PNR Status</h2><br>"); 
                       out.println("<br>"+
                       "<br>PNR : "+rs.getString("pnr")+
                       "<br>Ticket No : "+rs.getString("no")+
                       "<br>Train No : "+rs.getString("tno")+
                       "<br>Train Name : "+rst.getString("Name")+
                       "<br>Start Station : "+rs.getString("TSrc")+
                       "<br>Stop Station : "+rs.getString("TDEst")+
                       "<br>Passanger Name : "+rs.getString("name")+
                       "<br>Age : "+rs.getString("Age")+
                       "<br>Gender : "+rs.getString("Gender"));
                       if(rs.getString("BG").equals("0"))
                            out.println("<h3>Canceled</h3>");
                        else
                            out.println("<h3>Booked</h3>");    
            }
                     
              
        
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

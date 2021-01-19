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
            input{
                padding: 2px;
                margin: 2px;
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
        if(session.getAttribute("user")==null)
            {
                out.println("<script>window.location.assign(\"./login.jsp\")</script>");
            }
        
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


            String datet=request.getParameter("datet");
            String tname=request.getParameter("tname");
            String trno=request.getParameter("trno");
            String aarv=request.getParameter("aarv");
            String barv=request.getParameter("barv");
            int from =Integer.parseInt(request.getParameter("sst"));
            int to =  Integer.parseInt(request.getParameter("sdt"));
            
            

            sql = "Select * from Station where stno=? or stno=?";
			PreparedStatement preSta = con.prepareStatement(sql);
            preSta.setInt(1, from);
            preSta.setInt(2, to);
            ResultSet rs = preSta.executeQuery();
            String Src="",Desc="";
			
            int stno;
               out.println("<h2>Book Train</h2><br>"); 
                   while(rs.next())
                   {   stno=Integer.parseInt(rs.getString("stno"));
                       if(stno==from){
                            Src= rs.getString("Name");}
                        if(stno==to){
                            Desc=rs.getString("Name");   } 
                    }
                       out.println("<form action=\"./conf.jsp\" method=\"POST\">"+
                            "Train Name<input type=\"text\" name=\"tname\" value="+tname+" readonly>"+
                            "Train No<input type=\"text\" name=\"trno\" value="+trno+" readonly>"+
                            "Date<input type=\"text\" name=\"date\" value="+datet+" readonly><br>"+
                            "Source<input type=\"text\" name=\"sst\" value="+Src+" readonly>"+
                            "Destination<input type=\"text\" name=\"sdt\" value="+Desc+" readonly><br>"+
                            "Start time<input type=\"text\" name=\"aarv\" value="+aarv+" readonly>"+
                            "Reach time<input type=\"text\" name=\"barv\" value="+barv+" readonly><br>"+
                            "Passanger Name<input type=\"text\" name=\"name\" required>"+
                            "Age<input type=\"number\" name=\"age\" required><br>"+
                            "<label for=\"gender\"> Gender:</label>"+
                            "<input type=\"radio\" name=\"gender\" value=\"m\" />Male "+
                            "<input type=\"radio\" name=\"gender\" value=\"f\" />Female "+
                            "<input type=\"radio\" name=\"gender\" value=\"o\">Other<br>"+
                            "<input type=\"submit\">"+
                            "</form>");
                     
              
        
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

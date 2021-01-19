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
                width:1100px;
                margin-left: 100px;
                margin-top: 50px;
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
            th{
                padding: 2px;
                padding-left: 60px;
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
            String uname=(String)session.getAttribute("user");
            
    if(("POST".equalsIgnoreCase(request.getMethod())))
    {
        int nos = Integer.parseInt(request.getParameter("no"));
        sql = "Update Ticket SET BG=0 WHERE no=?";
        PreparedStatement preStatt = con.prepareStatement(sql);
        preStatt.setInt(1, nos);
        preStatt.executeUpdate();
    }
            
              
            sql = "select tno,no,pnr,name,TSrc,TDest from Ticket Where BG=1 and uname=?";
			PreparedStatement preSta = con.prepareStatement(sql);
            preSta.setString(1, uname);
			ResultSet rs=preSta.executeQuery();
			

               out.println("<h2>Booked Tickets</h2>"); 
               out.println("<table><tr><th>Train No</th><th>Train</th><th>Ticket No</th><th>PNR</th><th>Passanger Name</th><th>Departure</th> <th>Arrival</th> <th>Cancel</th> </tr>");
                   while(rs.next())
                   {
                    sql = "Select Name from train where trno=?";
                    PreparedStatement preStats = con.prepareStatement(sql);
                    int n = Integer.parseInt(rs.getString("tno"));
                    preStats.setInt(1,n);
                    ResultSet rstt=preStats.executeQuery();
                    rstt.next();
                        out.println("<tr><th>"+rs.getString("tno")+"</th><th>"+rstt.getString("Name")+"</th><th>"+rs.getString("no")+"</th><th>"+rs.getString("pnr")+"</th><th>"+rs.getString("name")+"</th><th>"+rs.getString("TSrc")+"</th><th>"+rs.getString("TDest")+"</th><th><form method='POST'><input type='hidden' value="+rs.getString("no")+" name='no'><input type='submit' value='Cancel Ticket'></form></th>");
                   }
                   
              out.println("</table> ") ; 
              sql = "select tk.tno,tk.no,tk.pnr,tk.name as pass,tk.TSrc,tk.TDest from Ticket tk Where tk.BG=0 and tk.uname=?";
              PreparedStatement preStat = con.prepareStatement(sql);
              preStat.setString(1, uname);
              
              ResultSet rst=preStat.executeQuery();
              
  
                 out.println("<h2>Cancelled Tickets</h2>"); 
                 out.println("<table><tr><th>Train No</th><th>Train</th><th>Ticket No</th><th>PNR</th><th>Passanger Name</th><th>Departure</th> <th>Arrival</th> </tr>");
                     while(rst.next())
                     {
                        sql = "Select Name from train where trno=?";
                        PreparedStatement preStats = con.prepareStatement(sql);
                        int n = Integer.parseInt(rst.getString("tno"));
                        preStats.setInt(1,n);
                        ResultSet rstt=preStats.executeQuery();
                        rstt.next();
                         
                        out.println("<tr><th>"+rst.getString("tno")+"</th><th>"+rstt.getString("Name")+"</th><th>"+rst.getString("no")+"</th><th>"+rst.getString("pnr")+"</th><th>"+rst.getString("pass")+"</th><th>"+rst.getString("TSrc")+"</th><th>"+rst.getString("TDest")+"</th>");
                          
                     }
                     
                out.println("</table> ") ;    
              
        
               rs.close();
               stmt.close();
               con.close();
                
               %> 
                <div>
                    <a href="./index.jsp"><button>Book Train</button></a>
                    </div>
        </section>
        </section>

        
        </insidebox>
        <br>
        <div id="foot">
            <small>&copy; Voyager Railways</small>
        </div>
        
       
        
    </body>
</html>

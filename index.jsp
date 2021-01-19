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
                margin-left: 200px;
                margin-top: 50px;
                padding: 5px;
                float: left;

            }
            .leftbox{
                float: left;
                margin: 100px;
                margin-top: 200px;
                font-size: 25px;
                text-shadow: 2px 2px #ffffff;

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
    <body>
        <header class="primary-header container group">
            <h1 class="logo">
                <a href="index.jsp"><img src="rlogo.jpg" height="100" width="100"><br></a>
            </h1>
            

            <nav class="nav primary-nav">
                <a href="index.jsp">Home</a>
            <%
            if(("POST".equalsIgnoreCase(request.getMethod())))
            {
                session.setAttribute("user",null); 
            }
            if(session.getAttribute("user")==null)
            {
                out.println("<a href='register.jsp'>Register</a><a href='login.jsp'>Login</a>");
            }
            else{
                out.println("<a href='account.jsp'>"+(String)session.getAttribute("user")+"</a>"
                +"<form method='POST'><input type='submit' value='Logout'></form>");
            }
        %>
                
                
            </nav>
        </header>
        
        <!--Introduction-->
        <insidebox>
        

        <section class="searchbox">
            <section class="r1">
               <h1 id="rh">FIND YOUR TRAIN</h1>
               <form name="ftrain" action="./train.jsp" method="POST" onsubmit="return validateForm()">
                <label for="from">From:</label><br>
                <select name="from" id="from">
                    <option value="1">Pochinki</option>
                    <option value="2">Gatka</option>
                    <option value="3">Georgopol</option>
                    <option value="4">Zharki</option>
                    <option value="5">Mylta</option>
                    <option value="6">Razhok</option>
                    <option value="7">Lipovka</option>
                </select><br>
                <label for="to">To:</label><br>
                <select name="to" id="to">
                    <option value="1">Pochinki</option>
                    <option value="2">Gatka</option>
                    <option value="3">Georgopol</option>
                    <option value="4">Zharki</option>
                    <option value="5">Mylta</option>
                    <option value="6">Razhok</option>
                    <option value="7">Lipovka</option>
                </select><br><br>
                <label for="date">Date:</label><br>
                <input type="date" id="date" name="date" min="2020-12-16" required><br><br><br>
                 
                  <input type="submit" value="Find Trains">
                  <input type="reset" value="Reset">
               </form><br>
               <br><br>
               <h1 id="rh">PNR status</h1>
               <form class="rf" method="POST" action="./pnr.jsp">
                <label for="pnr">Enter PNR No:</label><br>
                <input type="number" id="pno" name="pnr" required><br><br>
                <input type="submit">

               </form><br><br>

        </section>
        </section>

        <section class="leftbox">
            <h2>Welcome to Voyager Railways</h2>
            <p>Enjoy your journey the right way</p> 
        </section>
        
        </insidebox>
        <br>
        <div id="foot">
            <small>&copy; Voyager Railways</small>
        </div>
        
        <script>
            function validateForm() {
              var x = document.forms["ftrain"]["from"].value;
              var y = document.forms["ftrain"]["to"].value;
              if (x == y) {
                alert("Choose different Stations");
                return false;
              }
            }
            </script>
        
    </body>
</html>

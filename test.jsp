<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="order.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@700&family=Open+Sans:wght@500&display=swap" rel="stylesheet">
    </head>
    
    <body>
        <%@ page import="java.sql.*" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>

        <% 
          Class.forName("oracle.jdbc.driver.OracleDriver");
          Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","vashishta123");
          Statement stmt=con.createStatement();
          ResultSet rs=stmt.executeQuery("SELECT * FROM sfoods WHERE category = 'Starters'");
        %>
        <div class="maincard">
            <div class="header">
            <h2 class="heading">
                The<br>
                Southern<br>
                Cuisine.<br>
            </h2>
            </div>
            <div class="notification"></div>

            <div class="food">
                <div class="menu">
                    <a href="#starters">Starters</a>
                    <a href="#main-course">Main Course</a>
                    <a href="#desserts">Desserts</a>
                </div>
            
                <div class="contain">
                    <!-- Starters Section -->
                    <div class="menu-section" id="starters">
                        <h1>Starters</h1>


                        <% 
                        while (rs.next()) 
                        { 
                            String img = rs.getString(2).toLowerCase().replace(" ", "-");
                            out.println("<div class='items'>");
                            out.println("<img src='Graphics/All/"+img+".png'>");
                            out.println("<p class='food-title'>"+rs.getString(2)+"</p>");
                            out.println("<p class='food-description'>"+rs.getString(3)+"</p>");
                            out.println("<button class='select' onclick=\"addToCart('" + rs.getString(2) + "', '" + rs.getString(3) + "', '" + rs.getInt(4) + "')\">");
                            out.println("₹" + rs.getInt(4) + " | Add To Cart");
                            out.println("</button>");
                            out.println("</div>");
                            out.println("<hr>");
                        } 
                        %>
                        
                        
                    </div>
                    <div class="menu-section" id="main-course">
                        <h1>Main Course</h1>


                        <% 
                        ResultSet rs2=stmt.executeQuery("SELECT * FROM sfoods WHERE category = 'Main Course'");
                        while (rs2.next()) 
                        { 
                            String img = rs2.getString(2).toLowerCase().replace(" ", "-");
                            out.println("<div class='items'>");
                            out.println("<img src='Graphics/All/"+img+".png'>");
                            out.println("<p class='food-title'>"+rs2.getString(2)+"</p>");
                            out.println("<p class='food-description'>"+rs2.getString(3)+"</p>");
                            out.println("<button class='select' onclick=\"addToCart('" + rs2.getString(2) + "', '" + rs2.getString(3) + "', '" + rs2.getInt(4) + "')\">");
                            out.println("₹" + rs2.getInt(4) + " | Add To Cart");
                            out.println("</button>");
                            out.println("</div>");
                            out.println("<hr>");
                        } 
                        %>
                        
                        
                    </div>
                    <div class="menu-section" id="desserts">
                        <h1>Desserts</h1>


                        <% 
                        ResultSet rs3=stmt.executeQuery("SELECT * FROM sfoods WHERE category = 'Desserts'");
                        while (rs3.next()) 
                        { 
                            String img = rs3.getString(2).toLowerCase().replace(" ", "-");
                            out.println("<div class='items'>");
                            out.println("<img src='Graphics/All/"+img+".png'>");
                            out.println("<p class='food-title'>"+rs3.getString(2)+"</p>");
                            out.println("<p class='food-description'>"+rs3.getString(3)+"</p>");
                            out.println("<button class='select' onclick=\"addToCart('" + rs3.getString(2) + "', '" + rs3.getString(3) + "', '" + rs3.getInt(4) + "')\">");
                            out.println("₹" + rs3.getInt(4) + " | Add To Cart");
                            out.println("</button>");
                            out.println("</div>");
                            out.println("<hr>");
                        } 
                        %>
                        
                        <%
                          con.close();
                        %>
                    </div>    
                </div>
            </div>            
        </div>
    </body>
</html>
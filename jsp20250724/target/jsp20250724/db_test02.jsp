<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
</head>
<body>
    <% 
        String JDBC_URL = "jdbc:mysql://10.167.219.32:3306/Test202507?useSSL=false&serverTimeZone=UTC";
        String JDBC_USER = "users";
        String JDBC_PASSWORD = "123456";

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<String[]> products = new ArrayList<>();

        try {
            // 載入驅動程式
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 建立連線
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            // 建立SQL語法資源
            stmt = conn.createStatement();
            String sql = "select * from products";
            rs = stmt.executeQuery(sql);
            // 組合資料集
            while(rs.next()) {
                String[] product = new String[6];
                product[0] = String.valueOf(rs.getInt("product_id"));
                product[1] = rs.getString("product_name");
            
                product[2] = String.valueOf(rs.getInt("category_id"));
                product[3] = String.valueOf(rs.getInt("price"));
                product[4] = String.valueOf(rs.getInt("stock_quantity"));
                product[5] = rs.getString("description");
                products.add(product);
            }
        }
        catch (ClassNotFoundException e) {
            out.println("<div>驅動錯誤:" + e.getMessage() + "</div>");
        }
        catch (Exception e){
            out.println("<div>資料庫錯誤:" + e.getMessage() + "</div>");
        }
        
        finally {
            try {
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            }
            catch(SQLException e) {
                out.println("<div>沒有相關的連線資源需要釋放</div>");
            }
        }
    %>
    <% if(products.isEmpty()) { %>
        <div>沒有相關資料</div> <%
    } else {  %>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-8">
                    <h3>產品資料如下表 </h3> 
                    <div class="row row-cols-3">
                        <%
                            for (String[] product : products) {
                                // out.println("<p>");
                                // out.println("流水號:" + product[0]);
                                // out.println("產品名稱:" + product[1]);
                                // out.println("分類:" + product[2]);
                                // out.println("金額:" + product[3]);
                                // out.println("庫存:" + product[4]);
                                // out.println("描述:" + product[5]);
                                // out.println("</p>");
                                %>
                                <div class="col p-1">
                                    <div class="card" style="width: 18rem;">
                                        <img class="card-img-top" src="https:placehold.co/600x400/orange/white?text=demo" alt="Card image cap">
                                        <div class="card-body">
                                            <h5 class="card-title"><%= product[1] %></h5>
                                            <p class="card-text"><%= product[5] %></p>
                                            <a href="#" class="btn btn-primary" onclick="add2cart(<%= product[0] %>)">放入購物車</a>
                                        </div>
                                    </div>
                                </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    <% } %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    <script>
        function add2cart(pid) {
            console.log("從頁面上傳進來的pid: " + pid);
        }
    </script>
</body>
</html>
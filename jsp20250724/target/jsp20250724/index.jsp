<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
</head>
<body>
    <p>
        中文字
    </p>
    <div class="container">
        <div class="row">
            <div class="col-1 col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h2>變數宣告與使用</h2>
                        <p>現在時間是： <%= new java.util.Date() %></p>
                        <p>
                            <%    
                            String message = "大家好，我是來自 Java 的訊息！";    
                            int visitorCount = 125;
                            %>
                            <p>來自變數的訊息： <% out.println(message); %></p>
                            <p>今日訪客數量： <% out.println(visitorCount); %></p>
                            <p> <%= visitorCount %></p>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-1 col-md-3">
                <div class="card" >
                    <div class="card-body">
                        <h2>集合的使用</h2>
                        <%  List<String> fruits = new ArrayList<>();    
                            fruits.add("蘋果");    
                            fruits.add("香蕉");    
                            fruits.add("橘子");
                        %>
                        <p>第一個水果是: <% out.println(fruits.get(0)); %></p>
                    </div>
                </div>
            </div>
            <div class="col-1 col-md-3">
                <div class="card" >
                    <div class="card-body">
                        <h2>IF-ELSE 條件判斷</h2>
                        <%    boolean isLoggedIn = false;    
                            if (isLoggedIn) {%>    <p>歡迎回來，使用者！</p>
                        <%    } else {%>    <p>您好，訪客！請 <a href="#">登入</a>。</p>
                        <%    }%>
                    </div>
                </div>
            </div>
            <div class="col-1 col-md-3">
                <div class="card" >
                    <div class="card-body">
                        <%!    // 宣告一個成員變數，所有請求都會共享它    
                        private int pageCounter = 0;    
                        // 宣告一個自訂函數    
                        public String sayHello(String name) {        
                            return "Hello, " + name + "!";    }%>
                            <h2>宣告的使用</h2>
                        <%    pageCounter++; // 每次刷新頁面，計數器都會增加%><p>這個頁面被訪問了 <%= pageCounter %> 次。</p>
                        <p>呼叫自訂函數：<%= sayHello("Gemini") %></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>
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
        //設定表單請求的編碼
        request.setCharacterEncoding("UTF-8");
        //取得表單資料
        String buyerName = request.getParameter("buyerName");
        String buyerEmail = request.getParameter("buyerEmail");
        String timeslot[] = request.getParameterValues("timeslot"); //複數型態
    %>
    <div class="container">
        <div class="row row-cols-2">
            <div class="col p-1">
                <h3></h3>
                    <form method="post" action="checkout.jsp">
                        <div class="mb-3">
                            <label for="buyerName" class="form-label">買家姓名</label>
                            <input type="text" class="form-control" id="buyerName" name="buyerName">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="exampleInputEmail1">電子郵件</label>
                            <input type="type" class="form-control" id="exampleInputEmail1" name="buyEmail">
                            
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" name="timeslot" value="上午">
                            <label class="form-check-label" for="exampleCheck1">上午收件</label>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck2"  name="timeslot" value="下午">
                            <label class="form-check-label" for="exampleCheck2">下午收件</label>
                        <div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck3"  name="timeslot" value="晚上">
                            <label class="form-check-label" for="exampleCheck3">晚上收件</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
            </div>
            <div class="cil p-1">
                <h3>接收到的表單資訊</h3>
                <div class="card">
                    <div class="card-body">
                        <p>買家姓名: <%= buyerName %></p>
                        <p>電子郵件: <%= buyerEmail %></p>
                        <p>收穫時段: 
                            <%
                                if(timeslot != null && timeslot.length > 0 ) {
                                    for(String ts : timeslot) { 
                                        out.println(ts);
                                    } 
                                }else {
                                    out.println("未選擇");
                                }
                            %>
                        </p>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>
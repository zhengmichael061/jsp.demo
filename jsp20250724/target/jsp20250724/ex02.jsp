<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%-- <%@ taglib prefix="c" uri="http://jakarta.ee/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://jakarta.ee/jsp/jstl/fmt" %> --%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
</head>
<body>
    <div class="container"> <!--bs 裡的寬度容器 -->
        <div class="row"> <!-- bs 裡的gridlayoutrow 單位-->
            <div class="col-12 col-md-6"> <!--bs 裡的gridlayoutrow 單位 可依螢幕大小斷點 增刪類別套用 -->
                <div class="card"> 
                    <div class="card-body">
                        <h3>基本EL 語法</h3>
                        <c:set var="number" value="42" />
                        <c:set var="testVar" value="hello jsp" />
                        <p>設定變數 testVar = "hello jsp" </p>
                        <p> EL 表達式 ${testVar} = "${testVar}" </p>
                        <p>是否為空 ${empty testVar}</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6">
                <div class="card"> 
                    <div class="card-body">
                        <%-- <h3>el 運算 </h3>
                        <p> 2+3 = ${2+3} </p> 
                        <h3>jstl 標籤</h3> --%>
                        <c:choose>

                            <c:when test="${not empty testVar}">
                                <p class="text-success"> jstl 運作正常</p>
                            </c:when>
                            <c:otherwise>
                                <p class="text-warning"> jstl 條件判斷失敗</p>
                            </c:otherwise>
                        </c:choose> 
                        <h4>使用 <code>&lt;c:if&gt;</code>:</h4>
                        <c:if test="${number > 50}">
                            <p class="success">✅ 數字 ${number} 大於 50。</p>
                        </c:if>
                        <c:if test="${number <= 50}">
                            <p class="error">❌ 數字 ${number} 不大於 50。</p>
                        </c:if>
                    </div>
                </div>
            </div>
             <div class="col-12 col-md-6">
                <div class="card"> 
                    <div class="card-body">
                        <h1>fmt 的使用</h1>
                        <c:set var="price" value="1234.567" /> <%-- 新增：用於格式化測試的數字 --%>
                        <c:set var="percentage" value="0.75" /> <%-- 新增：用於百分比格式化 --%>
                        <c:set var="today" value="<%= new java.util.Date() %>" /> <%-- 新增：用於日期格式化 --%>
                        <p>${price} 貨幣格式化後:<fmt:formatNumber value="${price}" type="currency" /></p>
                        <p>${price} 數字格式化後:<fmt:formatNumber value="${price}" pattern="#,##0.0" /></p> 
                    </div>
                </div>
            </div>        
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>
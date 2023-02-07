<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Leased Servers</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">    </head>
    <link rel="stylesheet" href="./public/style/app.css">
    <link rel="stylesheet" href="./public/style/list.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>
    <div class="header">
        <h2>List of leased Servers</h2>
        <div class="links">
            <a href="/">Home</a>
            <a href="NewPersonServlet">Add new Person</a>
            <a href="NewServerServlet?type=dedicated">Dedicated Server</a>
            <a href="NewServerServlet?type=virtual">Virtual Server</a>
        </div>
    </div>
    <div class="container d-flex justify-content-center">
        <table>
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>Company Name</th>
                <th>Number of Leased Servers</th>
                <th>#</th>
            </tr>
            <c:forEach items="${list}" var="list" varStatus="loop">
                <tr>
                    <td>${list.firstName} ${list.lastName}</td>
                    <td>${list.address}</td>
                    <c:if test="${list.companyName != null}">
                        <td>${list.companyName}</td>
                    </c:if>
                    <c:if test="${list.companyName == null}">
                        <td>/</td>  
                    </c:if>
                    <td>${list.getServletList().size()}</td>
                    <td><a href="DetailsServlet?id=${list.id}">Details</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>

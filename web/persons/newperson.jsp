<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a new Person</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">    </head>
    <link rel="stylesheet" href="./public/style/app.css">
    <link rel="stylesheet" href="./public/style/newperson.css">
</head>
<body>
    <div class="header">
        <h2>Add a new Person</h2>
        <div class="links">
            <a href="/">Home</a>
            <a href="NewServerServlet?type=dedicated">Dedicated Server</a>
            <a href="NewServerServlet?type=virtual">Virtual Server</a>
            <a href="LeasedServerListServlet">List of leased Servers</a>
        </div>
    </div>
    <div class="container">
        <c:if test="${success != null}">
            <div class="alert alert-success" role="alert">
                ${success}
            </div>
        </c:if>
        <c:if test="${error != null}">
            <div class="alert alert-danger" role="alert">
                ${error}
            </div>
        </c:if>
        <select class="form-select" aria-label="Default select example">
            <option selected value="1">Natural Person</option>
            <option value="2">Legal Person</option>
        </select>
        <form action="NewPersonServlet" method="POST">
            <input name="firstName" type="text" aria-label="First name" class="form-control" placeholder="First Name">
            <input name="lastName" type="text" aria-label="Last name" class="form-control" placeholder="Last name">
            <input name="address" type="text" aria-label="Address" class="form-control" placeholder="Address">
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <form action="NewPersonServlet" method="POST">
            <input name="firstName" type="text" aria-label="First Name" class="form-control" placeholder="First Name">
            <input name="lastName" type="text" aria-label="Last Name" class="form-control" placeholder="Last name">
            <input name="companyName" type="text" aria-label="Company Name" class="form-control" placeholder="Company Name">
            <input name="address" type="text" aria-label="Address" class="form-control" placeholder="Address">
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    <script src="../public/script/newPersonScript.js"></script>
</body>
</html>

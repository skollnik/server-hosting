<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${person.firstName} ${person.lastName}</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">    </head>
    <link rel="stylesheet" href="./public/style/app.css">
    <link rel="stylesheet" href="./public/style/details.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>
    <div class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="date-picker d-flex flex-column align-items-center justify-content-center">
                <input id="startDate" data-id="${person.getId()}" value="" type="date">
                <input id="endDate" data-id="${person.getId()}" type="date">
                <div class="servers"></div>
            </div>
        </div>
    </div>
    <div class="header">
        <h2>Details</h2>
        <div class="links">
            <a href="/">Home</a>
            <a href="NewPersonServlet">Add new Person</a>
            <a href="NewServerServlet?type=dedicated">Dedicated Server</a>
            <a href="NewServerServlet?type=virtual">Virtual Server</a>
            <a href="LeasedServerListServlet">List of leased Servers</a>
        </div>
    </div>
    <div class="container">
        <div class="person-info d-flex flex-column justify-content-center align-items-center">
            <h2>${person.firstName} ${person.lastName}</h2>
            <c:if test="${person.companyName != null}">
                <p>${person.companyName}</p>
                <button class="btn btn-primary">Show more details</button>
            </c:if>
            <c:if test="${person.companyName == null}">
                <p>No Company</p>
            </c:if>
        </div>
        <div class="server-list">
            <h2>Server list:</h2>
            <h5>Virtual Servers</h5>
            <div class="sort d-flex justify-content-center">
                <select id="sort" class="form-select">
                    <option value="date">Sort Ascending</option>
                    <option value="-date">Sort Descending</option>
                </select>
            </div>
            <div class="virtual-servers-list">
                <c:forEach items="${leasedVirtualServers}" var="server" varStatus="loop">
                    ${server}
                </c:forEach>
            </div>
            <h5>Dedicated Servers</h5>
            <div class="dedicated-servers-list">
                <c:forEach items="${leasedDedicatedServers}" var="server" varStatus="loop">
                    ${server}
                </c:forEach>
            </div>
        </div>
    </div>
    <script src="../public/script/details.js"></script>
</body>
</html>

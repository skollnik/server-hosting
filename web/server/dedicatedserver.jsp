<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dedicated Server</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">    </head>
    <link rel="stylesheet" href="./public/style/app.css">
    <link rel="stylesheet" href="./public/style/dedicatedserver.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>
    <div class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="select d-flex justify-content-center">
                <select class="form-select" aria-label="Default select example">
                    <option value="0" data-id="-1">Choose Person</option>
                    <c:forEach items="${persons}" var="person" varStatus="loop">
                        <option value="${loop.index + 1}" data-id="${person.id}">${person.firstName} ${person.lastName}</option>
                    </c:forEach>
                </select> 
            </div>
            <div class="selected-server"></div>
        </div>
    </div>
    <div class="header">
        <h2>Choose your Dedicated Server</h2>
        <div class="links">
            <a href="/">Home</a>
            <a href="NewPersonServlet">Add new Person</a>
            <a href="NewServerServlet?type=virtual">Virtual Server</a>
            <a href="LeasedServerListServlet">List of leased Servers</a>
        </div>
    </div>
    <div class="container d-flex justify-content-between">
        <div class="item d-flex flex-column p-0">
            <div class="card-title">2xE5-2640</div>
            <div class="card-price">
                <span>€69<small>/month</small></span>
            </div>
            <ul>
                <li>2x Intel Xeon E5-2640, 3Ghz Turbo, 12 Cores, 24 Threads</li>
                <li>32 GB RAM</li>
                <li>4x HDD</li>
                <li><strong>2.0 TB</strong> Shared Bandwidth</li>
                <li>Hardware RAID</li>                                        
                <li><strong>OS</strong> Windows</li>
                </li>
            </ul>
            <div class="card-footer d-flex justify-content-center">
                <button class="btn btn-primary">Buy</button>
            </div>
        </div>
        <div class="item d-flex flex-column p-0">
            <div class="card-title">2xE5-2650v2</div>
            <div class="card-price">
                <span>€99<small>/month</small></span>
            </div>
            <ul>
                <li>2x Intel Xeon E5-2650v2 3.4GHz Turbo, 16 Cores</li>
                <li>32 GB RAM</li>
                <li>4x HDD</li>
                <li><strong>4.0 TB</strong> Shared Bandwidth</li>
                <li>Software RAID</li>                                        
                <li><strong>OS</strong> Linux</li>
                </li>
            </ul>
            <div class="card-footer d-flex justify-content-center">
                <button class="btn btn-primary">Buy</button>
            </div>
        </div>
        <div class="item d-flex flex-column p-0">
            <div class="card-title">2xE5-2680v3</div>
            <div class="card-price">
                <span>€129<small>/month</small></span>
            </div>
            <ul>
                <li>2x Intel Xeon E5-2680 v3 3.30GHz Turbo, 24 Cores</li>
                <li>64 GB RAM</li>
                <li>8x SSD</li>
                <li><strong>500 GB</strong> Shared Bandwidth</li>
                <li>Hardwere RAID</li>                                        
                <li><strong>OS</strong> Windows</li>
                </li>
            </ul>
            <div class="card-footer d-flex justify-content-center">
                <button class="btn btn-primary">Buy</button>
            </div>
        </div>
        <div class="item d-flex flex-column p-0">
            <div class="card-title">2xE5-2680v3</div>
            <div class="card-price">
                <span>€179<small>/month</small></span>
            </div>
            <ul>
                <li>2x Xeon Gold 6138, 3.7Ghz Turbo, 40 Cores, 80 Threads</li>
                <li>128 GB RAM</li>
                <li>8x SSD</li>
                <li><strong>1.0 TB</strong> Shared Bandwidth</li>
                <li>Software RAID</li>                                        
                <li><strong>OS</strong> Linux</li>
                </li>
            </ul>
            <div class="card-footer d-flex justify-content-center">
                <button class="btn btn-primary">Buy</button>
            </div>
        </div>
    </div>
    <script src="../public/script/dedicatedServer.js"></script>
</body>
</html>

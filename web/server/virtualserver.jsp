<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Virtual Server</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">    </head>
    <link rel="stylesheet" href="./public/style/app.css">
    <link rel="stylesheet" href="./public/style/virtualserver.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>
    <div class="header">
        <h2>Customize Virtual Server</h2>
        <div class="links">
            <a href="/">Home</a>
            <a href="NewPersonServlet">Add new Person</a>
            <a href="NewServerServlet?type=dedicated">Dedicated Server</a>
            <a href="LeasedServerListServlet">List of leased Servers</a>
        </div>
    </div>
    <div class="cart d-flex flex-column justify-content-center align-items-center">
    </div>
    <div class="select d-flex justify-content-center">
        <select class="form-select" aria-label="Default select example">
            <option value="0" data-id="-1">Choose Person</option>
            <c:forEach items="${persons}" var="person" varStatus="loop">
                <option value="${loop.index + 1}" data-id="${person.id}">${person.firstName} ${person.lastName}</option>
            </c:forEach>
        </select> 
    </div>
    <div class="container d-flex flex-column justify-content-center align-items-center">
        <div class="segment d-flex justify-content-between">
            <div class="segment-part">
                <div class="segment-header">END DATE</div>
                <input id="datePicker" type="date">
            </div>
            <div class="segment-part">
                <div class="segment-header">OS</div>
                <select class="form-select" aria-label="Default select example">
                    <option value="Ubuntu">Ubuntu</option>
                    <option value="Windows">Windows</option>
                </select>
            </div>
        </div>
        <div class="segment">
            <div class="segment-header">ADDITIONAL CPUs</div>
            <div class="d-flex justify-content-around">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioCpu" id="radio1" data-price="0.00" value="CPU 2 Cores (FREE)" checked />
                    <label class="form-check-label" for="radio1"><span>CPU 2 Cores</span> (FREE)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioCpu" id="radio2" data-price="8.00" value="CPU 4 Cores (€8.00)" />
                    <label class="form-check-label" for="radio2"><span>CPU 4 Cores</span> (€<span>8.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioCpu" id="radio3" data-price="12.00" value="CPU 8 Cores (€12.00)" />
                    <label class="form-check-label" for="radio3"><span>CPU 8 Cores</span> (€<span>12.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioCpu" id="radio4" data-price="18.00" value="CPU 12 Cores (€18.00)" />
                    <label class="form-check-label" for="radio4"><span>CPU 12 Cores</span> (€<span>18.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioCpu" id="radio5" data-price="22.00" value="CPU 16 Cores (€22.00)" />
                    <label class="form-check-label" for="radio5"><span>CPU 16 Cores</span> (€<span>22.00</span>)</label>
                </div>
            </div>
        </div>
        <div class="segment">
            <div class="segment-header">ADDITIONAL RAM</div>
            <div class="d-flex justify-content-around">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioRam" id="radio6" data-price="0.00" value="4 GB RAM (FREE)" checked />
                    <label class="form-check-label" for="radio6"><span>4 GB RAM</span> (FREE)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioRam" id="radio7" data-price="8.00" value="8 GB RAM (€8.00)" />
                    <label class="form-check-label" for="radio7"><span>8 GB RAM</span> (€<span>8.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioRam" id="radio8" data-price="12.00" value="12 GB RAM (€12.00)" />
                    <label class="form-check-label" for="radio8"><span>12 GB RAM</span> (€<span>12.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioRam" id="radio9" data-price="16.00" value="16 GB RAM (€16.00)" />
                    <label class="form-check-label" for="radio9"><span>16 GB RAM</span> (€<span>16.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioRam" id="radio10" data-price="28.00" value="32 GB RAM (€32.00)" />
                    <label class="form-check-label" for="radio10"><span>32 GB RAM</span> (€<span>28.00</span>)</label>
                </div>
            </div>
        </div>
        <div class="segment">
            <div class="segment-header">ADDITIONAL DISK SPACE</div>
            <div class="d-flex justify-content-around">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioDiskSpace" id="radio11" data-price="0.00" value="500 GB HDD (FREE)" checked />
                    <label class="form-check-label" for="radio11"><span>500 GB HDD</span> (FREE)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioDiskSpace" id="radio12" data-price="4.00" value="1.0 TB HDD (€4.00)" />
                    <label class="form-check-label" for="radio12"><span>1.0 TB HDD</span> (€<span>4.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioDiskSpace" id="radio13" data-price="8.00" value="500 GB SSD (€8.00)" />
                    <label class="form-check-label" for="radio13"><span>500 GB SSD</span> (€<span>8.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioDiskSpace" id="radio14" data-price="12.00" value="1.0 TB SSD (€12.00)" />
                    <label class="form-check-label" for="radio14"><span>1.0 TB SSD</span> (€<span>12.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioDiskSpace" id="radio15" data-price="16.00" value="2.0 TB SSD (€16.00)" />
                    <label class="form-check-label" for="radio15"><span>2.0 TB SSD</span> (€<span>16.00</span>)</label>
                </div>
            </div>
        </div>
        <div class="segment">
            <div class="segment-header">BANDWIDTH</div>
            <div class="d-flex justify-content-around">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioBandwidth" id="radio16" data-price="0.00" value="Bandwidth 500 GB (FREE)" checked />
                    <label class="form-check-label" for="radio16"><span>Bandwidth 500 GB</span> (FREE)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioBandwidth" id="radio17" data-price="4.00" value="Bandwidth 1.0 TB (€4.00)" />
                    <label class="form-check-label" for="radio17"><span>Bandwidth 1.0 TB</span> (€<span>4.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioBandwidth" id="radio18" data-price="8.00" value="Bandwidth 2.0 TB (€8.00)" />
                    <label class="form-check-label" for="radio18"><span>Bandwidth 2.0 TB</span> (€<span>8.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioBandwidth" id="radio19" data-price="12.00" value="Bandwidth 4.0 TB (€12.00)" />
                    <label class="form-check-label" for="radio19"><span>Bandwidth 4.0 GB</span> (€<span>12.00</span>)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioBandwidth" id="radio20" data-price="16.00" value="Bandwidth 8.0 TB (€16.00)" />
                    <label class="form-check-label" for="radio20"><span>Bandwidth 8.0 GB</span> (€<span>16.00</span>)</label>
                </div>
            </div>
        </div>
        <div class="segment">
            <div class="segment-header">RAID</div>
            <div class="d-flex justify-content-around">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioRaid" id="radio21" data-price="0.00" value="Hardware RAID (FREE)" checked />
                    <label class="form-check-label" for="radio21"><span>Hardware RAID</span> (FREE)</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="radioRaid" id="radio22" data-price="5.00" value="Software RAID (€5.00)" />
                    <label class="form-check-label" for="radio22"><span>Software RAID</span> (€<span>5.00</span>)</label>
                </div>
            </div>
        </div>
    </div>
    <script src="../public/script/virtualServer.js"></script>
</body>
</html>

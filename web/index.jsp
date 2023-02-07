<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Server Hosting</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">    </head>
    <link rel="stylesheet" href="./public/style/app.css">
    <link rel="stylesheet" href="./public/style/index.css">
</head>
<body>
    <div class="header">
        <h2>Dedicated and Virtual Server Hosting</h2>
        <p>Top-tier performance at a cheap price</p>
    </div>
    <div class="container d-flex flex-column">
        <div class="container-md d-flex justify-content-between">
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="./public/images/businessman.png" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Add a new natural/legal person</h5>
                            <p class="card-text">Here you can add a new natural or legal person.</p>
                            <a class="btn btn-primary" href="NewPersonServlet" role="button">Add new person</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="./public/images/hosting1.png" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Choose your Dedicated Server</h5>
                            <p class="card-text">Here you can choose and buy Dedicated Server.</p>
                            <a class="btn btn-primary" href="NewServerServlet?type=dedicated" role="button">Choose your Dedicated Server</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-md d-flex justify-content-between">
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="./public/images/list.png" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">List of leased servers</h5>
                            <p class="card-text">Here you can see list of leased servers with details.</p>
                            <a class="btn btn-primary" href="LeasedServerListServlet" role="button">List of leased servers</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="./public/images/hosting2.png" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Choose your Virtual Server</h5>
                            <p class="card-text">Here you can configure and buy Virtual Server.</p>
                            <a class="btn btn-primary" href="NewServerServlet?type=virtual" role="button">Choose your Virtual Server</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>

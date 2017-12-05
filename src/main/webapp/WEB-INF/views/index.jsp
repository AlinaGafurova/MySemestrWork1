<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Robotics</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/clean-blog.min.css"/>" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/home"/>">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/about"/>">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/profile"/>">Profile </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/registration"/>">Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/logout"/>">Exit</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Header -->
<header class="masthead" style="background-image: url('<c:url value="/resources/img/home-bg.jpg"/>')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                    <h1>Robotics for kids</h1>
                    <span class="subheading">Cognitive posts about robots</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
            <%--@elvariable id="posts" type="java.util.List<model.Post>"--%>
            <c:forEach items="${posts}" var="post">
                <div class="post-preview">
                    <p class="post-subtitle">
                            ${post.text}
                    </p>
                    <p class="post-meta">Posted by ${post.user.name}
                        on ${post.date}</p>
                </div>
                <hr>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript -->
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Custom scripts for this template -->
<script src="<c:url value="/resources/js/clean-blog.min.js"/>"></script>

</body>

</html>

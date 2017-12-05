<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--@elvariable id="user" type="model.User"--%>
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
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet'
          type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/clean-blog.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/profile.css"/>" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
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

<div>

    <%--@elvariable id="posts" type="java.util.List<model.Post>"--%>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="container-fluid well span6">
                    <div class="row-fluid">
                        <div class="span2">
                            <img src="data:image/jpeg;base64,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"
                                 class="img-circle">
                        </div>

                        <div class="span8">
                            <h3>${user.name}</h3>
                            <h6>Email: ${user.login}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="widget-area no-padding blank">
                    <div class="status-upload">
                        <form action="" method="post">
                            <%--@elvariable id="error" type="java.lang.String"--%>
                            <c:if test="${not empty error}">
                                <div class="text-danger">${error}</div>
                            </c:if>
                            <textarea placeholder="What are you doing right now?" name="text"></textarea>
                            <ul>
                                <li><a title="" data-toggle="tooltip" data-placement="bottom"
                                       data-original-title="Audio"><i
                                        class="fa fa-music"></i></a></li>
                                <li><a title="" data-toggle="tooltip" data-placement="bottom"
                                       data-original-title="Video"><i
                                        class="fa fa-video-camera"></i></a></li>
                                <li><a title="" data-toggle="tooltip" data-placement="bottom"
                                       data-original-title="Sound Record"><i class="fa fa-microphone"></i></a></li>
                                <li><a title="" data-toggle="tooltip" data-placement="bottom"
                                       data-original-title="Picture"><i
                                        class="fa fa-picture-o"></i></a></li>
                            </ul>
                            <button type="submit" class="btn btn-success green"><i class="fa fa-share"></i> Share
                            </button>
                        </form>
                    </div><!-- Status Upload  -->
                </div><!-- Widget Area -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
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
</div>

</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:600'>

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">


</head>


<body>

<div class="login-wrap">
    <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
        <div class="login-form">
            <form action="<c:url value="/login"/>" method="POST" class="sign-in-htm">
                <%--@elvariable id="loginError" type="java.lang.String"--%>
                <c:if test="${not empty loginError}">
                    <div class="text-danger">${loginError}</div>
                </c:if>
                <div class="group">
                    <label for="sign-in-email" class="label">Email</label>
                    <input id="sign-in-email" type="text" class="input" name="login">
                </div>
                <div class="group">
                    <label for="sign-in-pass" class="label">Password</label>
                    <input id="sign-in-pass" type="password" class="input" data-type="password" name="password">
                </div>
                <div class="group">
                    <input id="check" type="checkbox" class="check" checked>
                    <label for="check"><span class="icon"></span> Keep me Signed in</label>
                </div>
                <div class="group">
                    <input type="submit" class="button" value="Sign In">
                </div>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/home"/>">Home</a>
                </li>

                <div class="hr"></div>
                <div class="foot-lnk">
                    <a href="#forgot">Forgot Password?</a>
                </div>
            </form>
            <form action="<c:url value="/registration"/>" method="POST" class="sign-up-htm">
                <%--@elvariable id="regError" type="java.lang.String"--%>
                <c:if test="${not empty regError}">
                    <div class="text-danger">${regError}</div>
                </c:if>
                <div class="group">
                    <label for="sign-up-name" class="label">Name</label>
                    <input id="sign-up-name" type="text" class="input" name="name">
                </div>
                <div class="group">
                    <label for="sign-up-pass" class="label">Password</label>
                    <input id="sign-up-pass" type="password" class="input" data-type="password" name="password">
                </div>
                <div class="group">
                    <label for="sign-up-email" class="label">Email Address</label>
                    <input id="sign-up-email" type="text" class="input" name="login">
                </div>
                <div class="group">
                    <input type="submit" class="button" value="Sign Up">
                </div>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/home"/>">Home</a>
                </li>

                <div class="hr"></div>
                <div class="foot-lnk">
                    <a>Already Member?</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Inventory Tracker</title>
  </head>
  <body>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!------ Include the above in your HEAD tag ---------->

  <link rel="stylesheet" type="text/css" href="Css/Index.css" >
  <script src="Script/Index.js"></script>

  <div class="login-reg-panel">
    <!--<div class="login-info-box">
      <h2>Have an account?</h2>
      <p>Lorem ipsum dolor sit amet</p>
      <label id="label-register" for="log-reg-show">Login</label>
      <input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
    </div>-->

    <!--<div class="register-info-box">
        <h2>Don't have an account?</h2>
        <p>Lorem ipsum dolor sit amet</p>
        <label id="label-login" for="log-login-show">Register</label>
        <input type="radio" name="active-log-panel" id="log-login-show">
    </div>-->

    <div class="white-panel">
      <div class="login-show">
        <h2>LOGIN</h2>
        <form action="handle_login" method="post">
          Username: <input type="text" name="username" size="32"><br>
          Password: <input type="password" name="password" size="32"><br>
          <input type="submit" value="send">
        </form>
        <a href="">Forgot password?</a>
      </div>
      <!--<div class="register-show">
        <h2>REGISTER</h2>
        <input type="text" placeholder="Email">
        <input type="password" placeholder="Password">
        <input type="password" placeholder="Confirm Password">
        <input type="button" value="Register">
      </div>-->
    </div>
  </div>
  <!--<h2>Please Login before Shopping</h2>
  <form action="handle_login" method="post">
    User Name: <input type="text" name="username" size="32"><br>
    Password: <input type="password" name="pwd" size="32"><br>
    <input type="submit" value="send">
  </form>-->
  <%
    String id = session.getId();
  %>
  <p> Your session id: <%= id %> </p>

  </body>
</html>
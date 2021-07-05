<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Zarejestruj się!</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
  </head>
  <body>
    <header>
      <nav class="container container--70">
        <ul class="nav--actions">
          <li><a href="/login">Zaloguj</a></li>
          <li class="highlighted"><a href="/register">Załóż konto</a></li>
        </ul>

        <ul>
          <li><a href="/" class="btn btn--without-border active">Start</a></li>
          <li><a href="/#steps" class="btn btn--without-border">O co chodzi?</a></li>
          <li><a href="/#about-us" class="btn btn--without-border">O nas</a></li>
          <li><a href="/#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
          <li><a href="/#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
      </nav>
    </header>

    <section class="login-page">
      <h2>Załóż konto</h2>
      <form:form method="post" modelAttribute="userRegister" action="/register" name="register">
        <div class="form-group">
          <form:input type="email" name="email" placeholder="Email"  path="email"/>
          <form:errors path="email" cssClass="error"/>
        </div>
        <div class="form-group">
          <form:input type="password" name="password" placeholder="Hasło"  path="password"/>
          <form:errors path="password" cssClass="error"/>
        </div>
        <div class="form-group">
          <input type="password" name="password2" placeholder="Powtórz hasło" />
        </div>

        <div class="form-group form-group--buttons">
          <a href="/login" class="btn btn--without-border">Zaloguj się</a>
          <button class="btn" type="submit">Załóż konto</button>
        </div>
      </form:form>
    </section>

    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>

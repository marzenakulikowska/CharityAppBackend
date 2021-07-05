<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>Przekaż dary!</title>

  <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
    <section class="form--steps">
      <div class="form--steps-instructions">
        <div class="form--steps-container">
          <h3>Ważne!</h3>
          <p data-step="1" class="active">
            Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
            wiedzieć komu najlepiej je przekazać.
          </p>
          <p data-step="2">
            Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
            wiedzieć komu najlepiej je przekazać.
          </p>
          <p data-step="3">
           Wybierz jedną, do
            której trafi Twoja przesyłka.
          </p>
          <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
      </div>

      <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form method="post" modelAttribute="donation" action="/donate" name="donationForm">
          <!-- STEP 1: class .active is switching steps -->
          <div data-step="1" class="active">
            <h3>Zaznacz co chcesz oddać:</h3>

              <c:forEach items="${categoryList}" var="categoryList">
              <div class="form-group form-group--checkbox">
              <label>
                <input type="checkbox" name="category" value="${categoryList.id}"/>
                <form:errors path="categoryList" cssClass="error"/>
                <span class="checkbox"></span>
                <span class="description selected-category">${categoryList.name}</span>
              </label>
              </div>
              </c:forEach>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 2 -->
          <div data-step="2">
            <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

            <div class="form-group form-group--inline">
              <label>
                Liczba 60l worków:
                <form:input type="number" name="quantity" step="1" min="1"  path="quantity"/>
                <form:errors path="quantity" cssClass="error"/>
              </label>
            </div>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>



          <!-- STEP 3 -->
          <div data-step="3">
            <h3>Wybierz organizację, której chcesz pomóc:</h3>
            <c:forEach items="${institutions}" var="institutions">
            <div class="form-group form-group--checkbox">
              <label>
                  <form:radiobutton cssClass="radiobtn" path="institution" name="organization" value="${institutions.id}"/>
                <form:errors path="institution" cssClass="error"/>
                <span class="checkbox radio"></span>
                <span class="description">
                  <div class="title selected-institution">Fundacja “${institutions.name}”</div>
                  <div class="subtitle"> Cel i misja: ${institutions.description}</div>
                </span>
              </label>
            </div>
            </c:forEach>
            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 4 -->
          <div data-step="4">
            <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

            <div class="form-section form-section--columns">
              <div class="form-section--column">
                <h4>Adres odbioru</h4>
                <div class="form-group form-group--inline">
                  <label> Ulica <form:input type="text" name="street" path="street" /> </label>
                  <form:errors path="street" cssClass="error"/>
                </div>

                <div class="form-group form-group--inline">
                  <label> Miasto <form:input type="text" name="city" path="city" /> </label>
                  <form:errors path="city" cssClass="error"/>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Kod pocztowy <form:input type="text" name="postcode" path="zipCode"/>
                    <form:errors path="zipCode" cssClass="error"/>
                  </label>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Numer telefonu <form:input type="phone" name="phone" path="phone" />
                    <form:errors path="phone" cssClass="error"/>
                  </label>
                </div>
              </div>

              <div class="form-section--column">
                <h4>Termin odbioru</h4>
                <div class="form-group form-group--inline">
                  <label> Data <form:input type="date" name="data" path="pickUpDate" /> </label>
                  <form:errors path="pickUpDate" cssClass="error"/>
                </div>

                <div class="form-group form-group--inline">
                  <label> Godzina <form:input type="time" name="time" path="pickUpTime" cssClass="selected-pickUpTime"/> </label>
                  <form:errors path="pickUpTime" cssClass="error"/>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Uwagi dla kuriera
                    <form:textarea name="more_info" rows="5" path="pickUpComment" cssClass="selected-pickUpComment"></form:textarea>
                    <form:errors path="pickUpComment" cssClass="error"/>
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 5 -->
          <div data-step="5">
            <h3>Podsumowanie Twojej darowizny</h3>

            <div class="summary">
              <div class="form-section">
                <h4>Oddajesz:</h4>
                <ul>
                  <li>
                    <span class="icon icon-bag"></span>
                    <span class="summary--text summary-quantity-category"></span>
                  </li>

                  <li>
                    <span class="icon icon-hand"></span>
                    <span class="summary--text summary-institution"></span>
                  </li>
                </ul>
              </div>

              <div class="form-section form-section--columns">
                <div class="form-section--column">
                  <h4>Adres odbioru:</h4>
                  <ul>
                    <li class="summary-street"></li>
                    <li class="summary-city"></li>
                    <li class="summary-zipCode"></li>
                    <li class="summary-phone"></li>
                  </ul>
                </div>

                <div class="form-section--column">
                  <h4>Termin odbioru:</h4>
                  <ul>
                    <li class="summary-pickUpDate"></li>
                    <li class="summary-pickUpTime"></li>
                    <li class="summary-pickUpComment"></li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="submit" class="btn">Potwierdzam</button>
            </div>
          </div>
        </form:form>
      </div>
    </section>

<jsp:include page="footer.jsp"></jsp:include>

    <script src="<c:url value="resources/js/app.js"/>"></script>
  </body>
</html>

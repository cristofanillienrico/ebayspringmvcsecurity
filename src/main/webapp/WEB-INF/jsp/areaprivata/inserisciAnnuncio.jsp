<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!doctype html>
<html lang="it">
<head>
  <jsp:include page="../header.jsp"/>
  <title>Modifica elemento</title>

  <!-- style per le pagine diverse dalla index -->
  <link href="${pageContext.request.contextPath }/assets/css/global.css" rel="stylesheet">
  <style>
    .error_field {
      color: red;
    }
  </style>
</head>
<body>
<jsp:include page="../navbar.jsp"/>

<main role="main" class="container">

  <%-- se l'attributo in request ha errori --%>
  <spring:hasBindErrors name="insert_annuncio_attribute">
    <%-- alert errori --%>
    <div class="alert alert-danger " role="alert">
      Attenzione!! Sono presenti errori di validazione
    </div>
  </spring:hasBindErrors>

  <div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
    ${errorMessage}
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>

  <div class='card'>
    <div class='card-header'>
      <h5>Modifica elemento</h5>
    </div>
    <div class='card-body'>

      <h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>

      <form:form modelAttribute="insert_annuncio_attribute" method="post" action="${pageContext.request.contextPath }/areaprivata/inserisciAnnuncio/save"
                 novalidate="novalidate">

        <div class="form-row">
          <div class="form-group col-md-6">
            <label>Nome <span class="text-danger">*</span></label>
            <spring:bind path="testoAnnuncio">
              <input type="text" name="testoAnnuncio" id="testoAnnuncio"
                     class="form-control ${status.error ? 'is-invalid' : ''}"
                     placeholder="Inserire il testoAnnuncio" value="${insert_annuncio_attribute.testoAnnuncio }" required>
            </spring:bind>
            <form:errors path="testoAnnuncio" cssClass="error_field"/>

            <spring:bind path="id">
              <input type="hidden" name="id" id="id"
                     class="form-control ${status.error ? 'is-invalid' : ''}"
                     value="${insert_annuncio_attribute.id }" required>
            </spring:bind>
          </div>


          <div class="form-group col-md-3">
            <label>Prezzo <span class="text-danger">*</span></label>
            <spring:bind path="prezzo">
              <input type="text" class="form-control ${status.error ? 'is-invalid' : ''}"
                     name="prezzo"
                     id="prezzo" placeholder="Inserire il prezzo"
                     value="${insert_annuncio_attribute.prezzo }" required>
            </spring:bind>
            <form:errors path="prezzo" cssClass="error_field"/>
          </div>

        </div>

        <div class="form-row">
          Selezionare le categorie:
          <br>
          <div class="form-check">
            <spring:bind path="categorie">
              <c:forEach items="${categorie_list_attribute}" var="categoriaItem">
                <input name="categorie" class="form-check-input" type="checkbox" value="${categoriaItem.id}"
                       id="defaultCheck${categoriaItem.id}" ${insert_annuncio_attribute.categorie.contains(categoriaItem)?"checked":"" }>
                <label class="form-check-label" for="defaultCheck${categoriaItem.id}">
                    ${categoriaItem.descrizione}
                </label>
                <br/>
              </c:forEach>
            </spring:bind>
          </div>
        </div>

        <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>

      </form:form>

      <!-- end card-body -->
    </div>
  </div>

  <!-- end container -->
</main>
<jsp:include page="../footer.jsp"/>

</body>
</html>
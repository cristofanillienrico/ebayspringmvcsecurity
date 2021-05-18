<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!doctype html>
<html lang="it">
<head>
    <jsp:include page="../header.jsp"/>
    <title>Inserisci nuovo</title>

    <!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath}/assets/css/global.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../navbar.jsp"/>

<main role="main" class="container">

    <%-- se l'attributo in request ha errori --%>
    <spring:hasBindErrors name="insert_utente_attribute">
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
            <h5>Inserisci nuovo elemento</h5>
        </div>
        <div class='card-body'>

            <h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>

            <form:form modelAttribute="insert_utente_attribute" method="post" action="save" novalidate="novalidate">

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Nome <span class="text-danger">*</span></label>
                    <spring:bind path="nome">
                        <input type="text" name="nome" id="nome" class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire il nome" value="${insert_utente_attribute.nome }" required>
                    </spring:bind>
                    <form:errors  path="nome" cssClass="error_field" />
                </div>

                <div class="form-group col-md-6">
                    <label>Cognome <span class="text-danger">*</span></label>
                    <spring:bind path="cognome">
                        <input type="text" name="cognome" id="cognome" class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire il cognome" value="${insert_utente_attribute.cognome }" required>
                    </spring:bind>
                    <form:errors  path="cognome" cssClass="error_field" />
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Username <span class="text-danger">*</span></label>
                    <spring:bind path="username">
                        <input type="text" name="username" id="username" class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire la username" value="${insert_utente_attribute.username }" required>
                    </spring:bind>
                    <form:errors  path="username" cssClass="error_field" />
                </div>

                <div class="form-group col-md-6">
                    <label>Password <span class="text-danger">*</span></label>
                    <spring:bind path="password">
                        <input type="password" name="password" id="password" class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire la username" value="${insert_utente_attribute.password }" required>
                    </spring:bind>
                    <form:errors  path="password" cssClass="error_field" />
                </div>

                <div class="form-group col-md-6">
                    <label>Conferma password <span class="text-danger">*</span></label>
                    <input type="password" class="form-control" name="confermaPassword" id="confermaPassword"
                           placeholder="conferma Password" required>
                </div>

            </div>


            <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>
            <input class="btn btn-outline-warning" type="reset" value="Ripulisci">


                <div class="form-row">
                    Selezionare il ruolo:
                    <br>
                    <div class="form-check">
                        <spring:bind path="ruoli">
                            <c:forEach items="${ruoli_list_attribute}" var="ruoloItem">
                                <input name="ruoli" class="form-check-input ${status.error ? 'is-invalid' : ''}" type="checkbox" value="${ruoloItem.id}" id="defaultCheck${ruoloItem.id}"}>
                                <label class="form-check-label" for="defaultCheck${ruoloItem.id}">
                                        ${ruoloItem.descrizione}
                                </label>
                                <br/>
                            </c:forEach>
                        </spring:bind>
                    </div>
                </div>

            </form:form>


            <!-- end card-body -->
        </div>
    </div>


    <!-- end container -->
</main>
<jsp:include page="../footer.jsp"/>

</body>
</html>
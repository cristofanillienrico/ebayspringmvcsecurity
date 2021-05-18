<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html lang="it">
<head>
    <jsp:include page="../header.jsp" />
    <title>Registra nuovo Utente</title>

    <!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath}/assets/css/global.css" rel="stylesheet">
    <style>	.error_field {
        color: red;
    }
    </style>
</head>
<body>

<main role="main" class="container">

    <%-- alert con lista errori --%>
    <spring:hasBindErrors name="utente_registration_attribute" >
        <%-- alert errori --%>
        <div class="alert alert-danger " role="alert">Attenzione!! Sono
            presenti errori di validazione</div>
    </spring:hasBindErrors>

    <div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
        ${errorMessage}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>

    <div class='card'>
        <div class='card-header'>
            <h5>Registrati</h5>
        </div>
        <div class='card-body'>

            <h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>

            <form:form modelAttribute="utente_registration_attribute" method="post" action="${pageContext.request.contextPath}/registration/save" novalidate="novalidate">

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Nome</label>
                        <spring:bind path="nome">
                            <input type="text" name="nome" id="nome" class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire il nome" value="${utente_registration_attribute.nome }"  >
                        </spring:bind>
                        <form:errors path="nome" cssClass="error_field" />
                    </div>

                    <div class="form-group col-md-6">
                        <label>Cognome</label>
                        <spring:bind path="cognome">
                            <input type="text" name="cognome" id="cognome" class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire il cognome" value="${utente_registration_attribute.cognome }" >
                        </spring:bind>
                        <form:errors path="cognome" cssClass="error_field" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Username</label>
                        <spring:bind path="username">
                            <input type="text" class="form-control ${status.error ? 'is-invalid' : ''}" name="username" id="username" placeholder="Inserire username" autocomplete="nope"  value="${utente_registration_attribute.username }" >
                        </spring:bind>
                        <form:errors path="username" cssClass="error_field" />
                    </div>

                    <div class="form-group col-md-6">
                        <label>Password</label>
                        <form:errors path="password" cssClass="error_field" />
                        <spring:bind path="password">
                            <input type="password" name="password" id="password"class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire il password" value="${utente_registration_attribute.password }" autocomplete="new-password" >

                            <label>conferma password <span class="text-danger">*</span></label>
                            <input type="password" class="form-control ${status.error ? 'is-invalid' : ''}" name="confermaPassword" id="confermaPassword" placeholder="conferma Password"  required>
                        </spring:bind>
                        <form:errors path="password" cssClass="error_field" />


                    </div>

                </div>


                <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>
                <input class="btn btn-outline-warning" type="reset" value="Ripulisci">

            </form:form>



            <!-- end card-body -->
        </div>
    </div>


    <!-- end container -->
</main>
<jsp:include page="../footer.jsp" />

</body>
</html>
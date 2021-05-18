<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="it">
<head>
    <jsp:include page="../header.jsp"/>
    <title>Pagina dei risultati</title>

    <!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath}/assets/css/global.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="../navbar.jsp"/>

<main role="main" class="container">

    <div class="alert alert-success alert-dismissible fade show ${successMessage==null?'d-none': ''}" role="alert">
        ${successMessage}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
        ${errorMessage}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="alert alert-danger alert-dismissible fade show d-none" role="alert">
        Esempio di operazione fallita!
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="alert alert-info alert-dismissible fade show d-none" role="alert">
        Aggiungere d-none nelle class per non far apparire
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>

    <div class='card'>
        <div class='card-header'>
            <h5>Lista degli acquisti di ${utente_in_sessione.nome} ${utente_in_sessione.cognome}</h5>
        </div>
        <div class='card-body'>
            <a href="${pageContext.request.contextPath}"
               class='btn btn-outline-secondary'>
                <i class='fa fa-chevron-left'></i> Torna alla Ricerca
            </a>

            <div class='table-responsive'>
                <table class='table table-striped '>
                    <thead>
                    <tr>
                        <th>Descrizione</th>
                        <th>Prezzo</th>
                        <th>Data Acquisto</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${lista_acquisti_utente }" var="acquistoItem">
                        <tr>
                            <td>${acquistoItem.descrizione }</td>
                            <td>${acquistoItem.prezzo }</td>
                            <td><fmt:formatDate type="date" value="${acquistoItem.dateAcquisto}"/></td>


<%--                            <td>--%>
<%--                                <a class="btn  btn-outline btn-outline-secondary"--%>
<%--                                   href="${pageContext.request.contextPath }/open/show/${annuncioItem.id }">Dettaglio</a>--%>
<%--                                <a class="btn  btn-success  ml-2 mr-2"--%>
<%--                                   href="${pageContext.request.contextPath }/acquisto/dettaglio/${annuncioItem.id }">Compra</a>--%>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

    <!-- end container -->
</main>

<jsp:include page="../footer.jsp"/>


</body>
</html>
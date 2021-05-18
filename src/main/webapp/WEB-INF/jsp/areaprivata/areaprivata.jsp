<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="it">
<head>
    <jsp:include page="../header.jsp"/>
    <title>Visualizza elemento</title>

    <!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath}/assets/css/global.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../navbar.jsp"/>

<main role="main" class="container">

    <div class='card'>
        <div class='card-header bg-info   '>
            <p class="h3 text-center">Benvenuto nella tua area personale</p>
        </div>


        <div class='card-body'>

            <dl class="row">
                <dt class="col-sm-3 text-right">username:</dt>
                <dd class="col-sm-9">${show_utente_attribute.username}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">nome:</dt>
                <dd class="col-sm-9">${show_utente_attribute.nome}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">cognome:</dt>
                <dd class="col-sm-9">${show_utente_attribute.cognome}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">Data creazione:</dt>
                <dd class="col-sm-9"><fmt:formatDate type="date" value="${show_utente_attribute.dateCreated}"/></dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right ">Credito Residuo:</dt>
                <dd class="col-sm-9">${show_utente_attribute.creditoResiduo}</dd>
            </dl>


        </div>

        <div class='card-footer'>
            <a href="${pageContext.request.contextPath }/areaprivata/modificaDatiAccount"
               class='btn btn-outline-light btn-warning'>
                <i class='fa fa-chevron-left'></i>Modifica i tuoi dati
            </a>

        </div>
    </div>


    <div class="card text-center ">
        <div class="card-header h4 text-center bg-info">
            <p class="h4 text-center">Riepilogo dei tuoi acquisiti</p>
        </div>
        <div class="card-body">
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


                        </tr>

                    </c:forEach>
                    </tbody>
                </table>

            </div>

        </div>


        <div class="card text-center ">
            <div class="card-header h4 text-center bg-info">
                <p class="h4 text-center"> Gestisci i tuoi annunci</p>
            </div>
            <div class="card-body">
                <div class='table-responsive'>
                    <table class='table table-striped '>
                        <thead>
                        <tr>
                            <th>Testo Annuncio</th>
                            <th>Prezzo</th>
                            <th>Data Pubblicazione</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${lista_annunci_utente }" var="annuncioItem">
                            <tr class=${!(annuncioItem.statoAnnuncio)?"table-warning":""}>
                                <td>${annuncioItem.testoAnnuncio }</td>
                                <td>${annuncioItem.prezzo }</td>
                                <td><fmt:formatDate type="date" value="${annuncioItem.dataPubblicazione}"/></td>


                                <c:if test="${annuncioItem.statoAnnuncio}">
                                    <td>
                                        <a class="btn   btn-outline-secondary"
                                           href="${pageContext.request.contextPath}/areaprivata/modificaAnnuncio/${annuncioItem.id }">Modifica</a>
                                        <a class="btn   btn-outline-danger "
                                           href="${pageContext.request.contextPath}/areaprivata/eliminaAnnuncio/${annuncioItem.id }">Elimina</a>
                                    </td>
                                </c:if>

                                <c:if test="${!annuncioItem.statoAnnuncio}">
                                    <td>

                                        <div class="badge bg-warning text-wrap " style="width: 6rem;height: 5rem;">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                 fill="currentColor" class="bi bi-coin" viewBox="0 0 16 16">
                                                <path d="M5.5 9.511c.076.954.83 1.697 2.182 1.785V12h.6v-.709c1.4-.098 2.218-.846 2.218-1.932 0-.987-.626-1.496-1.745-1.76l-.473-.112V5.57c.6.068.982.396 1.074.85h1.052c-.076-.919-.864-1.638-2.126-1.716V4h-.6v.719c-1.195.117-2.01.836-2.01 1.853 0 .9.606 1.472 1.613 1.707l.397.098v2.034c-.615-.093-1.022-.43-1.114-.9H5.5zm2.177-2.166c-.59-.137-.91-.416-.91-.836 0-.47.345-.822.915-.925v1.76h-.005zm.692 1.193c.717.166 1.048.435 1.048.91 0 .542-.412.914-1.135.982V8.518l.087.02z"/>
                                                <path fill-rule="evenodd"
                                                      d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                <path fill-rule="evenodd"
                                                      d="M8 13.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zm0 .5A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"/>
                                                <h6>Annuncio chiuso</h6>
                                            </svg>


                                        </div>
                                    </td>
                                </c:if>


                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
            <div class="card-footer text-muted">

                <a href="${pageContext.request.contextPath }/areaprivata/inserisciAnnuncio"
                   class='btn btn-outline-light btn-warning'>
                    <i class='fa fa-chevron-left'></i>Inserisci annuncio
                </a>
            </div>
        </div>


        <!-- end main container -->
</main>
<jsp:include page="../footer.jsp"/>

</body>
</html>
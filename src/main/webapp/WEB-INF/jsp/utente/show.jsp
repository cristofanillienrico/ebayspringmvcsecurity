<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it">
<head>
	<jsp:include page="../header.jsp" />
	<title>Visualizza elemento</title>
	
	<!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath}/assets/css/global.css" rel="stylesheet">
    
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
		
		<div class='card'>
		    <div class='card-header'>
		        Visualizza dettaglio
		    </div>
		
		    <div class='card-body'>
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Id:</dt>
				  <dd class="col-sm-9">${show_utente_attribute.id}</dd>
		    	</dl>
		    	
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
					   <dd class="col-sm-9"><fmt:formatDate type = "date" value = "${show_utente_attribute.dateCreated}" /></dd>
				   	</dl>
		    	
		    	<!-- info ruoli -->
		    	<p>
				  <a class="btn btn-primary btn-sm" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
				    Info ruoli
				  </a>
				</p>
				
				<div class="collapse" id="collapseExample">
				<c:forEach items="${show_utente_attribute.ruoli }" var="ruoloItem">
				  <div class="card card-body">
				  	<dl class="row">
					  <dt class="col-sm-3 text-right">id:</dt>
					  <dd class="col-sm-9">${ruoloItem.id}</dd>
				   	</dl>
				   	<dl class="row">
					  <dt class="col-sm-3 text-right">descrizione:</dt>
					  <dd class="col-sm-9">${ruoloItem.descrizione}</dd>
				   	</dl>
				   	<dl class="row">
					  <dt class="col-sm-3 text-right">codice:</dt>
					  <dd class="col-sm-9">${ruoloItem.codice}</dd>
				   	</dl>
				   	
				  </div>
				  </c:forEach>
				</div>
				<!-- end info ruoli -->
		    	
		    </div>

			<div class='card-footer'>
				<a href="${pageContext.request.contextPath }/utente/" class='btn btn-outline-secondary' style='width:80px'>
					<i class='fa fa-chevron-left'></i> Back
				</a>
			</div>
		</div>	
	
	
	
	<!-- end main container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="it">
	<head>
		<jsp:include page="../header.jsp" />
		<title>Pagina dei risultati</title>
		
		<!-- style per le pagine diverse dalla index -->
	    <link href="${pageContext.request.contextPath}/assets/css/global.css" rel="stylesheet">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    
	</head>
	<body>
		<jsp:include page="../navbar.jsp" />
		
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
			        <h5>Lista dei risultati</h5> 
			    </div>
			    <div class='card-body'>
			    	<a class="btn btn-primary " href="${pageContext.request.contextPath}/utente/insert">Add New</a>
			    	<a href="${pageContext.request.contextPath}/utente/search" class='btn btn-outline-secondary' >
			            <i class='fa fa-chevron-left'></i> Torna alla Ricerca
			        </a>
			    
			        <div class='table-responsive'>
			            <table class='table table-striped ' >
			                <thead>
			                    <tr>
			                        <th>Username</th>
			                        <th>Nome</th>
			                        <th>Cognome</th>
			                        <th>Data di Creazione</th>
									<th>Stato utente</th>

			                     <!--    <th>Ruolo</th> -->
			                        <th>Azioni</th>
			                    </tr>
			                </thead>
			                <tbody>
			                	<c:forEach items="${utente_list_attribute }" var="utenteItem">
									<tr>
										<td>${utenteItem.username }</td>
										<td>${utenteItem.nome }</td>
										<td>${utenteItem.cognome }</td>
										<td>${utenteItem.dateCreated}</td>
										
										<%-- <c:forEach items="${utenteItem.ruoli}" var="ruoloItem">
										<td>${ruoloItem}</td>
										</c:forEach> --%>
										
										<td>${utenteItem.stato}</td>
										
										<td>
											<a class="btn  btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/utente/show/${utenteItem.id }">Visualizza</a>
											<a class="btn  btn-sm btn-outline-primary ml-2 mr-2" href="${pageContext.request.contextPath}/utente/edit/${utenteItem.id }">Edit</a>
											
											<a id="changeStatoLink_#_${utenteItem.id }" class="btn btn-outline-${utenteItem.isAttivo()?'danger':'success'} btn-sm link-for-modal" data-toggle="modal" data-target="#confirmDeleteModal"  >${utenteItem.isAttivo()?'Disabilita':'Abilita'}</a>
									</tr>
									
				
								</c:forEach>
			                </tbody>
			            </table>
			        </div>
			    </div>
			    
			</div>	
		
		<!-- end container -->	
		</main>
		
		<jsp:include page="../footer.jsp" />
		
		 <!-- Modal -->
				<div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel"
				    aria-hidden="true">
				    <div class="modal-dialog" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="confirmDeleteModalLabel">Confermi di voler cambiare stato</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body">
				                Continuare con il cambio stato dell'elemento selezionato?
				            </div>
				            <form method="post" action="${pageContext.request.contextPath}/utente/cambiaStato" >
					            <div class="modal-footer">
					            	<input type="hidden" name="idUtenteForChangingStato" id="idUtenteForChangingStato" >
					                <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
					                <input type="submit" value="Continua"  class="btn btn-primary" >
					            </div>
				            </form>
				        </div>
				    </div>
				</div>
		<!-- end Modal -->
				<script type="text/javascript" >
					<!-- aggancio evento click al conferma del modal  -->
					$(document).ready(function(){
					$(".link-for-modal").click(function(e){
						e.preventDefault();
						<!-- mi prendo il numero che poi sarà l'id. Il 18 è perché 'changeStatoLink_#_' è appunto lungo 18  -->
						var callerId = $(this).attr('id').substring(18);
						<!-- imposto nell'hidden del modal l'id da postare alla servlet -->
						$('#idUtenteForChangingStato').val(callerId);
					})
					})
				</script>
		
	</body>
</html>
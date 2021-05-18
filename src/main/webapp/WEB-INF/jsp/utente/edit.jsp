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
	<spring:hasBindErrors name="edit_utente_attribute">
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

			<form:form modelAttribute="edit_utente_attribute" method="post" action="update"
					   novalidate="novalidate">

				<div class="form-row">
					<div class="form-group col-md-6">
						<label>Nome <span class="text-danger">*</span></label>
						<spring:bind path="nome">
							<input type="text" name="nome" id="nome"
								   class="form-control ${status.error ? 'is-invalid' : ''}"
								   placeholder="Inserire il nome" value="${edit_utente_attribute.nome }" required>
						</spring:bind>
						<form:errors path="nome" cssClass="error_field"/>

						<spring:bind path="id">
							<input type="hidden" name="id" id="id"
								   class="form-control ${status.error ? 'is-invalid' : ''}"
								   value="${edit_utente_attribute.id }" required>
						</spring:bind>
					</div>

					<div class="form-group col-md-6">
						<label>Cognome <span class="text-danger">*</span></label>
						<spring:bind path="cognome">
							<input type="text" name="cognome" id="cognome"
								   class="form-control ${status.error ? 'is-invalid' : ''}"
								   placeholder="Inserire il cognome" value="${edit_utente_attribute.cognome }"
								   required>
						</spring:bind>
						<form:errors path="cognome" cssClass="error_field"/>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-md-6">
						<label>Username <span class="text-danger">*</span></label>
						<spring:bind path="username">
							<input type="text" class="form-control ${status.error ? 'is-invalid' : ''}" name="username"
								   id="username" placeholder="Inserire la username"
								   value="${edit_utente_attribute.username }" required>
						</spring:bind>
						<form:errors path="username" cssClass="error_field"/>
					</div>

					<div class="form-group col-md-3">
						<label>Credito residuo <span class="text-danger">*</span></label>
						<spring:bind path="creditoResiduo">
							<input type="text" class="form-control ${status.error ? 'is-invalid' : ''}" name="creditoResiduo"
								   id="creditoResiduo" placeholder="Inserire il credito residuo"
								   value="${edit_utente_attribute.creditoResiduo }" required>
						</spring:bind>
						<form:errors path="creditoResiduo" cssClass="error_field"/>

						<input type="hidden" id="stato" name="stato" value="${edit_utente_attribute.stato }">

					</div>

				</div>

			<div class="form-row">
				Selezionare il ruolo:
				<br>
				<div class="form-check">
					<spring:bind path="ruoli">
						<c:forEach items="${ruoli_list_attribute}" var="ruoloItem">
							<input name="ruoli" class="form-check-input" type="checkbox" value="${ruoloItem.id}" id="defaultCheck1" ${edit_utente_attribute.ruoli.contains(ruoloItem)?"checked":"" }>
							<label class="form-check-label" for="defaultCheck1">
									${ruoloItem.descrizione}
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
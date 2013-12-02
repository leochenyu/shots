
<%@ page import="ots.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${questionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="question.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${questionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="question.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${questionInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.source}">
				<li class="fieldcontain">
					<span id="source-label" class="property-label"><g:message code="question.source.label" default="Source" /></span>
					
						<span class="property-value" aria-labelledby="source-label"><g:fieldValue bean="${questionInstance}" field="source"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.term}">
				<li class="fieldcontain">
					<span id="term-label" class="property-label"><g:message code="question.term.label" default="Term" /></span>
					
						<span class="property-value" aria-labelledby="term-label"><g:fieldValue bean="${questionInstance}" field="term"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.analysis}">
				<li class="fieldcontain">
					<span id="analysis-label" class="property-label"><g:message code="question.analysis.label" default="Analysis" /></span>
					
						<span class="property-value" aria-labelledby="analysis-label"><g:fieldValue bean="${questionInstance}" field="analysis"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.inputDate}">
				<li class="fieldcontain">
					<span id="inputDate-label" class="property-label"><g:message code="question.inputDate.label" default="Input Date" /></span>
					
						<span class="property-value" aria-labelledby="inputDate-label"><g:formatDate date="${questionInstance?.inputDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.errorRate}">
				<li class="fieldcontain">
					<span id="errorRate-label" class="property-label"><g:message code="question.errorRate.label" default="Error Rate" /></span>
					
						<span class="property-value" aria-labelledby="errorRate-label"><g:fieldValue bean="${questionInstance}" field="errorRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.answers}">
				<li class="fieldcontain">
					<span id="answers-label" class="property-label"><g:message code="question.answers.label" default="Answers" /></span>
					
						<g:each in="${questionInstance.answers}" var="a">
						<span class="property-value" aria-labelledby="answers-label"><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.inputBy}">
				<li class="fieldcontain">
					<span id="inputBy-label" class="property-label"><g:message code="question.inputBy.label" default="Input By" /></span>
					
						<span class="property-value" aria-labelledby="inputBy-label"><g:link controller="adminUser" action="show" id="${questionInstance?.inputBy?.id}">${questionInstance?.inputBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionInstance?.id}" />
					<g:link class="edit" action="edit" id="${questionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

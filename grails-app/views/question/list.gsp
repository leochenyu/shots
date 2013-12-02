
<%@ page import="ots.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-question" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'question.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'question.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="source" title="${message(code: 'question.source.label', default: 'Source')}" />
					
						<g:sortableColumn property="term" title="${message(code: 'question.term.label', default: 'Term')}" />
					
						<g:sortableColumn property="analysis" title="${message(code: 'question.analysis.label', default: 'Analysis')}" />
					
						<g:sortableColumn property="inputDate" title="${message(code: 'question.inputDate.label', default: 'Input Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionInstanceList}" status="i" var="questionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: questionInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "source")}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "term")}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "analysis")}</td>
					
						<td><g:formatDate date="${questionInstance.inputDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

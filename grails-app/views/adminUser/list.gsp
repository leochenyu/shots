
<%@ page import="ots.AdminUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adminUser.label', default: 'AdminUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-adminUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-adminUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fullName" title="${message(code: 'adminUser.fullName.label', default: 'Full Name')}" />
					
						<g:sortableColumn property="userName" title="${message(code: 'adminUser.userName.label', default: 'User Name')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'adminUser.password.label', default: 'Password')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adminUserInstanceList}" status="i" var="adminUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${adminUserInstance.id}">${fieldValue(bean: adminUserInstance, field: "fullName")}</g:link></td>
					
						<td>${fieldValue(bean: adminUserInstance, field: "userName")}</td>
					
						<td>${fieldValue(bean: adminUserInstance, field: "password")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adminUserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

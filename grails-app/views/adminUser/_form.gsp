<%@ page import="ots.AdminUser" %>



<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'fullName', 'error')} ">
	<label for="fullName">
		<g:message code="adminUser.fullName.label" default="Full Name" />
		
	</label>
	<g:textField name="fullName" value="${adminUserInstance?.fullName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'userName', 'error')} ">
	<label for="userName">
		<g:message code="adminUser.userName.label" default="User Name" />
		
	</label>
	<g:textField name="userName" value="${adminUserInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="adminUser.password.label" default="Password" />
		
	</label>
	<g:field type="password" name="password" value="${adminUserInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminUserInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="adminUser.question.label" default="Question" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${adminUserInstance?.question?}" var="q">
    <li><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="question" action="create" params="['adminUser.id': adminUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'question.label', default: 'Question')])}</g:link>
</li>
</ul>

</div>


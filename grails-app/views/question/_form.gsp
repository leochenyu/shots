<%@ page import="ots.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="question.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" required="" value="${questionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="question.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${questionInstance.constraints.type.inList}" value="${questionInstance?.type}" valueMessagePrefix="question.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'source', 'error')} ">
	<label for="source">
		<g:message code="question.source.label" default="Source" />
		
	</label>
	<g:textField name="source" value="${questionInstance?.source}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'term', 'error')} ">
	<label for="term">
		<g:message code="question.term.label" default="Term" />
		
	</label>
	<g:textField name="term" value="${questionInstance?.term}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'analysis', 'error')} ">
	<label for="analysis">
		<g:message code="question.analysis.label" default="Analysis" />
		
	</label>
	<g:textArea name="analysis" cols="40" rows="5" maxlength="1000" value="${questionInstance?.analysis}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'inputDate', 'error')} required">
	<label for="inputDate">
		<g:message code="question.inputDate.label" default="Input Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inputDate" precision="day"  value="${questionInstance?.inputDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answers', 'error')} ">
	<label for="answers">
		<g:message code="question.answers.label" default="Answers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.answers?}" var="a">
    <li><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="answer" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'answer.label', default: 'Answer')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'inputBy', 'error')} required">
	<label for="inputBy">
		<g:message code="question.inputBy.label" default="Input By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="inputBy" name="inputBy.id" from="${ots.AdminUser.list()}" optionKey="id" required="" value="${questionInstance?.inputBy?.id}" class="many-to-one"/>
</div>


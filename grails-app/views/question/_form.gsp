<%@ page import="ots.Question" %>

<script type="text/javascript">
    var childCount = ${questionInstance?.answers.size()} + 0;
    
    function addChild() {
        var htmlId = "answer" + childCount;
        var deleteIcon = "${resource(dir:'images/skin', file:'database_delete.png')}";
        var templateHtml = "<div id='" + htmlId + "' name='" + htmlId + "'>\n";
        templateHtml += "<input type='text' id='answers[" + childCount + "].serialNum' name='answers[" + childCount + "].serialNum' size='1'/>\n";
        templateHtml += "<input type='text' id='answers[" + childCount + "].content' name='answers[" + childCount + "].content' size='60'/>\n";
        templateHtml += "<input type='checkbox' id='answers[" + childCount + "].correct' name='answers[" + childCount + "].correct'/>\n";
        templateHtml += "<span onClick='$(\"#" + htmlId + "\").remove();'><img src='" + deleteIcon + "' /></span>\n";
        templateHtml += "</div>\n";
        $("#childList").append(templateHtml);
        childCount++;
    }
</script>


<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="question.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="60" rows="5" maxlength="1000" required="" value="${questionInstance?.description}"/>
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
	<g:textArea name="analysis" cols="60" rows="5" maxlength="1000" value="${questionInstance?.analysis}"/>
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
	<div id="childList">
    	<g:each var="answer" in="${questionInstance?.answers?}" status="i">
        	<div id="answer${i}">
    			<g:hiddenField name='answers[${i}].id' value='${answer.id}'/>
    			<g:textField name='answers[${i}].serialNum' value='${answer.serialNum}' size='1'/>
    			<g:textField name='answers[${i}].content' value='${answer.content}' size='60'/>
    			<g:checkBox name='answers[${i}].correct' value='${answer.correct}'/>
    			<input type="hidden" name='answers[${i}].deleted' id='answers[${i}].deleted' value='false'/>
    			<span onClick="$('#answers\\[${i}\\]\\.deleted').val('true'); $('#answer${i}').hide()"><img src="${resource(dir:'images/skin', file:'database_delete.png')}" /></span>
			</div>
    	</g:each>
	</div>
	<input type="button" value="Add answer" onclick="console.log($('#answers\\[0\\]\\.deleted')); console.log($('#answers\\[1\\]\\.deleted')); addChild();" />
	</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'inputBy', 'error')} required">
	<label for="inputBy">
		<g:message code="question.inputBy.label" default="Input By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="inputBy" name="inputBy.id" from="${ots.AdminUser.list()}" optionKey="id" required="" value="${questionInstance?.inputBy?.id}" class="many-to-one"/>
</div>


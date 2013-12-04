package ots

import org.springframework.dao.DataIntegrityViolationException

class QuestionController {

	static def lastQuestionType
	static def lastQuestionSource
	static def lastQuestionTerm
	static def lastQuestionInputBy

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def rememberDuplicateFields(Question questionInstance) {
		log.error "rem: " + questionInstance.type
		lastQuestionType = questionInstance.type
		lastQuestionSource = questionInstance.source
		lastQuestionTerm = questionInstance.term
		lastQuestionInputBy = questionInstance.inputBy
	}

	def setDuplicateFields(Question questionInstance) {
		log.error "set: " + lastQuestionType
		
		questionInstance.type = lastQuestionType
		questionInstance.source = lastQuestionSource
		questionInstance.term = lastQuestionTerm
		questionInstance.inputBy = lastQuestionInputBy
	}

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [questionInstanceList: Question.list(params), questionInstanceTotal: Question.count()]
    }

    def create() {
		Question newQuestion = new Question(params)
		def defaultVal = session["defaultValue"]
		if (defaultVal) {
			newQuestion.type = defaultVal["type"]
			newQuestion.source = defaultVal["source"]
			newQuestion.term = defaultVal["term"]
			newQuestion.inputBy = defaultVal["inputBy"]
		}
		//setDuplicateFields newQuestion
        [questionInstance: newQuestion]
    }

    def save() {
        def questionInstance = new Question(params)
				
        if (!questionInstance.save(flush: true)) {
            render(view: "create", model: [questionInstance: questionInstance])
            return
        }

		def defaultVal = [type: questionInstance.type, source: questionInstance.source, term: questionInstance.term,
			              inputBy: questionInstance.inputBy]
		session["defaultValue"] = defaultVal
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
        redirect(action: "show", id: questionInstance.id)
    }

	def test(Long id) {
		def questionInstance = Question.get(id)
		if (!questionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
			redirect(action: "list")
			return
		}

		[questionInstance: questionInstance]
	}

    def show(Long id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        [questionInstance: questionInstance]
    }

    def edit(Long id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        [questionInstance: questionInstance]
    }

    def update(Long id, Long version) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (questionInstance.version > version) {
                questionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'question.label', default: 'Question')] as Object[],
                          "Another user has updated this Question while you were editing")
                render(view: "edit", model: [questionInstance: questionInstance])
                return
            }
        }

        questionInstance.properties = params
		
		def defaultVal = [type: questionInstance, source: questionInstance.source, term: questionInstance.term,
			              inputBy: questionInstance.inputBy]
		session["defaultValue"] = defaultVal

		questionInstance.answers.removeAll { it.deleted }
		
        if (!questionInstance.save(flush: true)) {
            render(view: "edit", model: [questionInstance: questionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
        redirect(action: "show", id: questionInstance.id)
    }

    def delete(Long id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        try {
            questionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "show", id: id)
        }
    }
}

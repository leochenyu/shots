package ots

class Answer {

	String serialNum
	String content
	boolean correct
	boolean deleted
	
	static transients = [ 'deleted' ]
	String toString () {
		"${serialNum}: ${content} - ${correct}"
	}
	
	static belongsTo = [question : Question]
	
    static constraints = {
		serialNum(inList: ["A", "B", "C", "D", "E", "F", "1", "2", "3", "4", "5", "6", "7", "8", "9"])
		content blank : false
		deleted bindable: true
    }
}

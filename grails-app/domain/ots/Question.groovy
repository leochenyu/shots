package ots

class Question {

	String type
	String description
	String source
	String term
	String analysis
	int errorRate
	Date inputDate
	List answers = new ArrayList()
	
	static mapping = {
		answers cascade:"all-delete-orphan"
	}

	static belongsTo = [inputBy : AdminUser]
	static hasMany = [answers : Answer]

    static constraints = {
		description(blank : false, unique : true, maxSize:1000)
		type(nullable: false, blank: false, inList: ["单选", "填空"])
		source()
		term()
		analysis(maxSize:1000)
		inputDate(blank : false) 
		errorRate(display:false)
    }
}

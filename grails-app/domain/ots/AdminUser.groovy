package ots

class AdminUser {

	String userName
	String password
	String fullName
	String toString() {
		"${fullName}"
	}

	static hasMany = [question : Question]
	
	static constraints = {
		fullName()
		userName(unique: true)
		password(password: true)	
	}	
}

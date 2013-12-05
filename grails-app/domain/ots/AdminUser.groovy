package ots

class AdminUser {

	String userName
	String password
	String fullName
	String email
	String role = "inputer"
	String toString() {
		"${userName} - ${role}"
	}

	static transients = ['admin']
	
	boolean isAdmin(){
		return role == "admin"
	}
	static hasMany = [question : Question]
	
	static constraints = {
		userName(blank:false, nullable:false, unique: true)
		fullName()
		password(blank:false, password: true)
		email(email:true)
		role(inList:["admin", "checker", "inputer", "student", "instructor", "parent"])
	}	

}

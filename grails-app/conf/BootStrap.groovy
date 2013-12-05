import ots.AdminUser

class BootStrap {

    def init = { servletContext ->
		new	AdminUser(userName: "su", email: "steven.ding@gmail.com", password: "pw", fullName: "Steve Ding", role: "admin").save()
		new	AdminUser(userName: "in", email: "steven.ding@gmail.com", password: "in", fullName: "Inputer", role: "inputer").save()
		new	AdminUser(userName: "ch", email: "steven.ding@gmail.com", password: "ch", fullName: "checker", role: "checker").save()
    }
    def destroy = {
    }
}

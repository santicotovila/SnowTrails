import Foundation

struct DataBaseUsers: UserProtocol {
    var name: String
    
    var email: String
    
    var password: String
    
}

//-MARK: Basa de datos de usuarios

struct DataBaseStaff {
    
    // Lista de usuarios ya registrados,"base de datos" local.
    
    var usersRegistersRegular: [UserProtocol] = [
        DataBaseUsers(name:"Regularuserkeepcoding1", email:"regularuser@keepcoding.es", password: "Regularuser1")
    ]
    
    var usersRegistersStaff: [UserProtocol] = [
        DataBaseUsers(name:"Adminuserkeepcoding1", email:"adminuser@keepcoding.es", password: "Adminuser1")
    ]
    
}


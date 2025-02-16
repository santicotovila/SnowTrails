import Testing
@testable import SnowTrails

//MARK: Tests de la base de datos de usuarios.

@Suite("DataBaseStaff Tests")
class DataBaseStaffTests {
    var dataBaseStaff: DataBaseStaff!

    
    init() {
        dataBaseStaff = DataBaseStaff()
        
    }


    deinit {
        dataBaseStaff = nil
    }
    

    @Test("Users Regular que deberían existir en la base de datos")
    func testRegularUsersContent() async throws {
        
        // Verificar que el usuario normal existe
        let regularUser = dataBaseStaff.usersRegistersRegular.first
        #expect(regularUser?.name == "Regularuserkeepcoding1", "Se esperaba que el nombre de usuario fuese 'Regularuserkeepcoding1', pero a sido \(regularUser?.name ?? "nil")")
        #expect(regularUser?.email == "regularuser@keepcoding.es", "Se esperaba que el email de usuario fuese 'regularuser@keepcoding.es', pero a sido \(regularUser?.email ?? "nil")")
        #expect(regularUser?.password == "Regularuser1", "Se esperaba que la contraseña fuese 'Regularuser1', pero a sido \(regularUser?.password ?? "nil")")
    }

    @Test("Users Staff que deberían existir en la base de datos")
    func testStaffUsersContent() async throws {
      
        // Verificar que el usuario administrador existe
        let staffUser = dataBaseStaff.usersRegistersStaff.first
        #expect(staffUser?.name == "Adminuserkeepcoding1", "Se esperaba que el nombre de usuario fuese 'Adminuserkeepcoding1', pero a sido \(staffUser?.name ?? "nil")")
        #expect(staffUser?.email == "adminuser@keepcoding.es", "Se esperaba que el email de usuario fuese 'adminuser@keepcoding.es', pero a sido \(staffUser?.email ?? "nil")")
        #expect(staffUser?.password == "Adminuser1", "Se esperaba que la contraseña de usuario fuese 'Adminuser1', pero a sido \(staffUser?.password ?? "nil")")
    }

    @Test("Añadimos un usuario nuevo a la base de datos")
    func testAddRegularUser() async throws {
       
        
        // Agregar un nuevo usuario normal
        let newUser = DataBaseUsers(name: "NewUser", email: "newuser@keepCoding.com", password: "newuser123")
        dataBaseStaff.usersRegistersRegular.append(newUser)

        // Verificar que hay un usuario más en la base de datos
        #expect(dataBaseStaff.usersRegistersRegular.count == 2, "Se esperaban 2 usuarios en la base de datos, pero hay \(dataBaseStaff.usersRegistersRegular.count)")
    }
    
        //Eliminación de usuario.
    @Test("Eliminamos un usuario regular en la base de datos")
    
    func testDeleteRegularUser() async throws {
        
      
        
        #expect(dataBaseStaff.usersRegistersRegular.count == 1, "Se esperaban al menos 1 usuario regular en la base de datos, pero hay \(dataBaseStaff.usersRegistersRegular.count)")
        
        dataBaseStaff.usersRegistersRegular.removeLast()
        
        #expect(dataBaseStaff.usersRegistersRegular.count == 0, "Se esperaban 0 usuario en la base de datos, pero hay \(dataBaseStaff.usersRegistersRegular.count)")
    }
}


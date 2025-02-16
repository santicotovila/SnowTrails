import OSLog

//MARK: Bienvenida y gestión de usuario normal.

struct LogicMenuStaff {
    
    // Instancias para trabajar con base de datos.
    var dataBase = DataBaseStaff()
    var userStaff = UserStaff()

    
//Logica Menú
    
    // Mostrar todos los usuarios registrados
    func showAllUsers() -> String {
        let adminsInDataBase =  dataBase.usersRegistersStaff.map { "Admin: \($0.name) ----- Email: \($0.email)" }
        let usersInDataBase =  dataBase.usersRegistersRegular.map { "Regular: \($0.name)----- Email: \($0.email)"}
        return "\(adminsInDataBase)\n\(usersInDataBase)"
    }
    
    // Registro de usuario nuevo
    mutating func registerUserForStaff() -> Bool {
        Logger().info("Introduce el email del usuario que quieres añadir: ")
        guard let userEmail = readLine(), !userEmail.isEmpty, userEmail.contains("@"), userEmail.contains(".") else {
            Logger().info("Email no válido.")
            return false
        }
        
        // Verificación de usuarios existentes
        let userStaffExists = dataBase.usersRegistersStaff.contains { $0.email == userEmail }
        let userRegularExists = dataBase.usersRegistersRegular.contains { $0.email == userEmail }
        
        if userStaffExists || userRegularExists {
            Logger().info("Usuario existente.")
            return false
        }
        
        Logger().info("Introduce el nombre del usuario que quieres añadir:")
        guard let userName = readLine(), !userName.isEmpty else {
            Logger().info("Nombre inválido.")
            return false
        }
        
        Logger().info("Introduce la contraseña del usuario que quieres añadir: ")
        guard let userPassword = readLine(), !userPassword.isEmpty else {
            Logger().info("Contraseña inválida.")
            return false
        }
        
        // Crear un nuevo usuario
        let newUser = DataBaseUsers(name: userName, email: userEmail, password: userPassword)
        dataBase.usersRegistersRegular.append(newUser)
        Logger().info("La creación del usuario \(newUser.name) ha tenido éxito")
        return true
    }
    
    // Eliminar usuario de la base de datos.
    mutating func deleteUserRegular() {
        Logger().info("¿Cuál es el usuario que deseas eliminar? Introduce su nombre: ")
        let userToDelete = readLine() ?? ""
        
        if dataBase.usersRegistersRegular.contains(where: { user in
            user.name == userToDelete }) {
            dataBase.usersRegistersRegular.removeAll { $0.name == userToDelete }
            Logger().info("Usuario \(userToDelete) eliminado correctamente.")
        } else {
            Logger().error(" Usuario no encontrado. \(ErrorType.UserNotFound)")
        }
    }
 
}

struct MenuStaff {
    var logicMenuStaff = LogicMenuStaff()
    var infoRoutes = InfoRoutes()
    
    // Menú principal
    func featuresMenuStaff() -> String {
        print("""
            ¡Bienvenido! Selecciona una opción:
            1. Ver todos los usuarios
            2. Añadir usuario
            3. Eliminar usuario
            4. Añadir punto a una ruta
            5. Log out
            """)
        
        // Inicialización del bucle hasta que selectUserOption contenga cualquier valor de la lista.
        while true {
            guard let selectUserOption = readLine(), !selectUserOption.isEmpty else {
                Logger.consoleUILogger.info("Entrada inválida. Inténtalo de nuevo.")
                continue
            }
            
            if ["1", "2", "3", "4", "5"].contains(selectUserOption) {
                return selectUserOption
            } else {
                Logger.consoleUILogger.info("Elección errónea. Inténtalo de nuevo.")
            }
        }
    }
    
    //Tratamos las diferentes opciones llamando a las respectivas funciones.
    mutating func selectOptionStaff() {
        let optionStaff = featuresMenuStaff()
        _ = App()
        
        switch optionStaff {
        case "1":
            print(logicMenuStaff.showAllUsers())
        case "2":
            logicMenuStaff.registerUserForStaff()
        case "3":
            logicMenuStaff.deleteUserRegular()
        case "4":
            infoRoutes.addPointRoute()
        case "5":
            Logger.consoleUILogger.info("Cerrando sesión...")
            App().run() //Reiniciamoz el menú de inicio.
        default:
            Logger.consoleUILogger.info("Opción no válida.")
        }
    }
}

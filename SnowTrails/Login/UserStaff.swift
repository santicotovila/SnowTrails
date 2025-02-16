
import Foundation
import OSLog


//MARK: Todo lo necesario para el login de usuario staff.

struct UserStaff{
    let dataStaff = DataBaseStaff() //Instanciamos
    
    func askDataLogin() throws {
        
        Logger.consoleUILogger.info("Introduce tu correo electrónico: ")
        guard let emailUser = readLine(), !emailUser.isEmpty, emailUser.contains("@") else {
            throw ErrorType.ContainsInvalidCharacter  // Lanza error si el email no es válido porque no cumple con cacteristicas indicadas.
        }

        Logger.consoleUILogger.info("""
            ✅ Email válido
            🔄 Comprobando...
            """)
        
        sleep(3) // Para hacerlo algo mas real incluso,como si hubiese una api y no una lista 😅
        
        // Buscar el usuario en la base de datos
        guard let user = dataStaff.usersRegistersStaff.first(where: { $0.email == emailUser }) else {
            throw ErrorType.UserNotFound  // Lanza error si el usuario no existe
        }

        Logger.consoleUILogger.info("🔑 Correo verificado, ingrese su contraseña: ")

        guard let passwordUser = readLine(), !passwordUser.isEmpty else {
            throw ErrorType.ValidateError  // Lanza error si la contraseña está vacía
        }

        Logger.consoleUILogger.info("🔄 Comprobando password...")
        
        sleep(3) // Para hacerlo algo mas real incluso,como si hubiese una api y no una lista 😅

        if user.password == passwordUser {
            Logger.consoleUILogger.info("✅ Verificación exitosa, bienvenido \(user.name) 👋🏽")
        } else {
            throw ErrorType.ValidateError // Lanza error si la contraseña es incorrecta
        }
    }
    
    
    //Intentamos ejecutar askDataLogin y capturamos el error si no se consigue ejecutar.
    
    func login() {
        
        do {
            try askDataLogin()
        } catch ErrorType.ContainsInvalidCharacter {
            Logger.consoleUILogger.info(" Error: Email no válido, inténtalo de nuevo.")
        } catch ErrorType.UserNotFound {
            Logger.consoleDeveloperLogger.error(" Error: Usuario no encontrado.")
        } catch ErrorType.ValidateError {
            Logger.consoleDeveloperLogger.error(" Error: Contraseña incorrecta.")
        } catch {
            Logger.consoleDeveloperLogger.error("Error inesperado: \(ErrorType.Stranger)")
        }
    }
}

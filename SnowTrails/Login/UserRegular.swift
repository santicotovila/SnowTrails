import Foundation
import OSLog


//MARK: Todo lo necesario para el login de usuario normal.

struct UserRegular {
    
    let dataStaff = DataBaseStaff()
    
    func askDataLogin() throws { //SOlicitamos información del login teniendo en cuenta la posibilidad de error.
        
        
        Logger.consoleUILogger.info("Introduce tu correo electrónico: ")
        guard let emailUser = readLine(), !emailUser.isEmpty, emailUser.contains("@") else {
            throw ErrorType.ContainsInvalidCharacter  // Lanza error si el email no es válido
        }
        
        Logger.consoleUILogger.info("""
            ✅ Email válido
            🔄 Comprobando...
            """)
        sleep(3) // Para hacerlo algo mas real incluso,como si hubiese una api y no una lista 😅
        
        // Buscar el usuario en la base de datos
        guard let user = dataStaff.usersRegistersRegular.first(where: { $0.email == emailUser }) else {
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
            sleep(3)
        } else {
            throw ErrorType.ValidateError // Lanza error si la contraseña es incorrecta
        }
    }
    
    //Intentamos el login y el bucle no finaliza hasta que se obtiene,convirtiendo el valor de trylogin.
    
    func login() {
        
        var tryLogin: Bool = false
        
        while !tryLogin {
            
            do {
                try askDataLogin()
                tryLogin = true
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
}

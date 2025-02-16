import Foundation
import OSLog

class App {
    //Instanias para iniciación
    
    let screenController = Screen()
    let loginRegular = UserRegular()
    let loginStaff = UserStaff()
    let menuRegularController = MenuRegular()
    let routesInfo = InfoRoutes()
    let loadDataJson = LoadDataJson()
    var logicMenuStaff = LogicMenuStaff()
    var menuStaffController = MenuStaff()
    
    func run() {
        
        var logOut = true
        
        while logOut {
            
            
            // Mostrar menú de bienvenida
            screenController.welcomeMenu()
            
            //Solicitud usuario
            guard let userSelect = readLine(), !userSelect.isEmpty else {
                Logger.consoleUILogger.info("Entrada inválida.")
                return
            }
            
            //Invocamos a las respectivas funciones según el interes de usuario.
            switch userSelect {
            case "1":
                // Login de usuario regular
                loginRegular.login()
                menuRegularController.showAllRoutes()
                
            case "2":
                // Login de usuario staff
                loginStaff.login()
                menuStaffController.selectOptionStaff()
            case "3":
                print("Gracias por usar SnowTrails!👋🏽")
                logOut = false
                
            default:
                Logger.consoleUILogger.info("Opción no válida.")
            }
        }
    }
}

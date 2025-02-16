import OSLog

//MARK: Bienvenida y gestión de usuario normal.

struct MenuRegular {
    func featuresMenu() -> String {
        print("""
                ¡Bienvenido! Selecciona una opción:
                1. Ver todas las rutas
                2. Obtener la ruta mas corta entre dos puntos
                3. Log out
""")
        
        //Tratamos la opción del usuario,cubriendo todos los casos de que la elección no este en el rango interesado.
        while true {
            
            guard let selectUserOption = readLine(), !selectUserOption.isEmpty else {
                Logger.consoleUILogger.info("Entrada inválida. Intentalo de nuevo.")
                continue
            }
            
            switch selectUserOption {
            case "1":
                return "1"
            case "2":
                return "2"
            case "3":
                return "3"
            default:
                Logger.consoleUILogger.info("Elección erronea. Intentalo de nuevo.")
                continue
                
            }
            
            
        }
        
    }
    
    
    
    func showAllRoutes() {
        _ = App() // Lo sustituí por _ porque se quejaba de que no lo usase
        let loadDataJson = LoadDataJson()
        let infoRoutes = InfoRoutes()
        let welcomeMenu = Screen()
        
        let optionUser = featuresMenu()
        
        //Si usuario pulsa 1 mostrataremos todas las rutas con solo dos decimales como se solicito.
        //Si pulsa 2 informamos de la ruta corta
        //Si pulsa 3 informamos de cierre de sesión y volvemos a presentar menú inicial.
        
        if optionUser == "1" {
            if let mountainData = loadDataJson.loadJSONFromFile() {
                for route in mountainData.routes {
                    let totalDistance = infoRoutes.calculateTotalDistance(route, mountains: mountainData.mountains)
                    let formatDistance = String(format: "%.2f", totalDistance)
                    print("Ruta \(route.name) - \(formatDistance) km")
                }
            } else {
                Logger.consoleDeveloperLogger.error("No se pudieron cargar las rutas.")
            }
        } else if optionUser == "2" {
            infoRoutes.getRoutMoreShort()
            welcomeMenu.welcomeMenu()
        } else if optionUser == "3" {
            Logger.consoleUILogger.info("Cerrando sesión...")
            App().run()
        } else {
            Logger.consoleUILogger.info("Opción no válida.")
        }
    }


        }
     
            
  



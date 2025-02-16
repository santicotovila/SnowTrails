

import Foundation
import OSLog

//MARK: Ejecución programa.

func main() {
    App().run()
    
}

main()

//Gestión de información desarrollador y usuario.

extension Logger {
    static let consoleUILogger = Logger(subsystem: "SnowTrails", category: "LogsDelUsuario")
    static let consoleDeveloperLogger = Logger(subsystem: "SnowTrails", category: "LogsDelDesarrollador")
}


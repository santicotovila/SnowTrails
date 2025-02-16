import Foundation
import OSLog

//MARK: Estructura para acceso al JSON y poder trabajar con todo lo necesario para obtención de rutas.

struct Mountain: Codable {
    let name: String
    let latitude: Double
    let longitude: Double
    let elevation: Double
    let connections: [String]
}

struct Route: Codable {
    let name: String
    let points: [String]
}

struct MountainData: Codable {
    let mountains: [Mountain]
    let routes: [Route]
}


// Me vine arriba haciendo las tablas en archivo Json y he  tenido problemas para acceder al Json y me he decantado por pedir información,ahora por lo menos ya se acceder a diferentes situaciones de Json.

//Acceso a Json en local.
struct LoadDataJson {
        func loadJSONFromFile() -> MountainData? {
            let currentDirectory = FileManager.default.currentDirectoryPath
            let jsonURL = URL(fileURLWithPath: currentDirectory).appendingPathComponent("Data.json")
            
            do {
                let jsonData = try Data(contentsOf: jsonURL)
                let decoder = JSONDecoder()
                let mountainData = try decoder.decode(MountainData.self, from: jsonData)
                return mountainData
            } catch {
                Logger.consoleDeveloperLogger.error("Error al leer o parsear el archivo JSON: \(ErrorType.Stranger)")
                return nil
            }
        }
    }
    

//MARK: Structura para obtener todo lo necesario respecto rutas.

struct InfoRoutes {
        
        // Función de Haversine para obtención de distancias.
    
        func getDistanceWithHaversine(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
            let radius = 6371.0  // Radio de la Tierra en kilómetros
            
            let dLat = (lat2 - lat1) * .pi / 180
            let dLon = (lon2 - lon1) * .pi / 180
            let lat1Rad = lat1 * .pi / 180
            let lat2Rad = lat2 * .pi / 180
            
            let a = sin(dLat / 2) * sin(dLat / 2) +
            cos(lat1Rad) * cos(lat2Rad) *
            sin(dLon / 2) * sin(dLon / 2)
            let c = 2 * atan2(sqrt(a), sqrt(1 - a))
            
            return radius * c
        }
        
        // Función para calcular la distancia total de una ruta
        func calculateTotalDistance(_ route: Route, mountains: [Mountain]) -> Double {
            var totalDistance = 0.0 //La inicio con Double para no tener problemas con la conversión.
            
            
            var mountainPairs: [(String, Mountain)] = []
            
            for mountain in mountains {
                mountainPairs.append((mountain.name, mountain))
            }
            
            // Convertimos el array en un diccionario
            let mountainDict = Dictionary(uniqueKeysWithValues: mountainPairs)
            
            
            // Iteramos sobre los puntos de la ruta
            for index in 0..<route.points.count - 1 {
                if let startMountain = mountainDict[route.points[index]],
                   let endMountain = mountainDict[route.points[index + 1]] {
                    
                    let distance = getDistanceWithHaversine(
                        lat1: startMountain.latitude,
                        lon1: startMountain.longitude,
                        lat2: endMountain.latitude,
                        lon2: endMountain.longitude
                    )
                    totalDistance += distance
                }
            }
            
            return totalDistance
        }
        
        
        // Conseguimos la ruta mas corta entre dos puntos.
        //Como todavía no se a implementado informamos a usuario.
        
        func getRoutMoreShort() {
            
            Logger.consoleUILogger.info("""
                Todavía no se ha implementado esta característica.
                ¡Pronto dispondremos de actualizaciones! ✌🏽
                Volviendo al inicio...
""")
            
            sleep(3) //Relentizamos programa antes de volver al inicio.
            
        }
    
    //Función para añadir puntos a la ruta
    //Como todavía no se a implementado informamos a usuario.
    
    func addPointRoute() {
        Logger.consoleUILogger.info("""
                Todavía no se ha implementado esta característica.
                ¡Pronto dispondremos de actualizaciones! ✌🏽
                Volviendo al inicio...
""")
        
        sleep(3)
        
    }
        
        
        
    }


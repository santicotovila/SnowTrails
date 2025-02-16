import Foundation
import OSLog


//-MARK: Protocols, enums and requeriments basics.

// Utilizo esto de manera aislada para tener el codigo organizado y poder acceder a lo que necesite.

public enum ErrorType: String, Error {
    
    case JsonFaildDecode
    case ValidateError
    case ContainsInvalidCharacter
    case UserNotFound
    case Stranger
    
    
    
}



protocol UserProtocol {
    var name: String { get set }
    var email: String { get set }
    var password: String { get set }
   
}

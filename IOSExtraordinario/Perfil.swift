//
//  Perfil.swift
//  IOSExtraordinario
//
//  Created by CONRADO DELSO GONZALEZ on 28/6/18.
//  Copyright © 2018 CONRADO DELSO GONZALEZ. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    var sNombre:String?
    var sEmail:String?
    
    
    func setMap(valores:[String:Any]) {
        sNombre = valores["nombre"] as? String
        sEmail = valores["email"] as? String
        
        print("Nombre: ",sNombre)
        print("Email: ",sEmail)
    }
    
    func getMap() -> [String:Any] {
        return[
            "nombre": sNombre as Any,
            "email": sEmail as Any,
        ]
    }
}

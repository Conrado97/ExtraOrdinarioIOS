//
//  COSAS.swift
//  IOSExtraordinario
//
//  Created by CONRADO DELSO GONZALEZ on 28/6/18.
//  Copyright © 2018 CONRADO DELSO GONZALEZ. All rights reserved.
//

import UIKit

class COSAS: NSObject {
    let IDnombre = "nombre"
    let IDfoto = "foto"
    
    var sID:String?
    var sNombre:String?
    var sFoto:String?
    
    func setMap(valores:[String:Any]) {
        sNombre = valores[IDnombre] as? String
        sFoto = valores[IDfoto] as? String
    }
    
    func getMap() -> [String:Any] {
        return[
            IDnombre: sNombre as Any        ]
    }
}

//
//  DataHolder.swift
//  IOSExtraordinario
//
//  Created by CONRADO DELSO GONZALEZ on 28/6/18.
//  Copyright © 2018 CONRADO DELSO GONZALEZ. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    
    var fireStoreDB:Firestore?
    var firStorageRef:StorageReference?
    var fireStorage:Storage?
    
    var miPerfil:Perfil = Perfil()
    var user:String = ""
    var email:String = ""
    var pass:String = ""
    var repass:String = ""
    
    var HMIMG :[String: UIImage]?=[:]
    var arColumnas:[Cosas] = []
    
    
    func initFirebase(){
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        fireStorage = Storage.storage()
        firStorageRef = fireStorage?.reference()
    }
    
    func Registro(delegate:DataHolderDelegate,sEmail:String, sPass:String) {
        Auth.auth().createUser(withEmail: email, password: pass){
            (email, error)in
            
           if self.email != "" && self.user != ""{
                print ("te has registrado")
                print(self.email)
                print(self.user)
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((email?.uid)!).setData(["email"
                    :self.email, "nombre":self.user])
                delegate.dataHolderRegister!(blfin: true)
            }
            else{
                print(error!)
                delegate.dataHolderRegister!(blfin: false)
            }
        }
    }
    
    var sID:String = ""
    func Login(delegate:DataHolderDelegate, sEmail:String, sContrasena:String) {
        print("Hola " + sEmail)
        
        Auth.auth().signIn(withEmail: sEmail, password: sContrasena) {(email, error) in
            if sEmail != ""{
                self.sID = (email?.uid)!
                let ruta = DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((email?.uid)!)
                
                ruta?.getDocument { (document, error) in
                    if document != nil{
                        
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        
                        delegate.dataHolderLogin!(blfin: true)
                        
                    }
                    else{
                        print(error!)
                    }
                }
            }
            else{
                print("error de sesion")
                delegate.dataHolderLogin!(blfin: false)
            }
        }
    }
    
    
    func bajarImagenes(clave:String, delegate:DataHolderDelegate){
        if self.HMIMG![clave] == nil{
            let gsReference = self.fireStorage?.reference(forURL: clave)
            gsReference?.getData(maxSize: 1 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print(error!)
                }
                else{
                    let imgDescargada = UIImage(data: data!)
                    self.HMIMG?[clave] = imgDescargada
                    delegate.imagen!(imagen: imgDescargada!)
                    
                }
            }
            )
            
        }
        else{
            delegate.imagen!(imagen:self.HMIMG![clave]!)
        }
        print("imagen lista")
    }
    
    func descargarCapuchas(delegate:DataHolderDelegate){
        
        DataHolder.sharedInstance.fireStoreDB?.collection("Cosas").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                delegate.DHDDescargaCosa!(blnFin: false)
            } else {
                self.arColumnas=[]
                for document in querySnapshot!.documents {
                    let cosa:Cosas = Cosas()
                    cosa.sID=document.documentID
                    cosa.setMap(valores: document.data())
                    self.arColumnas.append(cosa)
                    print("\(document.documentID) => \(document.data())")
                }
                print("----->>>> ",self.arColumnas.count)
                delegate.DHDDescargaCosa!(blnFin: true)
            }
        }
    }
    
}
@objc protocol DataHolderDelegate{
    @objc optional func dataHolderRegister(blfin:Bool)
    @objc optional func dataHolderLogin(blfin:Bool)
    @objc optional func imagen(imagen:UIImage)
    @objc optional func DHDDescargaCosa(blnFin:Bool)
}

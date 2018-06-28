//
//  Registrar.swift
//  IOSExtraordinario
//
//  Created by CONRADO DELSO GONZALEZ on 28/6/18.
//  Copyright © 2018 CONRADO DELSO GONZALEZ. All rights reserved.
//

import UIKit
import Firebase

class Registro: UIViewController, DataHolderDelegate {
    
    @IBOutlet var User: UITextField?
    @IBOutlet var Email: UITextField?
    @IBOutlet var Password: UITextField?
    @IBOutlet var RePassword: UITextField?
    
    @IBOutlet var Salir: UIButton?
    @IBOutlet var Aceptar: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        EMail?.text = DataHolder.sharedInstance.email
        User?.text = DataHolder.sharedInstance.user
        Contraseña?.text = DataHolder.sharedInstance.pass
      
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickRegister(){
        
        
        DataHolder.sharedInstance.email = (EMail?.text)!
        DataHolder.sharedInstance.user = (User?.text)!
        DataHolder.sharedInstance.pass = (Contraseña?.text)!
      
        
        
        DataHolder.sharedInstance.Registro(delegate: self, sEmail: (Email?.text)!, sPass: (Password?.text)!)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    func dataHolderRegister(blfin: Bool) {
        if blfin==true{
            self.performSegue(withIdentifier: "registrado", sender: self)
        }
    }
}

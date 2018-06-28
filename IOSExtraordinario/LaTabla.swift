//
//  LaTabla.swift
//  IOSExtraordinario
//
//  Created by CONRADO DELSO GONZALEZ on 28/6/18.
//  Copyright © 2018 CONRADO DELSO GONZALEZ. All rights reserved.
//

import UIKit
import Firebase

class LaTabla: UITableViewCell, DataHolderDelegate {
    
    @IBOutlet var labelNombre:UILabel?
    @IBOutlet var   LaImagen:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var ImagenDescargada:UIImage?
    
    func descargarImagenes(url:String){
        self.LaImagen?.image = nil
        print("damn son")
        DataHolder.sharedInstance.bajarImagenes(clave: url, delegate: self)
        
    }
    func imagen(imagen: UIImage) {
        self.LaImagen?.image = imagen
    }
}

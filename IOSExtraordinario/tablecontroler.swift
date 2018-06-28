//
//  tablecontroler.swift
//  IOSExtraordinario
//
//  Created by CONRADO DELSO GONZALEZ on 28/6/18.
//  Copyright © 2018 CONRADO DELSO GONZALEZ. All rights reserved.
//

import UIKit

class tablecontroler: UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate {
    
    
    @IBOutlet var tbMiTabla:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.descargarCosas(delegate: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDDescargaCosa(blnFin: Bool){
        if blnFin == true{
            self.refreshUI()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataHolder.sharedInstance.arColumnas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LaTabla = tableView.dequeueReusableCell(withIdentifier: "Cell")as! LaTabla
        
        cell.labelNombre?.text = DataHolder.sharedInstance.arColumnas[indexPath.row].sNombre
        cell.descargarImagenes(url: DataHolder.sharedInstance.arColumnas[indexPath.row].sFoto!)
        
        return cell
        
        
    }
    
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.tbMiTabla?.reloadData()
        })
    }
    
    
}

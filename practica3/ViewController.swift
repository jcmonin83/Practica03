//
//  ViewController.swift
//  practica3
//
//  Created by DISMOV on 28/03/22.
//

import UIKit

class ViewController: UITableViewController {

    var datos = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obtenerDatos()
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reutilizaesto", for: indexPath)
        let elDict = datos[indexPath.row]
        cell.textLabel?.text = elDict["name"] as? String ?? "\(indexPath.row)"
        cell.imageView?.image = UIImage(named: "drink")
        return cell
    }
    
    func obtenerDatos()
    {
        if let archivo = Bundle.main.url(forResource: "Drinks", withExtension: "plist"){
            do{
                let bytes = try Data.init(contentsOf: archivo)
                let tmp = try PropertyListSerialization.propertyList(from: bytes,options: .mutableContainers, format: nil)
                datos = tmp as! [[String:Any]]
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "drinksdetalle", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nuevoVC = segue.destination as! ViewControllerD
        if let indexPath = tableView.indexPathForSelectedRow{
            let Bebida = datos[indexPath.row]
            nuevoVC.bebida = Bebida
        }
    }

}

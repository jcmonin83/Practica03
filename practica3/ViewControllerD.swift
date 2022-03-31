//
//  ViewControllerD.swift
//  practica3
//
//  Created by DISMOV on 29/03/22.
//

import UIKit

class ViewControllerD: UIViewController {
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Ingredients: UITextView!
    @IBOutlet weak var Instructions: UITextView!
    @IBOutlet weak var scroll: UIScrollView!
    
    var bebida = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Ingredients.isEditable = false
        Instructions.isEditable = false
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Name.text = bebida["name"] as? String
        Ingredients.text = bebida["ingredients"] as? String
        Instructions.text = bebida["directions"] as? String
        Image.image = UIImage(named: bebida["image"] as? String ?? "")
    }
    
    /*override func viewWillLayoutSubviews() {
        scroll.contentLayoutGuide.widthAnchor.constraint(equalTo: scroll.frameLayoutGuide.widthAnchor, constant: 0).isActive = true
        scroll.contentLayoutGuide.heightAnchor.constraint(equalTo:scroll.frameLayoutGuide.heightAnchor, constant: 20).isActive = true
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  registro.swift
//  waterfy
//
//  Created by Laboratorio UNAM-Apple 01 on 30/11/18.
//  Copyright © 2018 rbcoders. All rights reserved.
//

import UIKit

class Registro: UIViewController {
    
    @IBOutlet weak var imagenMar: UIImageView!
    @IBOutlet weak var textFieldNombre: UITextField!
    @IBOutlet weak var textFieldPeso: UITextField!
    @IBAction func continuarPresionado(_ sender: UIButton) {
        if textFieldPeso.text != ""  && textFieldNombre.text != "" {
            self.performSegue(withIdentifier: "pasoDeDatos", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controlerPrincipal  = segue.destination as! Principal
        controlerPrincipal.pesoPersona = Int(textFieldPeso.text!)!
        controlerPrincipal.cadenaNombre = textFieldNombre.text!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Medidas"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

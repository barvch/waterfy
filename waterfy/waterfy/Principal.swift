//
//  Principal.swift
//  waterfy
//
//  Created by Laboratorio UNAM-Apple 01 on 30/11/18.
//  Copyright © 2018 rbcoders. All rights reserved.
//

import UIKit

class Principal: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Resúmen"
        nombreUsuario.text = cadenaNombre
        print("\(pesoPersona)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Variables para los Segues
    
    var centinela = false
    
    lazy var pesoPersona = Int()
    @IBOutlet weak var nombreUsuario: UILabel!
    var cadenaNombre = String()
    
    @IBOutlet weak var lblTimer: UILabel!
    var time = 0
    var timer  = Timer()
    
    @IBAction func equilibrioPressed(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(Principal.action), userInfo: nil, repeats: true)
        centinela = true
    }
    
    @objc func action() {
        //if centinela == true {
          //  timer.invalidate()
        //}
        
        lblTimer.text = "0" //Reset
        time += 1 //Incrementa los ml de Agua de se deben de tomar.
        lblTimer.text = "\(String(time)) ml" //Hace el Display en pantalla.
    }

}

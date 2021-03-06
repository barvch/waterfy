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
        vasosUsuario.text = String(calcularPeso(peso: pesoPersona))
        alerta(titulo: "Todo Listo", mensaje: "Presina el botón de abajo para empezar a contar el agua que bebes.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var mlTomados: UILabel!
    
    // Variables para los Segues
    
    lazy var pesoPersona : Int = 0
    @IBOutlet weak var nombreUsuario: UILabel!
    var cadenaNombre = String()
    
    @IBOutlet weak var vasosUsuario: UILabel!
    var cantidadTomada = 0
    
    
    @IBOutlet weak var lblTimer: UILabel!
    var time = 0
    var timer  = Timer()
    
    func calcularPeso(peso: Int) -> Int {
        var vasosPorDia = peso / 7
        return vasosPorDia
    }
    
    func calcularCantidadAguaPorMinuto() -> Int {
        var mlPorMin = ((calcularPeso(peso: pesoPersona) * 250) / 24) / 60
        return mlPorMin
    }
    
    func aguaPorDia() -> Int {
        var res = calcularPeso(peso: pesoPersona) * 250 // Cantidad en ml que debe de tomar en el día
        return res
        
    }
    
    func alerta(titulo: String, mensaje : String) { // Para crear alertas.
        let alertaObjeto = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        
        alertaObjeto.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alertaObjeto.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alertaObjeto, animated: true, completion: nil) //Display
    }

    
    
    @IBAction func equilibrioPressed(_ sender: UIButton) {
        cantidadTomada += time
        
        mlTomados.text = "\(cantidadTomada) ml de agua tomados hoy."
        
        if cantidadTomada >= aguaPorDia() {
            alerta(titulo: "¡Felicidades!", mensaje: "Tomaste el agua necesaria por hoy. Tómate un descanso.")
        } else {
            time = 0
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Principal.action), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func action() {
            lblTimer.text = "0" // Reset
            time += calcularCantidadAguaPorMinuto() // Incrementa los ml de Agua de se deben de tomar.
            lblTimer.text = "\(String(time)) ml" // Hace el Display en pantalla.
        }
        
    }

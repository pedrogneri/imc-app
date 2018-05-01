//
//  ViewController.swift
//  IMC
//
//  Created by Pedro Guilherme Neri on 02/03/2018.
//  Copyright © 2018 Pedro Guilherme Neri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tfWeigth: UITextField!
    @IBOutlet weak var tfHeigth: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    
    @IBOutlet weak var viResults: UIView!
    
    var imc: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func Calculate(_ sender: Any) {
        if let weight = Double(tfWeigth.text!),let heigth = Double(tfHeigth.text!){
            
            imc = weight / (heigth*heigth)
            showResults()
            
        }
    }
    
    func showResults(){
        var result: String = ""
        var image: String = ""
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do Peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso Ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobre Peso"
                image = "sobre"
            default:
                result = "Obresidade"
                image = "obesidade"
        }
        lbResult.text = "\(Float(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        viResults.isHidden = false
        view.endEditing(true)
    }
    
}


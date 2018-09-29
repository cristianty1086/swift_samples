//
//  LanguageViewController.swift
//  evalfinal1
//
//  Created by Cristian Tinoco Yurivilca on 7/09/18.
//  Copyright © 2018 inkataxi. All rights reserved.
//

import Foundation
import UIKit

//idioma
// 0, english
// 1, spanish
var languageSelect : Int = 0

class LanguageViewController : UIViewController
{
    
    @IBOutlet weak var textMessage: UILabel!
    @IBOutlet weak var nameBtnSpanish: UIButton!
    @IBOutlet weak var nameBtnEnglish: UIButton! 
    
    override func viewDidLoad() {
        
        if( languageSelect == 0 ){
            textMessage.text = "Choose a language"
            nameBtnSpanish.setTitle("Spanish", for: .normal)
            nameBtnEnglish.setTitle("English", for: .normal)
        }
        else{
            textMessage.text = "Seleccione un idioma"
            nameBtnSpanish.setTitle("Espańol", for: .normal)
            nameBtnEnglish.setTitle("Ingles", for: .normal)
        }
        
    }
    
    @IBAction func btnSpanish(_ sender: Any) {
        languageSelect = 1
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnEnglish(_ sender: Any) {
        languageSelect = 0
        self.dismiss(animated: true, completion: nil)
    }
    

}

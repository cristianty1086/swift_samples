//
//  DetailViewController.swift
//  evalfinal1
//
//  Created by Cristian Tinoco Yurivilca on 7/09/18.
//  Copyright © 2018 inkataxi. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController
{
    
    
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var imageConcept: UIImageView!
    @IBOutlet weak var textConcept: UITextView!
    @IBOutlet weak var nameBtnLink: UIButton! 
    
    var conceptProgramming : ConceptProgramming?
    
    @IBAction func btnLink(_ sender: Any) {
        
        let str_url : String = conceptProgramming!.linkWikipedia!
        let urlStr : NSString = str_url.addingPercentEscapes(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))! as NSString
        let url : URL = URL(string: urlStr as String)!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    override func viewDidLoad() {
        
        if( conceptProgramming?.nameTitle != nil ){
            textTitle.text = conceptProgramming?.nameTitle
        }
        else{
            if( languageSelect == 0 ){
                textTitle.text = "Choose an option"
            }
            else{
                textTitle.text = "Seleccione una opcion"
            }
        }
        
        if( conceptProgramming?.nameImage != nil ){
            textConcept.text = conceptProgramming?.descrContent
        }
        
        if( conceptProgramming?.nameImage != nil ){
            imageConcept.image = UIImage(named: (conceptProgramming?.nameImage!)!)
        }
        
        if( conceptProgramming != nil ){
            if( languageSelect == 0 ){
                nameBtnLink.setTitle("From Wikipedia", for: .normal)
            }
            else{
                nameBtnLink.setTitle("Fuente Wikipedia", for: .normal)
            }
        }
        else{
            nameBtnLink.isHidden = true
        }
        
    }

    
}

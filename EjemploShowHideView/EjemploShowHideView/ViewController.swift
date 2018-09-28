//
//  ViewController.swift
//  EjemploShowHideView
//
//  Created by Cristian Tinoco Yurivilca on 28/09/18.
//  Copyright © 2018 Cristian Tinoco Yurivilca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var viewFooter: UIView!
    @IBOutlet weak var coleccion: UICollectionView!
    
    @IBOutlet weak var heightVF: NSLayoutConstraint!
    var isShowFooter : Bool = false
    var h0 : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        h0 = heightVF.constant
    }

    @IBAction func showHide(_ sender: Any) {
        
        if( isShowFooter ){
            //viewFooter.isHidden = false
            heightVF.constant = 0
        }
        else{
            //viewFooter.isHidden = true
            heightVF.constant = h0
        }
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        isShowFooter = !isShowFooter
        
    }
    
}


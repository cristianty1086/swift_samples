//
//  ViewController.swift
//  EjemploContentLayout
//
//  Created by Cristian Tinoco Yurivilca on 28/09/18.
//  Copyright © 2018 Cristian Tinoco Yurivilca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    var customA : UIViewController?
    var customB : UIViewController?
    var customC : UIViewController?
    var customD : UIViewController?
    
    var activeViewController : UIViewController?{
        didSet{
            removeInactiveVC(inactiveVC: oldValue)
            updateActiveVC()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApp()
    }

    
    @IBAction func showCustomA(_ sender: Any) {
        activeViewController = customA
    }
    
    @IBAction func showCustomB(_ sender: Any) {
        activeViewController = customB
    }
    
    @IBAction func showCustomC(_ sender: Any) {
        activeViewController = customD
    }
    
    func configureApp()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        customA = storyboard.instantiateViewController(withIdentifier: "customA")
        customB = storyboard.instantiateViewController(withIdentifier: "customB")
        customC = storyboard.instantiateViewController(withIdentifier: "customC")
        customD = storyboard.instantiateViewController(withIdentifier: "customD")
    }
    
    func removeInactiveVC(inactiveVC: UIViewController?)
    {
        if let inactivo = inactiveVC
        {
            inactivo.willMove(toParent: nil)
            inactivo.view.removeFromSuperview()
            inactivo.removeFromParent()
        }
    }
    
    func updateActiveVC()
    {
        if let activo = activeViewController
        {
            addChild(activo)
            activo.view.frame = contentView.bounds
            contentView.addSubview(activo.view)
            activo.didMove(toParent: self)
        }
    }
    
}


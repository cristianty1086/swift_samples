//
//  TableViewController.swift
//  evalfinal1
//
//  Created by Cristian Tinoco Yurivilca on 7/09/18.
//  Copyright © 2018 inkataxi. All rights reserved.
//

import Foundation
import UIKit

struct ConceptProgramming {
    
    var nameTitle:String?
    var descrContent:String?
    var nameImage:String?
    var linkWikipedia:String?
    
}


class TableViewController : UITableViewController
{
    
    struct Seccion {
        var nombre : String!
        var items : [ConceptProgramming]!
    }
    
    var secciones = [Seccion]()
    
    var seleccConcept:ConceptProgramming?
    
    override func viewDidLoad() {
        
        secciones = []
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        secciones = []
        
        if( languageSelect == 0 ){
            secciones.append( Seccion(nombre: "Terms", items: conceptsEnglish ) )
            secciones.append( Seccion(nombre: "Settings", items: [ ConceptProgramming(nameTitle: "Change language", descrContent: "", nameImage: "", linkWikipedia: "") ]) )
        }
        else{
            secciones.append( Seccion(nombre: "Términos", items: conceptsSpanish ) )
            secciones.append( Seccion(nombre: "Configuración", items: [ ConceptProgramming(nameTitle: "Cambiar idioma", descrContent: "", nameImage: "", linkWikipedia: "") ]) )
        }
        
        seleccConcept = nil
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secciones[section].items.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return secciones.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell?
        cell?.textLabel?.text = secciones[indexPath.section].items[indexPath.row].nameTitle
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return secciones[section].nombre
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if( indexPath.section == 1 ){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "idioma") as! LanguageViewController
            self.present(vc, animated: true, completion: nil)
            
        }
        else{
            
            seleccConcept = secciones[indexPath.section].items[indexPath.row]
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "detalle") as! DetailViewController
            vc.conceptProgramming = seleccConcept
            
            self.splitViewController?.showDetailViewController(vc, sender: self)
            
        }
        
    }
    
    
}

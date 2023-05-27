//
//  TesteRouter.swift
//  DigimonList
//
//  Created by Humberto Rodrigues on 27/05/23.
//

import UIKit

protocol TesteRouterProtocol: AnyObject {
    func openSheetAlert(title: String, message: String, confirm: String, cancel: String)
}

class TesteRouter: TesteRouterProtocol {
    //Similar a ViewController do Flutter
    
    weak var viewController: UIViewController?
    
    //Quando construirmos nossa TesteRouter vamos deixar o parametro viewController como opcional
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    func openSheetAlert(title: String, message: String, confirm: String = "Confirmar", cancel: String = "Cancelar") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: confirm , style: .default))
        alert.addAction(UIAlertAction(title: cancel, style: .cancel))
        viewController?.present(alert, animated: true)
    }
    
}

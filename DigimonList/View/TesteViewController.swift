//
//  ViewController.swift
//  DigimonList
//
//  Created by Humberto Rodrigues on 21/05/23.
//

import UIKit

class TesteViewController: UIViewController {
    
    @IBOutlet weak var TesteButton: UIButton!
    
    private var router: TesteRouter
    var testeView: TesteViewProtocol = { return TesteView() }()
    
    override func loadView() {
        self.view = testeView
        testeView.delegate = self
    }
    
    init(router: TesteRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
    }
    
}

extension TesteViewController: TesteViewDelegate {
    func touchInButton() {
        router.openSheetAlert(title: "Sr. Cliente Fulano", message: "Deseja realizar a assinatura ?")
    }
}


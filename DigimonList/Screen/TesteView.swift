//
//  TesteView.swift
//  DigimonList
//
//  Created by Humberto Rodrigues on 27/05/23.
//

import UIKit

protocol TesteViewDelegate {
    func touchInButton() // Quem a implementa é responsável por mostrar algo
}

protocol TesteViewProtocol: UIView {
    var delegate: TesteViewDelegate? { get set } //Qualquer objeto que a implemente deve manter uma referencia a TesteViewDelagate.
    func reloadData()
    func displayErrorView()
}

class TesteView: UIView {
    lazy var customButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clique aqui", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(tapInButton), for: .touchUpInside)
        return button
    }()
    
    lazy var customTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.delaysContentTouches = false
        //tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        return tableView
    }()
    
    var delegate: TesteViewDelegate?
    
    override init(frame: CGRect) {      //Obrigatório
        super.init(frame: frame)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {    //Obrigatório
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapInButton() {
        delegate?.touchInButton()
    }
    
    func tableViewDelegate(delegate: UITableViewDelegate, datasource: UITableViewDataSource) {
        customTableView.delegate = delegate
        customTableView.dataSource = datasource
    }
    
    func setupConstraint() {
        self.addSubview(customButton)
        NSLayoutConstraint.activate([
            customButton.heightAnchor.constraint(equalToConstant: 50),
            customButton.widthAnchor.constraint(equalToConstant: 200),
            customButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 30),
            customButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

extension TesteView: TesteViewProtocol {
    func reloadData() {
        print("")
    }
    
    func displayErrorView() {
        print("")
    }
}

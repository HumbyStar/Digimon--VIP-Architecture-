//
//  DigimonListWorker.swift
//  DigimonList
//
//  Created by Humberto Rodrigues on 22/05/23.
//

import Foundation

protocol DigimonListWorkerDelegate: AnyObject {
    func result(_ result: Result<DigimonListResult, Error>)
}

protocol DigimonListWorkerProtocol {
    func getSpecify(_ id: Int, _ name: String)
    func getDigimonList()
    var interactor: DigimonListWorkerDelegate? {get set}
}

public final class DigimonListWorker: DigimonListWorkerProtocol {
    
    private var network: NetworkingInterface?
    var interactor: DigimonListWorkerDelegate?
    
    init(network: NetworkingInterface? = nil) {
        self.network = network
    }
    
    func getDigimonList() {
        let finalURL = URLs.Custom.Endpoints.digimon.url
        network?.fetch(DigimonListResult.self, url: finalURL , kind: .get, headers: nil, body: nil) { (response) in
            switch response {
            case .success(let digimons):
                self.interactor?.result(.success(digimons))
            case .failure(let error):
                print("Deu ruim \(error)")
            }
        }
    }
    
    func getSpecify(_ id: Int, _ name: String) {
        
    }
    
    
    
    
}

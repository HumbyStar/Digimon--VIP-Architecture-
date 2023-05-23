//
//  DigimonListWorker.swift
//  DigimonList
//
//  Created by Humberto Rodrigues on 22/05/23.
//

import Foundation

public protocol DigimonListWorkerDelegate {
    func result(_ result: Result<Data, Error>)
}

public protocol DigimonListWorkerProtocol {
    func getSpecify(_ id: Int, _ name: String)
    var interactor: DigimonListWorkerDelegate {get set}
}

public final class DigimonListWorker {
    
}

//
//  NetworkingInterface.swift
//  DigimonList
//
//  Created by Humberto Rodrigues on 21/05/23.
//

import Foundation
import UIKit


protocol NetworkingInterface {
    func fetch<T: Codable>(_ type: T.Type, url: URL, kind: Networking,headers: [String: Any], body: [String: Any], completion: @escaping (Result<T, Error>) -> ())
}

extension NetworkingInterface {
    func fetch<T: Codable>(_ type: T.Type, url: URL, kind: Networking, headers: [String: Any], body: [String: Any], completion: @escaping (Result<T, Error>) -> ()){
        fetch(type, url: url, kind: kind, headers: headers, body: body, completion: completion)
    }
}

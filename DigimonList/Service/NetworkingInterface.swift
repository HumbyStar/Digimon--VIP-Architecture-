//
//  NetworkingInterface.swift
//  DigimonList
//
//  Created by Humberto Rodrigues on 21/05/23.
//

import Foundation
import UIKit


protocol NetworkingInterface {
    func fetch<T: Codable>(_ type: T.Type, url: URL, kind: Networking, headers: [String: Any]?, body: [String: Any]?, completion: @escaping (Result<T, Error>) -> ())
}

extension NetworkingInterface {
    
    //MARK: CHAMANDO UMA EXTENSION CONSIGO DEIXAR O MÉTODO CONFIGURADO GENERICAMENTE E APENAS CHAMA-LO NA MINHA CLASSE
    
    
    func fetch<T: Codable>(_ type: T.Type, url: URL, kind: Networking, headers: [String: Any]?, body: [String: Any]?, completion: @escaping (Result<T, Error>) -> ()){
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = kind.rawValue
        
        for (key, value) in headers ?? [:] {
            urlRequest.addValue(value as! String, forHTTPHeaderField: key)
        }
        // INTERESSANTE, RODAR UM FOR NUM DICIONARIO, e ADICIONAR VALOR DE ACORDO COM A CHAVE
        
        if let body = body {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        // BODY DE UMA REQUISIÇÃO PRECISA SER ENVIADO COMO DATA
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let response = response as? HTTPURLResponse {
                let statusCode = response.statusCode
                if statusCode != 200 {
                    completion(.failure(NSError(domain: "Error status code: ", code: statusCode)))
                }
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(T.self, from: data)
                    completion(.success(decoded))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    
    }
}

//
//  URLs.swift
//  DigimonList
//
//  Created by Humberto Rodrigues on 22/05/23.
//

import Foundation

struct URLs {
    
    struct Custom {
        enum Endpoints {
            case digimon
            case attribute
            case field
            case level
            case type
            case skill
            
            var url: URL {
                URL(string: "digi-api.com/api/v1\(Custom.getURL(endpoint: self))")!
            }
        }
       
        static func getURL(endpoint: Endpoints) -> String {
            switch endpoint {
            case .digimon:
                return "/digimon"
            case .attribute:
                return "/attribute"
            case .field:
                return "/field"
            case .level:
                return "/level"
            case .type:
                return "/type"
            case .skill:
                return "/type"
            }
        }
    }
    
    
}

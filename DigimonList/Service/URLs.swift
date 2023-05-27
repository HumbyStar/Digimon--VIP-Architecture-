//
//  URLs.swift
//  DigimonList
//
//  Created by Humberto Rodrigues on 22/05/23.
//

import Foundation

struct URLs {
    
    struct Custom {
        
        enum NumberLoad {
            case fifty
            case twenty
            case ten
        }
        
        enum Endpoints {
            case digimon
            case attribute
            case field
            case level
            case type
            case skill
            
            var url: URL {
                URL(string: "\(URLs.Custom.Endpoints.basePath)\(Custom.getURL(endpoint: self))\(Custom.getTotalDigimons(numberLoad: .fifty))")!
            }
            
            func checkPage(urlPage: String = "&page=", indexPath: Int = 0) -> URL {
                let finalString = "\(URLs.Custom.Endpoints.digimon.url)\(urlPage)\(indexPath)"
                return URL(string: finalString)!
            }
            
            static var basePath = "https://digi-api.com/api/v1"
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
        
        static func getTotalDigimons(numberLoad: NumberLoad) -> String {
            switch numberLoad {
            case .fifty:
                return "?pageSize=\(50)"
            case .twenty:
                return "?pageSize=\(20)"
            case .ten:
                return "?pageSize=\(10)"
            }
        }
    }
    
    
}



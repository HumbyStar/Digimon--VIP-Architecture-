//
//  DigimonListResult.swift
//  DigimonList
//
//  Created by Humberto Rodrigues on 22/05/23.
//

import Foundation


struct DigimonListResult {
    let digimon: [Digimon]
    
    enum CodingKeys: String, CodingKey {
        case digimon
    }
    
    //O let container serve para decodificar valores associados a chaves do tipo CodingKeys, o CodingKeys ta agindo como uma enumeração para listar todas as chaves que o dado pode ter. Se tudo der certo ele será inicializado senão irá falhar.
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        digimon = try container.decode([Digimon].self, forKey: .digimon)
    }
    
    //Este padrão de construtor é comumente usado sempre que você quer decodificar dados de uma fonte externa, vantagem de usar esse construtor é:
    
    // - Segurança do tipo, podemos garantir que está lendo o formato que esperamos
    // - Tratamento de erros, se os dados não tiverem da forma que eu quero os dados serão propagados numa exceção permitindo que lide com os erros de maneira eficiente
    // - Simplicidade, uma vez que a estrutura decodable está configurada podemos usa-la com uma unica linha de codigo
}

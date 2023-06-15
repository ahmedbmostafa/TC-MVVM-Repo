//
//  Parsing.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import Foundation

class Parsing {
    
    class func decode<T:Codable> (type:T.Type , data:Data)->T?{
        let decoder = JSONDecoder()
        do{
            
            let object = try decoder.decode(type.self, from: data)
            return object
            
        }catch{
            print("Failed in decoding: \(error)")
            return nil
        }
    }
    
}

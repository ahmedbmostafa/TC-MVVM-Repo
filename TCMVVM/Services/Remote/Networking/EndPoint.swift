//
//  EndPoint.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import Foundation

enum EndPoint{
    case getRepo
}

extension EndPoint {
    
    var baseURL: String {
        valueOfSecret(named: "BaseURL")
    }
    
    var stringValue:String{
        switch self {
        case .getRepo:
            return baseURL + "square/repos"
        }
    }
    
    var url:URL{
        let escapedString =  stringValue.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) ?? ""
        return URL(string:escapedString)!
        
    }
    
}

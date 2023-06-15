//
//  Request.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import Foundation

class Request{
    
    class func request(url:URL, httpMethod:HTTPMethod, completion: @escaping (Data?,URLResponse?,Error?)-> Void){
        
        print("url=",url)
        var headers:[String:String]!
        headers = ["Accept":"application/json","Content-Type":"application/json"]
        var request = URLRequest(url:url,cachePolicy: .reloadIgnoringLocalCacheData)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { (data , response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
            }
            DispatchQueue.main.async {
                completion(data,response,error)
            }
        }
        task.resume()
    }
    
}

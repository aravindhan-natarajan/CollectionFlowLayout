//
//  APIRequester.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//

import Foundation

//https://api.unsplash.com/search/photos?page=1&query=work%20from%20home&client_id=41cdff6622cbdd2d162fcd23765bd48b70d7af474e346a1cab819c5744056b79

enum RequestType {
    case search(desc: String)
    case none
}

class APIRequester {
    private static let urlDomain = "https://api.unsplash.com"
    static var limit: Int = 20
    static let cliendID = "41cdff6622cbdd2d162fcd23765bd48b70d7af474e346a1cab819c5744056b79"
    static var page = 1
    
    init() {
        
    }
    
    static func contructURL(type: RequestType) -> String {
        switch type {
        case let .search(desc: querryString):
            return "https://api.unsplash.com/search/photos?page=\(APIRequester.page)&query=\(querryString)&client_id=\(APIRequester.cliendID)"
        default:
            return ""
        }
    }
    
}


extension APIRequester {
    
    static func triggerSearchImageRequest(type: RequestType , handler onCompletion: ((PhotosListCodable? , Error?) -> ())? = nil) {
       
        guard let fullURL = URL(string: APIRequester.contructURL(type: type)) else {return}
        
        let request = URLRequest(url: fullURL)
        
        
        let task = URLSession.shared.dataTask(with: request) { data, request, error in
            guard let jsondata = data , let model = try? JSONDecoder().decode(PhotosListCodable.self, from: jsondata) else {return}
            onCompletion?(model , error)
        }
        
        task.resume()
    }
    
}

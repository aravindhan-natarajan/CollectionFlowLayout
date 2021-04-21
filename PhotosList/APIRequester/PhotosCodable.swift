//
//  PhotosCodable.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//

import Foundation
import UIKit

class PhotosListCodable: Codable {
    let total , totalPages: Int?
    var results: [PhotoCodable]?
    
    enum CodingKeys: String , CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
    
    init(total: Int? , results: [PhotoCodable]? , totalpages: Int?) {
        self.total = total
        self.totalPages = totalpages
        self.results = results
    }
    
}

class PhotoCodable: Codable {
    let id: String?
    let urls: Url?
    
     
    init(id: String , urls: Url?) {
        self.id = id
        self.urls = urls
    }
}


class Url: Codable {
    let regular: String?
    
    init(regular: String?) {
        self.regular = regular
    }
}

class Utility {
    static func getController<T>(_ storyBoardName: String, _ identifier: String , type: T.Type) -> T {
        return UIStoryboard(name: storyBoardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as! T
    }
}

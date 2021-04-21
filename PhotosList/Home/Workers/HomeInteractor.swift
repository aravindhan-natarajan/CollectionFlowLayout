//
//  HomeInteractor.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Aravindhan

import UIKit

protocol IHomeInteractor: class {
	var parameters: [String: Any]? { get set }
    func triggerPhotosListAPI(queery: String)
    
    func getNumberofSections() -> Int
    func getNumberofItem(in section: Int) -> Int
    func prepareCollectionviewcell(for collectionview: UICollectionView , indexpath: IndexPath) -> UICollectionViewCell
}

class HomeInteractor: IHomeInteractor {
    
    var presenter: IHomePresenter?
    var manager: IHomeManager?
    var parameters: [String: Any]?
    
    var datasource: PhotosListCodable? = nil

    init(presenter: IHomePresenter, manager: IHomeManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func triggerPhotosListAPI(queery: String) {
        APIRequester.triggerSearchImageRequest(type: .search(desc: queery)) { responsemodel, error in
            self.datasource = responsemodel
            self.presenter?.listAPICompleted(model: responsemodel)
        }
    }
    
    
    func getNumberofSections() -> Int {
        return 1
    }
    
    func getNumberofItem(in section: Int) -> Int {
        return self.datasource?.results?.count ?? .zero
    }
    
    func prepareCollectionviewcell(for collectionview: UICollectionView , indexpath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexpath) as! PhotoCell
        
        cell.backgroundColor = UIColor.red
        
        if let url = self.datasource?.results?[indexpath.row].urls?.regular {
            cell.setImage(imageURL: url)
        }
       
        return cell
    }
    
}

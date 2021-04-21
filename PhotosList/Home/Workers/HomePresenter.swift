//
//  HomePresenter.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Aravindhan

import UIKit

protocol IHomePresenter: class {
	// do someting...
    func listAPICompleted(model: PhotosListCodable?)
}

class HomePresenter: IHomePresenter {	
	weak var view: IHomeViewController?
	
	init(view: IHomeViewController?) {
		self.view = view
	}
    
    func listAPICompleted(model: PhotosListCodable?) {
        DispatchQueue.main.async { //CONVERSION OF THREAD
            self.view?.listAPICompleted(model: model)
        }
    }
}

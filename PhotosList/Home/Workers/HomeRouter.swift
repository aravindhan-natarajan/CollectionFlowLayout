//
//  HomeRouter.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Aravindhan

import UIKit

protocol IHomeRouter: class {
	// do someting...
}

class HomeRouter: IHomeRouter {	
	weak var view: HomeViewController?
	
	init(view: HomeViewController?) {
		self.view = view
	}
}

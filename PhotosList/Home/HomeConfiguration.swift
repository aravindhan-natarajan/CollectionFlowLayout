//
//  HomeConfiguration.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Aravindhan

import Foundation
import UIKit

class HomeConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = Utility.getController("Main", "HomeViewController", type: HomeViewController.self)
        let router = HomeRouter(view: controller)
        let presenter = HomePresenter(view: controller)
        let manager = HomeManager()
        let interactor = HomeInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}

//  
//  LoginBuilder.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//

import Foundation
import UIKit

class LoginBuilder {

    func build(with navigationController: UINavigationController?) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Login", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let coordinator = LoginRouter(navigationController: navigationController)
        let viewModel = LoginViewModelImpl(router: coordinator)

        viewController.viewModel = viewModel
        
        return viewController
    }
}

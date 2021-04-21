//  
//  LoginViewController.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.viewModelDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewModelWillAppear()
    }
    
    fileprivate func bindViewModel() {

        viewModel.output = { [unowned self] output in
            //handle all your bindings here
            switch output {
            default:
                break
            }
        }
    }
}

//  
//  LoginViewModel.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//

import Foundation

typealias LoginViewModelOutput = (LoginViewModelImpl.Output) -> Void

protocol LoginViewModelInput {
    
}

protocol LoginViewModel {
    var output: LoginViewModelOutput? { get set}
    
    func viewModelDidLoad()
    func viewModelWillAppear()
}

class LoginViewModelImpl: LoginViewModel, LoginViewModelInput {

    private let router: LoginRouter
    var output: LoginViewModelOutput?
    
    init(router: LoginRouter) {
        self.router = router
    }
    
    func viewModelDidLoad() {
        
    }
    
    func viewModelWillAppear() {
        
    }
    
    //For all of your viewBindings
    enum Output {
        
    }
}

extension LoginViewModelImpl {

}

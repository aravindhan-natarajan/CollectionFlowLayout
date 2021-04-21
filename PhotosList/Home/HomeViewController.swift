//
//  HomeViewController.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Aravindhan

import UIKit

protocol IHomeViewController: class {
	var router: IHomeRouter? { get set }
    func listAPICompleted(model: PhotosListCodable?)
}

class HomeViewController: UIViewController {
	var interactor: IHomeInteractor?
	var router: IHomeRouter?

    var photoCollectionView: UICollectionView = {
        let layout = HomeViewController.createLayout(coulum: 2)
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset.top = 10
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        self.view.backgroundColor = .white
        self.photoCollectionView.backgroundColor = .white
        
        
        self.interactor?.triggerPhotosListAPI(queery: "work")
        self.setdatasourceAndDelegates()
    }
    
    
    func setdatasourceAndDelegates() {
        self.photoCollectionView.dataSource = self
        self.photoCollectionView.delegate = self
        
        self.view.addSubview(photoCollectionView)
        self.photoCollectionView.g_pinEdges()
        
        self.photoCollectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
    }
    
}

extension HomeViewController: IHomeViewController {
    func listAPICompleted(model: PhotosListCodable?) {
        self.photoCollectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.interactor?.getNumberofSections() ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.interactor?.getNumberofItem(in: section) ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.interactor?.prepareCollectionviewcell(for: collectionView, indexpath: indexPath) ?? PhotoCell()
    }
    
}

extension HomeViewController {
	// do someting...
}

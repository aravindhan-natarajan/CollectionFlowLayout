//
//  PhotosListLayout.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//

import Foundation
import UIKit

//--------
// [] [] []
// [] []
// [] [] [] []
// -------




extension HomeViewController {
    
    static func createLayout(coulum: CGFloat = 2) -> UICollectionViewCompositionalLayout {
        // section  -> groups --> items
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            let widthValue: CGFloat = CGFloat(1/coulum)
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(widthValue), heightDimension: .absolute(200)))
            item.contentInsets.bottom = 16
            item.contentInsets.trailing = 16
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 0)
            return section
            
        }
        
    }
    
}

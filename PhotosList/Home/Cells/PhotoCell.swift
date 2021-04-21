//
//  PhotoCell.swift
//  PhotosList
//
//  Created by Aravindhan Natarajan on 21/04/21.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {

    
    @IBOutlet var displayimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.displayimage.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 10
    }
    
    func setImage(imageURL: String) {
        SDWebImageManager.shared.loadImage(with: URL(string: imageURL), options: .allowInvalidSSLCertificates, progress: nil) { photo, _, _, _, _, _ in
            DispatchQueue.main.async {
                self.displayimage.image = photo
            }
        }
    }

}

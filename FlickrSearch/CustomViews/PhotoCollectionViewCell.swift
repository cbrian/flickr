//
//  PhotoCollectionViewCell.swift
//  FlickrSearch
//
//  Created by Sanju Naik on 6/15/17.
//  Copyright © 2017 Sanju. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView?
    
    func setUp(with photo:Photo) -> Void {
        if let url = photo.url {
            photoImageView?.kf.setImage(with: URL(string: url))
        }
    }
    
}

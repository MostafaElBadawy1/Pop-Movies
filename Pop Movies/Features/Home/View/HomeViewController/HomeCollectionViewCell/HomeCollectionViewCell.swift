//
//  HomeCollectionViewCell.swift
//  Pop Movies
//
//  Created by mostafa  on 12/02/2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImageView: UIImageView!

   
    func configure(with configurations: HomeCollectionViewCellConfigurations) {
        configurations.imageLoader.setImage(ImageURL: configurations.movieImageURL, imageView: movieImageView)
    }
}

struct HomeCollectionViewCellConfigurations {
    let movieImageURL: URL
    let imageLoader: ImageLoadable
    
    init(movieImageURL: URL, imageLoader: ImageLoadable) {
        self.movieImageURL = movieImageURL
        self.imageLoader = imageLoader
    }
}



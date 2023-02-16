//
//  ImageLoader.swift
//  Pop Movies
//
//  Created by mostafa  on 14/02/2023.
//

import UIKit
import SDWebImage

protocol ImageLoadable {
    func setImage(ImageURL: URL, imageView: UIImageView)
}


class ImageLoader: ImageLoadable {
    func setImage(ImageURL: URL, imageView: UIImageView) {
        imageView.sd_setImage(with: ImageURL)
    }
}

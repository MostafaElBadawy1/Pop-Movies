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

//extension UIImageView: ImageLoadable {
//    func setImage(ImageURL: URL) {
//        self.sd_setImage(with: ImageURL)
//    }
//}

class Test {
    @IBOutlet private var testImageView: UIImageView!
    var imageLoader: ImageLoadable
    
    init(imageLoader: ImageLoadable = ImageLoader()) {
        self.imageLoader = imageLoader
    }
    
    
    func setupView() {
        imageLoader.setImage(ImageURL: URL(string: "")!, imageView: testImageView)
    }
    
    
}

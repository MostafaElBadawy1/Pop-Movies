//
//  ViewController+Ext.swift
//  Pop Movies
//
//  Created by mostafa  on 13/02/2023.
//

import Foundation
import UIKit
extension UIViewController {
    func presentAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default ))
        alert.present(alert, animated: true, completion: nil)
    }
    func createImageURL(posterPath: String) -> URL {
        guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w185/\(posterPath)") else {return URL(string: "")!}
        return imageUrl
    }
}

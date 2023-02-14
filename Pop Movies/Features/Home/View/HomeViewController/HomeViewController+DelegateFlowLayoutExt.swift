//
//  HomeViewController+DelegateFlowLayoutExt.swift
//  Pop Movies
//
//  Created by mostafa  on 13/02/2023.
//

import UIKit
extension HomeViewController: UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let navigationBarHeight = navigationController?.navigationBar.frame.height else {return CGSize(width: 0, height: 0)}
        return CGSize(width:collectionView.frame.size.width/2, height: ( ( (collectionView.frame.size.height - navigationBarHeight) - 53)/2))
    }
    
     func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 0
     }
    
     func collectionView(_ collectionView: UICollectionView, layout
         collectionViewLayout: UICollectionViewLayout,
                         minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 0
     }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
     }
    
}

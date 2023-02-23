//
//  HomeViewController+CollectionViewExtention.swift
//  Pop Movies
//
//  Created by mostafa  on 12/02/2023.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel?.getMoviesCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.shared.homeCollectionViewCell, for: indexPath) as! HomeCollectionViewCell
        cell.configure(with: .init(movieImageURL: (homeViewModel?.createImageURL(indexPath: indexPath.item))!, imageLoader: imageLoader!))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeCollectionView.deselectItem(at: indexPath, animated: true)
        navigate(to: (homeViewModel?.initMoviesDetailsVC(indexPath: indexPath.item))!, with: .push)
    }
}

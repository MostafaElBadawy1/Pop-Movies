//
//  HomeViewController+PrefetchingExt.swift
//  Pop Movies
//
//  Created by mostafa  on 14/02/2023.
//

import UIKit
extension HomeViewController: UICollectionViewDataSourcePrefetching {
     func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if indexPath.item == homeViewModel?.preFetchingIndex {
                fetchPrefetchedMovies(sortBy: homeViewModel?.arrengmentType ?? "", page: homeViewModel?.pageNumber ?? 0)
                bindPrefetchedMovies()
                homeViewModel?.preFetchingIndex += 6
                homeViewModel?.pageNumber += 1
            }
        }
    }
}

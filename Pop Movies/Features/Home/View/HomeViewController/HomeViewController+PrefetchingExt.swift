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
                fetchPrefetchedMovies(sortBy: homeViewModel?.getArrengmentType() ?? "", page: homeViewModel?.getPageNumber() ?? 0)
                bindPrefetchedMovies()
                homeViewModel?.increasePreFetchingIndexAndPageNumber()
            }
        }
    }
}

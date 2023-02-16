//
//  HomeViewController+CollectionViewExtention.swift
//  Pop Movies
//
//  Created by mostafa  on 12/02/2023.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel?.getMoviesCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.shared.homeCollectionViewCell, for: indexPath) as! HomeCollectionViewCell
        guard let url = homeViewModel?.moviesArray[indexPath.item].posterPath else {return cell}
        let imageURL = createImageURL(posterPath: url)
        guard let imageLoader: ImageLoadable = self.imageLoader else { return UICollectionViewCell() }
        cell.configure(with: .init(movieImageURL: imageURL, imageLoader: imageLoader))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeCollectionView.deselectItem(at: indexPath, animated: true)
        //         AppRouter.shared.route(to: .movieDetails(movieId: (homeViewModel?.moviesArray[indexPath.item].id)!))
        let viewModel = MovieDetailsViewModel(movieID: homeViewModel?.getMovieID(indexPath: indexPath.item) ?? 0)
        let vc = MovieDetailsViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//
//  ViewController.swift
//  Pop Movies
//
//  Created by mostafa  on 12/02/2023.
//

import UIKit
class HomeViewController: UIViewController {
    
    //MARK: - Properities
    var homeViewModel: HomeViewModel?
    var imageLoader: ImageLoadable?
    
    //MARK: - IBOutlets
    @IBOutlet weak private var arragnmentMoviesBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModel()
    }
    init(viewModel:HomeViewModel = HomeViewModel(), imageLoader: ImageLoadable = ImageLoader()) {
        self.imageLoader = imageLoader
        self.homeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    //MARK: - Main Methods
    private func initView() {
        configureCollectionView()
        configureNavigationBar()
    }
    
    private func initViewModel() {
        fetchData(sortBy: homeViewModel?.arrengmentType ?? "", page: 1)
        bindData()
    }
    
    //MARK: - View Methods
    private func configureCollectionView() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.prefetchDataSource = self
        homeCollectionView.register(UINib(nibName: Constants.shared.homeCollectionViewCell, bundle: .main), forCellWithReuseIdentifier: Constants.shared.homeCollectionViewCell)
        
    }
    
    private func configureNavigationBar() {
        let mostPopuler = UIAction(title: Constants.shared.mostPopulerMenuButtonTitle) { [ weak self] (action) in
            self?.homeViewModel?.arrengmentType = Constants.shared.mostPopulerMenuButtonArrengmentType
            self?.homeViewModel?.resetForPrefetching()
            self?.fetchData(sortBy: (self?.homeViewModel?.getArrengmentType())! , page: 1)
        }
        
        let topRated = UIAction(title: Constants.shared.topRatedMenuButtonTitle) { [weak self] (action) in
            self?.homeViewModel?.arrengmentType = Constants.shared.topRatedMenuButtonArrengmentType
            self?.homeViewModel?.resetForPrefetching()
            self?.fetchData(sortBy: (self?.homeViewModel?.getArrengmentType())! , page: 1)
        }
        
        let menu = UIMenu(title: Constants.shared.arrengmentTypeMenuTitle, options: .displayInline, children: [mostPopuler , topRated])
        arragnmentMoviesBarButtonItem.primaryAction = nil
        arragnmentMoviesBarButtonItem.menu = menu
    }
    
    //MARK: - Data Methods
    private func fetchData(sortBy: String, page: Int) {
        homeViewModel?.getHomeMovies(sortBy: sortBy, page: page)
    }
    
    private func bindData() {
        homeViewModel?.bindingData = { [weak self] (movies, error) in
            if let moviesList = movies {
                DispatchQueue.main.async {
                    self?.homeViewModel?.moviesArray = moviesList
                    self?.homeCollectionView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
                self?.presentAlert(title: Constants.shared.homeVCErrorMessage, message: "", actionTitle: "OK")
            }
        }
    }
    
    func fetchPrefetchedMovies(sortBy: String, page: Int) {
        homeViewModel?.getHomeMovies(sortBy: sortBy, page: page)
    }
    
    func bindPrefetchedMovies() {
        homeViewModel?.bindingData = { [weak self] (movies, error) in
            if let moviesList = movies {
                DispatchQueue.main.async {
                    self?.homeViewModel?.moreMoviesArray = moviesList
                    self?.homeViewModel?.addPrefetchedMovies()
                    self?.homeCollectionView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
                self?.presentAlert(title: Constants.shared.homeVCErrorMessage, message: "", actionTitle: "OK")
            }
        }
    }
}

//MARK: - CollectionView Delegate And DataSourse Extention
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

//MARK: - CollectionView PreFetching Extention
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

//MARK: - CollectionView Delegate FlowLayout Extention
extension HomeViewController: UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        guard let navigationBarHeight = navigationController?.navigationBar.frame.height else {return CGSize(width: 0, height: 0)}
         return CGSize(width: 207, height: 310)
      //  return CGSize(width:collectionView.frame.size.width/2, height: ( ( collectionView.frame.size.height / 2)))
    }
    
     func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { return 0 }
    
     func collectionView(_ collectionView: UICollectionView, layout
         collectionViewLayout: UICollectionViewLayout,
                         minimumLineSpacingForSectionAt section: Int) -> CGFloat { return 0 }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
     }
    
}

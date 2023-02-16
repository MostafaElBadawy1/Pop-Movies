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
        let mostPopuler = UIAction(title: "Most Populer") { [ weak self] (action) in
            self?.homeViewModel?.arrengmentType = "popularity.desc"
            self?.homeViewModel?.resetForPrefetching()
            self?.fetchData(sortBy: (self?.homeViewModel?.getArrengmentType())! , page: 1)
        }
        
        let topRated = UIAction(title: "Top Rated") { [weak self] (action) in
            self?.homeViewModel?.arrengmentType = "vote_average.desc"
            self?.homeViewModel?.resetForPrefetching()
            self?.fetchData(sortBy: (self?.homeViewModel?.getArrengmentType())! , page: 1)
        }
        
        let menu = UIMenu(title: "Choose Movies Order", options: .displayInline, children: [mostPopuler , topRated])
        arragnmentMoviesBarButtonItem.primaryAction = nil
        arragnmentMoviesBarButtonItem.menu = menu
    }
    
    
    //MARK: - Data Methods
    private  func fetchData(sortBy: String, page: Int) {
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
                self?.presentAlert(title: "Error While Loading Home Movies", message: "", actionTitle: "OK")
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
                self?.presentAlert(title: "Error While Loading Home Movies", message: "", actionTitle: "OK")
            }
        }
    }
}



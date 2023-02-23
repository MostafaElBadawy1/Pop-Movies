//
//  MovieDetailsViewController.swift
//  Pop Movies
//
//  Created by mostafa  on 13/02/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    //MARK: - Properites
    private var movieDetailsViewModel: MovieDetailsViewModel
    private var imageLoader: ImageLoadable
    
    //MARK: - IBOutlets
    @IBOutlet weak private var movieTitleLabel: UILabel!
    @IBOutlet weak private var moviePosterImageView: UIImageView!
    @IBOutlet weak private var releaseDateLabel: UILabel!
    @IBOutlet weak private var runTimeLabel: UILabel!
    @IBOutlet weak private var ratingLabel: UILabel!
    @IBOutlet weak private var overViewLabel: UILabel!
    
    //MARK: - LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModel()
    }
    
    //MARK: - Init
    init(viewModel: MovieDetailsViewModel, imageLoader: ImageLoadable = ImageLoader()) {
        self.movieDetailsViewModel = viewModel
        self.imageLoader = imageLoader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - IBActions
    @IBAction private func favoriteButtonAction(_ sender: UIButton) {
        // Save Button ID and Image To CoreData
    }
    
    @IBAction private func trailerButton(_ sender: UIButton) {
        if let url = URL(string: Constants.shared.youTubeURL) {
            UIApplication.shared.open(url)
        }
    }
}

private extension MovieDetailsViewController {
    
    //MARK: - Main Methods
    func initView() {
    }
    
    func initViewModel() {
        fetchMovieDetails()
        bindMovieDetailsData()
    }
    
    func setupView(ImageURL: URL) {
        imageLoader.setImage(ImageURL:  ImageURL, imageView: moviePosterImageView)
    }
    
    //MARK: - Data Methods
    func fetchMovieDetails() {
        movieDetailsViewModel.getMovieDetails()
    }
    
    func bindMovieDetailsData() {
        movieDetailsViewModel.bindingData = { [weak self]  (movie, error) in
            if let movie = movie {
                DispatchQueue.main.async {
                    self?.movieDetailsViewModel.movie = movie
                    self?.configureViewComponents()
                }
            }
            if let error = error {
                print(error.localizedDescription)
                self?.presentAlert(title:Constants.shared.moviesDetailsVCErrorMessage, message: "", actionTitle: "OK")
            }
        }
    }
    
    func configureViewComponents() {
        movieTitleLabel.text = movieDetailsViewModel.movie?.originalTitle
        overViewLabel.text = movieDetailsViewModel.movie?.overView
        releaseDateLabel.text = movieDetailsViewModel.movie?.releaseDate
        guard let runTime = movieDetailsViewModel.movie?.runTime, let rating = movieDetailsViewModel.movie?.voteAverage,
              let url = movieDetailsViewModel.movie?.posterPath else {return}
        runTimeLabel.text = "\(String(describing: runTime)) Mins"
        ratingLabel.text = "\(String(describing: rating)) / 10"
        let imageURL = createImageURL(posterPath: url)
        setupView(ImageURL: imageURL)
    }
}

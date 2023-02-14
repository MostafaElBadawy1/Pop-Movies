//
//  MovieDetailsViewController.swift
//  Pop Movies
//
//  Created by mostafa  on 13/02/2023.
//

import UIKit
import SDWebImage
class MovieDetailsViewController: UIViewController {
    //MARK: - Properites
    var movieDetailsViewModel: MovieDetailsViewModel
    var imageLoader: ImageLoadable
   // var movieID: Int?
    //MARK: - IBOutlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var runTimeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
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
    @IBAction func favoriteButtonAction(_ sender: UIButton) {
        // Save Button ID and Image To CoreData
    }
    
    @IBAction func trailerButton(_ sender: UIButton) {
        if let url = URL(string: "https://www.youtube.com/") {
            UIApplication.shared.open(url)
        }
    }
}
private extension MovieDetailsViewController {
    //MARK: - Main Methods
    func initView() {
    }
    
    func initViewModel() {
       // guard let movieID = movieID else { return }
       // fetchMovieDetails(movieID: String(movieID))
        bindMovieDetailsData()
    }
    func setupView(ImageURL: URL) {
        imageLoader.setImage(ImageURL:  ImageURL, imageView: moviePosterImageView)
    }
    //MARK: - Data Methods
    func fetchMovieDetails(movieID: String) {
        movieDetailsViewModel.getMovieDetails(movieID: movieID)
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
                self?.presentAlert(title: "Error While Loading Movie Details", message: "", actionTitle: "OK")
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

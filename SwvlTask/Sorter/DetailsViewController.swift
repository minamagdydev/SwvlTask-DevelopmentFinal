//
//  DetailsViewController.swift
//  SwvlTask
//
//  Created by minamagdy  on 6/4/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//
import UIKit

class DetailsViewController: UIViewController  {
    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var cast: UILabel!
    @IBOutlet weak var movieImageCollectionView: UICollectionView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    
    
    var images: [Photo]?
    var movie: Movie?
    var url: String?
    var ratingVar = ""
    var castVar: [String]?
    var viewModel: DetailsViewModel = DetailsViewModel()
    var movieTitle: String = ""{
        didSet {
            url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=031d1099c0ca6e35c6a238632a8fccbf&format=json&nojsoncallback=​1​&text=\(movieTitle)&page=1&per_page=10"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupDesign()
    }
    
    
    private func setupDesign(){
        movieTitle = movie?.title ?? ""
        rating.text = ratingVar
        movieTitleLbl.text = movie?.title
        castVar?.insert("Cast : ", at: 0)
        cast.text = castVar?.joined(separator:"\n -")
        downloadImages()
    }
    
    private func downloadImages()
    {
        viewModel.getImages(urlSession: URLSession.shared, url: url!) { [weak self]images in
            self?.images = images
            DispatchQueue.main.async { self!.movieImageCollectionView.reloadData() }
        }

    }
   @IBAction func dismissView(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
}

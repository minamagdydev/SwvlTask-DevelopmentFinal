//
//  DetailsViewController.swift
//  SwvlTask
//
//  Created by lujin sherif  on 6/4/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//
import UIKit

class DetailsViewController: UIViewController  {
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var cast: UILabel!
    @IBOutlet weak var movieImageCollectionView: UICollectionView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    var photos: [Photo]?
    var movies: Movie?
    var url: String?
    var ratingVar = ""
    var castVar: [String]?
    var viewModel: DetailsViewModel!
    var movieTitle: String = ""{
        didSet {
            url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=031d1099c0ca6e35c6a238632a8fccbf&format=json&nojsoncallback=​1​&text=\(movieTitle)&page=1&per_page=10"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      SetupDesign()
    }
    
    
    func SetupDesign(){
        movieTitle = movies?.title ?? ""
        rating.text = ratingVar
        movieTitleLbl.text = movies?.title
        castVar?.insert("Cast : ", at: 0)
        cast.text = castVar?.joined(separator:"\n -")
        downloadImages()
    }
    func downloadImages()
    {
        viewModel = DetailsViewModel()
        viewModel.getImages(url: url!) { [weak self]movies in
            self?.photos = movies
            DispatchQueue.main.async { self!.movieImageCollectionView.reloadData() }
        }

    }
   @IBAction func dismissView(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
}

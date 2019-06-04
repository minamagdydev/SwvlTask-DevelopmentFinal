//
//  DetailsViewController.swift
//  SwvlTask
//
//  Created by lujin sherif  on 6/4/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController  {
    @IBOutlet weak var movieImageCollectionView: UICollectionView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    var photos: [Photo]?
    var movies: Movie?
    var urlsArray: [String]?
    var url: String?
    var viewModel: DetailsViewModel!
    
    var movieTitle: String = ""{
        didSet {
            url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=031d1099c0ca6e35c6a238632a8fccbf&format=json&nojsoncallback=​1​&text=\(movieTitle)&page=1&per_page=10"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle = movies?.title ?? ""
        movieTitleLbl.text = movies?.title
        getDataFrom ()
      
    }
    func getDataFrom ()
    {
        viewModel = DetailsViewModel()
        viewModel.getMovies(url: url!) { [weak self]movies in
            self?.photos = movies
            DispatchQueue.main.async { self!.movieImageCollectionView.reloadData() }
        }

    }
    
    @IBAction func dismissView(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
}

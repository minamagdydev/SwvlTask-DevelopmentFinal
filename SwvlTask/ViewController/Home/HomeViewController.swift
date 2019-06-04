//

//  ViewController.swift
//  SwvlTask
//
//  Created by mina  on 6/2/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import UIKit
import Cosmos
class HomeViewController: UIViewController {

    @IBOutlet weak var moviesListTableView: UITableView!
    @IBOutlet weak var moviesSearchBar: UISearchBar!
    var fileReader: SWVLFileReader!
    var sorter: swvlSorter = swvlSorter()
    var viewModel: HomeViewModel!
    
    var movies: [Movie]? 
    var searchArray: [Movie]? {
        didSet {
            DispatchQueue.main.async {
                self.moviesListTableView.reloadData()
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies()
        moviesSearchBar.delegate = self
    }
     
    func getMovies() {
        fileReader = SWVLFileReader(fileName: "all_movies", type: "json")
        viewModel = HomeViewModel(fileReader: fileReader, sorter: sorter)
        viewModel.getMovies(onSuccess: { [weak self]movies in
            self?.movies = movies
            self?.searchArray = movies
           
        }) { error in
            print(error.localizedDescription)
        }
        
    }

    
}


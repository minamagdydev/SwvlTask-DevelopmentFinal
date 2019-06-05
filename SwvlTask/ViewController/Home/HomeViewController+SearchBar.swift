//
//  HomeViewController+SearchBar.swift
//  SwvlTask
//
//  Created by minamagdy Ali on 6/3/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import Foundation
import UIKit
extension HomeViewController:  UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
     

        if searchText.isEmpty {
            searchArray = movies!
            self.moviesListTableView.reloadData()
        }else {
            searchArray = viewModel.search(movieName: searchText, movies: movies!)
            moviesListTableView.reloadData()
        }
    }
    
   
    
}

//
//  HomeViewController+SearchBar.swift
//  SwvlTask
//
//  Created by Omar Mohamed Ali on 6/3/19.
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
            searchArray = viewModel.search(movieName: searchText)
            moviesListTableView.reloadData()
        }
    }
    
    /*func filterTableView(text:String) {
        //by Year
        /*let sortedArray = movies?.sorted(by: { (Movie1, Movie2) -> Bool in
            guard let lhsValue = Movie1.year , let rhsValue = Movie2.year else {return false}
            return lhsValue > rhsValue
        })//by rating
        let sortedArrayByRate = sortedArray?.sorted(by: { (Movie1, Movie2) -> Bool in
            guard let lhsValue = Movie1.rating , let rhsValue = Movie2.rating else {return false}
             guard let lhsValueyear = Movie1.year , let rhsValueYear = Movie2.year else {return false}
            if  lhsValueyear == rhsValueYear{ return lhsValue > rhsValue}else{ return false}
        })
        searchArray = sortedArrayByRate!.filter({ (mod) -> Bool in
            return mod.title!.lowercased().contains(text.lowercased())
        })*/
        
        searchArray = HomeViewModel.search(movieName: text)
        self.moviesListTableView.reloadData()
        
    }*/
    
}

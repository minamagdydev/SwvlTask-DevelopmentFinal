//
//  HomeViewController+UITableView.swift
//  SwvlTask
//
//  Created by lujin sherif  on 6/3/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//


import UIKit
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell
        
        cell?.movieTitle.text = searchArray![indexPath.row].title
        if let year = searchArray![indexPath.row].year {
        cell?.year.text = String(year)
        }
        if let rating = searchArray![indexPath.row].rating {
            cell?.rating.text = String(rating)
        }
 

        return cell!
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let hight = UIScreen.main.bounds.height  * 0.15
        return hight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        newViewController.movies = searchArray?[indexPath.row]
        self.present(newViewController, animated: true, completion:nil)
    }
}

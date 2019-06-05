//
//  DetailsViewController.swift
//  SwvlTask
//
//  Created by minamagdy  on 6/4/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import UIKit
import SDWebImage
extension DetailsViewController:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.count ?? 0 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieImageCell", for: indexPath) as! MovieImageCell
        cell.movieImage.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        cell.movieImage.sd_setImage(with: URL(string: (images?[indexPath.row].url)!), placeholderImage: UIImage(named: "placeholder"))
       
        return cell
    }
}

//
//  DetailsViewController.swift
//  SwvlTask
//
//  Created by lujin sherif  on 6/4/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import UIKit

extension DetailsViewController:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieImageCell", for: indexPath) as! MovieImageCell
        cell.movieImage.downloaded(from: photos?[indexPath.row].url ?? "")//photos?[indexPath.row].url
        return cell
    }
}

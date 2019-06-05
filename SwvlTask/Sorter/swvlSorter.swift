//
//  swvlSorter.swift
//  SwvlTask
//
//  Created by minamagdy  on 6/4/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import Foundation
class swvlSorter: Sorter {
    func sort(array: [Movie]) -> [Movie] {
        guard array.count > 1 else { return array }    // 1
        
        let middleIndex = array.count / 2              // 2
        
        let leftArray = sort(array: Array(array[0..<middleIndex]))             // 3
        
        let rightArray = sort(array: Array(array[middleIndex..<array.count]))  // 4
        
        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    private func merge(leftPile: [Movie], rightPile: [Movie]) -> [Movie] {
        // 1
        var leftIndex = 0
        var rightIndex = 0
        
        // 2
        var orderedPile = [Movie]()
        orderedPile.reserveCapacity(leftPile.count + rightPile.count)
        
        // 3
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex].year! > rightPile[rightIndex].year! {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex].year! < rightPile[rightIndex].year! {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                if leftPile[leftIndex].rating! > rightPile[rightIndex].rating! {
                    orderedPile.append(leftPile[leftIndex])
                    leftIndex += 1
                } else if leftPile[leftIndex].rating! < rightPile[rightIndex].rating! {
                    orderedPile.append(rightPile[rightIndex])
                    rightIndex += 1
                }
                else {
                    orderedPile.append(leftPile[leftIndex])
                    leftIndex += 1
                    orderedPile.append(rightPile[rightIndex])
                    rightIndex += 1
                }
            }
        }
        
        // 4
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderedPile
    }
    
    
    
}

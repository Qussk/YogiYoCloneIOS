//
//  CollectionViewFlowLayout.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/08/31.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension HomeVC: UICollectionViewDelegateFlowLayout {
    // 줄 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionDesign.padding
    }
    // 행 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionDesign.padding
    }
    // 테두리
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return CollectionDesign.edge
    }
    // 아이템 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case categoryCollection:
            return categorySize(collectionView: collectionView)
        case fourthCollection:
            return restaurantTripleSize(collectionView: collectionView)
        case ninthCollection:
            return restaurantNewSize(collectionView: collectionView)
        default:
            return restaurantSize(collectionView: collectionView)
        }
    }
    
    private func categorySize(collectionView: UICollectionView) -> CGSize {
        let size = (collectionView.frame.height - (CollectionDesign.edge.top + CollectionDesign.edge.bottom) - (CollectionDesign.padding * (CollectionDesign.cateLineCount - 1))) / CollectionDesign.cateLineCount
        return CGSize(width: size * 0.78, height: size)
    }
    
    private func restaurantSize(collectionView: UICollectionView) -> CGSize {
        let size = (collectionView.frame.height - (CollectionDesign.edge.top + CollectionDesign.edge.bottom))
        return CGSize(width: size * 0.7, height: size)
    }
    
    private func restaurantTripleSize(collectionView: UICollectionView) -> CGSize {
        let size = (collectionView.frame.height - (CollectionDesign.edge.top + CollectionDesign.edge.bottom) - (CollectionDesign.padding * (CollectionDesign.tripleLineCount - 1))) / CollectionDesign.tripleLineCount
        return CGSize(width: size * 3.7, height: size)
    }
    
    private func restaurantNewSize(collectionView: UICollectionView) -> CGSize {
        let size = (collectionView.frame.height - (CollectionDesign.edge.top + CollectionDesign.edge.bottom))
        return CGSize(width: size * 0.76, height: size)
    }
}


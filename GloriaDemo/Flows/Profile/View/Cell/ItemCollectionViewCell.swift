//
//  ItemCollectionViewCell.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 10/08/21.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell, CellProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

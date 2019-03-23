//
//  CollectionViewCell.swift
//  ThemSuaXoaColectionView
//
//  Created by Mac on 3/8/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var text_label: UILabel!
    override func prepareForReuse() {
        text_label.text = ""
        image.image = nil
    }
}

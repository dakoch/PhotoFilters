//
//  GalleryCell.swift
//  PhotoFilters
//
//  Created by Gru on 01/12/15.
//  Copyright (c) 2015 GruTech. All rights reserved.
//

import UIKit

class GalleryCell: UICollectionViewCell {

    let imageView = UIImageView()

    override init( frame: CGRect ) {
        super.init( frame: frame )
        self.addSubview( self.imageView )
        self.backgroundColor = UIColor.whiteColor()
        imageView.frame = self.bounds
    }

    required init( coder aDecoder: NSCoder ) {
        super.init( coder : aDecoder )
    }


    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

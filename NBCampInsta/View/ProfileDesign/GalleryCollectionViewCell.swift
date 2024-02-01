//
//  GalleryCollectionViewCell.swift
//  NBCampInsta
//
//  Created by 최유리 on 1/29/24.
//

import UIKit
import SnapKit

class GalleryCollectionViewCell: UICollectionViewCell {
    static let identifier = "GalleryCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.backgroundColor = .black

        imageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

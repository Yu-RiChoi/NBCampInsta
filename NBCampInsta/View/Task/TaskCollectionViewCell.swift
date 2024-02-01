//
//  TaskCollectionViewCell.swift
//  NBCampInsta
//
//  Created by 최유리 on 1/31/24.
//

import UIKit
import SnapKit

class TaskCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TaskCollectionViewCell"
    
    let taskView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .brown
        
        return uiView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(taskView)

        taskView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(30)
            make.left.equalTo(self.snp.left).inset(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

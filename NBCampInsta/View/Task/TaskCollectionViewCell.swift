//
//  TaskCollectionViewCell.swift
//  NBCampInsta
//
//  Created by 최유리 on 2/2/24.
//

import UIKit

protocol CoreDataTaskCellDelegate: AnyObject {
    func valueChanged(with id: UUID?, isCompleted: Bool)
}

class TaskCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "TaskCollectionViewCell"
    
    private let titleLabel = UILabel()
    private let isDoneSwitch = UISwitch()
    private let strikeThroughView = UIView()
    
    private var id: UUID?
    weak var delegate: CoreDataTaskCellDelegate?
    
    func setUI() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(isDoneSwitch)
        self.contentView.addSubview(strikeThroughView)
        
        isDoneSwitch.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        
        setAutoLayout()
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setSwitch(_ value: Bool) {
        isDoneSwitch.isOn = value
    }
    
    func setId(_ id: UUID) {
        self.id = id
    }
    
    @objc func valueChanged() {
        delegate?.valueChanged(with: id, isCompleted: isDoneSwitch.isOn)
    }
    
    private func setAutoLayout() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).inset(16)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        isDoneSwitch.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).inset(16)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        strikeThroughView.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.height.equalTo(1)
        }
    }

}

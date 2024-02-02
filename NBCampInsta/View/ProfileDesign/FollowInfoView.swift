//
//  FollowInfoView.swift
//  NBCampInsta
//
//  Created by 최유리 on 2/1/24.
//

import UIKit

class FollowInfoView: UIView {
    var count: Int = 0
    var text: String = ""
    
    lazy var infoCount = {
        let label = UILabel()
        label.text = String(count)
        
        return label
    }()
    
    lazy var infoText = {
        let label = UILabel()
        label.text = text
        
        return label
    }()
    
    init(count: Int = 0, text: String = "") {
        super.init(frame: .zero)
        self.count = count
        self.text = text
        
        self.addSubview(infoCount)
        self.addSubview(infoText)
        
        infoCount.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        infoText.snp.makeConstraints { make in
            make.centerX.equalTo(infoCount)
            make.top.equalTo(infoCount.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

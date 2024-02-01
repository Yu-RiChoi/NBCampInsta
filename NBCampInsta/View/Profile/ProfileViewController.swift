//
//  ProfileViewController.swift
//  NBCampInsta
//
//  Created by 최유리 on 1/30/24.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    var userInfo: ProfileModel?
    
    private var userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private var userAge: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        userName.text = userInfo?.name ?? "르탄이"
        userAge.text = "\(userInfo?.age ?? 20)"
        
        setAutoLayout()
    }
    
    private func setAutoLayout() {
        view.addSubview(userName)
        view.addSubview(userAge)
        
        userName.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).inset(18)
        }
        
        userAge.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(8)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}

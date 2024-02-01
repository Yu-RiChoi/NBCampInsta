//
//  ProfileDesignView.swift
//  NBCampInsta
//
//  Created by 최유리 on 1/29/24.
//

import UIKit
import SnapKit

class ProfileDesignView: UIView {
    
    private lazy var userId: UILabel = {
        let label = UILabel()
        label.text = "nabaecamp"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    private lazy var menuImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "menuIcon")
        
        return imageView
    }()
    
    private lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userImage")
        
        return imageView
    }()
    
    // UserFollowInfo
    private lazy var post: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 0
        
        let postNum = UILabel()
        postNum.text = "7"
        postNum.font = .systemFont(ofSize: 16.5, weight: .bold)
        
        let post = UILabel()
        post.text = "post"
        post.font = .systemFont(ofSize: 14, weight: .medium)
        
        stackView.addArrangedSubview(postNum)
        stackView.addArrangedSubview(post)
        
        return stackView
    }()
    
    private lazy var follower: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 0
        
        let followerNum = UILabel()
        followerNum.text = "0"
        followerNum.font = .systemFont(ofSize: 16.5, weight: .bold)
        
        let follower = UILabel()
        follower.text = "follower"
        follower.font = .systemFont(ofSize: 14, weight: .medium)
        
        stackView.addArrangedSubview(followerNum)
        stackView.addArrangedSubview(follower)
        
        return stackView
    }()
    
    private lazy var following: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 0
        
        let followingNum = UILabel()
        followingNum.text = "0"
        followingNum.font = .systemFont(ofSize: 16.5, weight: .bold)
        
        let following = UILabel()
        following.text = "following"
        following.font = .systemFont(ofSize: 14, weight: .medium)
        
        stackView.addArrangedSubview(followingNum)
        stackView.addArrangedSubview(following)
        
        return stackView
    }()
    
    // UserInfo
    private lazy var userInfo: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 2
        
        let name = UILabel()
        name.text = "르탄이"
        name.font = .systemFont(ofSize: 14, weight: .bold)
        
        let bio = UILabel()
        bio.text = "iOS Developer 🍎"
        bio.font = .systemFont(ofSize: 14, weight: .medium)
        
        let link = UILabel()
        link.text = "spartacodingclub.kr"
        link.textColor = UIColor(named: "pageLinkColor")
        link.font = .systemFont(ofSize: 14, weight: .medium)
        
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(bio)
        stackView.addArrangedSubview(link)
        
        return stackView
    }()
    
    // MiddleBar
    private lazy var middleBar: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        let follow = UIButton()
        follow.setTitle("Follow", for: .normal)
        follow.setTitleColor(.white, for: .normal)
        follow.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        follow.backgroundColor = UIColor(named: "FollowButton")
        follow.layer.cornerRadius = 4
        follow.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        
        let message = UIButton()
        message.setTitle("Message", for: .normal)
        message.setTitleColor(.black, for: .normal)
        message.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        message.layer.borderWidth = 1.5
        message.layer.borderColor = UIColor.buttonBorder.cgColor
        message.layer.cornerRadius = 4
        
        let more = UIButton()
        more.setImage(UIImage(named: "moreButton"), for: .normal)
        more.snp.makeConstraints { make in
            make.width.equalTo(30)
        }
        
        stackView.addArrangedSubview(follow)
        stackView.addArrangedSubview(message)
        stackView.addArrangedSubview(more)
        
        return stackView
    }()
    
    // NavGallery
    private lazy var divider: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "divider")
        
        return imageView
    }()
    
    private lazy var grid: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "gridIcon"), for: .normal)
        
        return button
    }()
    
    private lazy var sectionIndicator: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sectionIndicator")
        
        return imageView
    }()
    
    // GalleryCollectionView
    private lazy var galleryCollectionView: UICollectionView = {
        let galleryCollectionView = GalleryCollectionView()
        
        return galleryCollectionView
    }()
    
    // NavigationBar
    private lazy var profileView: UIView = {
        let uiView = UIView()
        
        return uiView
    }()
    
    private lazy var profile: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAutoLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setAutoLayout() {
        
        self.addSubview(userId)
        self.addSubview(menuImage)
        
        self.addSubview(userImage)
        self.addSubview(post)
        self.addSubview(follower)
        self.addSubview(following)
        
        self.addSubview(userInfo)
        
        self.addSubview(middleBar)
        
        self.addSubview(divider)
        self.addSubview(grid)
        self.addSubview(sectionIndicator)
        self.addSubview(galleryCollectionView)
        
        self.addSubview(profileView)
        self.addSubview(profile)
        
        userId.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.safeAreaLayoutGuide).inset(10)
        }
        
        menuImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.left.equalTo(userId.snp.right).offset(102)
        }
        
        userImage.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(88)
            make.left.equalTo(self.snp.left).inset(14)
            make.top.equalTo(userId.snp.bottom).offset(14)
        }
        
        post.snp.makeConstraints { make in
            make.top.equalTo(userId.snp.bottom).offset(37)
            make.left.equalTo(userImage.snp.right).offset(50)
        }
        
        follower.snp.makeConstraints { make in
            make.left.equalTo(post.snp.right).offset(42)
            make.top.equalTo(userId.snp.bottom).offset(37)
        }
        
        following.snp.makeConstraints { make in
            make.left.equalTo(follower.snp.right).offset(26)
            make.top.equalTo(userId.snp.bottom).offset(37)
        }
        
        userInfo.snp.makeConstraints { make in
            make.top.equalTo(userImage.snp.bottom).offset(14)
            make.left.equalTo(self.snp.left).inset(15)
        }
        
        middleBar.snp.makeConstraints { make in
            make.top.equalTo(userInfo.snp.bottom).offset(11)
            make.left.equalTo(self.snp.left).inset(15)
            make.right.equalTo(self.snp.right).inset(15)
            make.height.equalTo(30)
        }
        
        divider.snp.makeConstraints { make in
            make.top.equalTo(middleBar.snp.bottom).offset(10)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.width.equalTo(self)
        }
        
        grid.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(8)
        }
        
        sectionIndicator.snp.makeConstraints { make in
            make.top.equalTo(grid.snp.bottom).offset(10.5)
            make.leading.equalTo(grid.snp.leading)
            make.trailing.equalTo(grid.snp.trailing)
            make.width.equalTo(UIScreen.main.bounds.width / 3)
        }
        
        galleryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(sectionIndicator.snp.bottom).offset(2)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        profileView.snp.makeConstraints { make in
            make.top.equalTo(galleryCollectionView.snp.bottom).offset(18)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(85)
        }
        
        profile.snp.makeConstraints { make in
            make.centerX.equalTo(profileView.snp.centerX)
            make.centerY.equalTo(profileView.snp.centerY)
            make.height.width.equalTo(25)
        }
    }
}

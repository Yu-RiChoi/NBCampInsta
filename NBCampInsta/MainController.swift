
import UIKit
import SnapKit

class MainController: UIViewController {
    
//    var logoImage: UIImageView = {
//        let imageView = UIImageView()
//        
//        return imageView
//    }()
    
    private var profileDesignButton: UIButton = {
        let button = UIButton()
        button.setTitle("ProfileDesignView", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    private var profileButton: UIButton = {
        let button = UIButton()
        button.setTitle("ProfileView", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    private var coreDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("TodoView", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    private var randomVideoButton: UIButton = {
        let button = UIButton()
        button.setTitle("RandomVideoViewController", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAutoLayout()
        setupInteraction()
        
    }
    
    private func setupInteraction() {
        profileDesignButton.addTarget(self, action: #selector(tappedProfileDesignButton), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(tappedProfileButton), for: .touchUpInside)
        coreDataButton.addTarget(self, action: #selector(tappedCoreDataButton), for: .touchUpInside)
        randomVideoButton.addTarget(self, action: #selector(tappedRandomVideoButton), for: .touchUpInside)
    }
    
    @objc func tappedProfileDesignButton() {
        let goProfileDesignViewVC = ProfileDesignViewController()
        goProfileDesignViewVC.modalPresentationStyle = .fullScreen
        present(goProfileDesignViewVC, animated: true, completion: nil)
    }
    
    @objc func tappedProfileButton() {
        let goProfileViewVC = ProfileViewController()
        goProfileViewVC.modalPresentationStyle = .fullScreen
        present(goProfileViewVC, animated: true, completion: nil)
    }
    
    @objc func tappedCoreDataButton() {
        let goCoreDataViewVC = TaskViewController()
        goCoreDataViewVC.modalPresentationStyle = .fullScreen
        present(goCoreDataViewVC, animated: true, completion: nil)
    }
    
    @objc func tappedRandomVideoButton() {
        let goRandomVideoViewVC = RandomVideoViewController()
        goRandomVideoViewVC.modalPresentationStyle = .fullScreen
        present(goRandomVideoViewVC, animated: true, completion: nil)
//        self.navigationController?.pushViewController(goRandomVideoViewVC, animated: true)
    }
    
    private func setAutoLayout() {
        view.addSubview(profileDesignButton)
        view.addSubview(profileButton)
        view.addSubview(coreDataButton)
        view.addSubview(randomVideoButton)

        profileDesignButton.snp.makeConstraints { make in
            make.centerY.equalTo(view.snp.centerY)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(profileDesignButton.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        coreDataButton.snp.makeConstraints { make in
            make.top.equalTo(profileButton.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        randomVideoButton.snp.makeConstraints { make in
            make.top.equalTo(coreDataButton.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
}


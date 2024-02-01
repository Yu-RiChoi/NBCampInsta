
import UIKit
import SnapKit

class ProfileDesignViewController: UIViewController {

    let profileDesignView = ProfileDesignView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setUI()
    }
    
    private func setUI() {
        view.addSubview(profileDesignView)
        
        profileDesignView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalTo(view)
        }
    }
}

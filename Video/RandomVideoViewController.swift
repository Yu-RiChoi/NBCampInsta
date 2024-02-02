//
//  RandomVideoViewController.swift
//  NBCampInsta
//
//  Created by 최유리 on 2/2/24.
//

import UIKit
import AVFoundation
import SnapKit

class RandomVideoViewController: UIViewController {
    
    private let videoView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAutoLayout()
        playVideo()
    }
    
    private func setUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(videoView)
    }
    
    private func setAutoLayout() {
        self.view.addSubview(videoView)
        videoView.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(250)
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY)
        }
    }
    
    private func playVideo() {
        Task {
            guard let url = URL(string: "https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/14a27bd0bcd0cd323b35ad79cf3b493dddf6216b/videos.json")
            else { return }
            
            if let result = try? await URLSession.shared.data(from: url),
               let movies = try? JSONDecoder().decode([VideoModel].self, from: result.0),
               let videoUrl = movies.first?.videoUrl,
               let url = URL(string: videoUrl)
            {
                await MainActor.run {
                    let player = AVPlayer(url: url)
                    let layer = AVPlayerLayer(player: player)
                    layer.frame = videoView.bounds
                    
                    videoView.layer.addSublayer(layer)
                    
                    player.play()
                }
            }
        }
    }
}

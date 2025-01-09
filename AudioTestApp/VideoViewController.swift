//
//  VideoViewController.swift
//  AudioTestApp
//
//  Created by Rijo Samuel on 27/10/24.
//

import UIKit
import AVKit
import AVFoundation

final class VideoViewController: UIViewController {
    
    var player: AVPlayer?
    var playerViewController: AVPlayerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
        setupUI()
    }
    
    private func setupVideoPlayer() {
        guard let url = Bundle.main.url(forResource: "glory_maruzee_dragon", withExtension: "mp4") else {
            print("Trouble loading file")
            return
        }
        
        player = AVPlayer(url: url)
        playerViewController = AVPlayerViewController()
        playerViewController?.player = player
    }
    
    private func setupUI() {
        let playButton = UIButton(type: .system)
        playButton.setTitle("Play", for: .normal)
        playButton.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
        view.addSubview(playButton)
        playButton.frame = CGRect(x: 0, y: 0, width: 100, height: view.frame.size.height/2)
        playButton.center = view.center
    }
    
    @objc private func playVideo() {
        guard let vc = playerViewController else {
            return
        }
        
        present(vc, animated: true) { [weak self] in
            self?.player?.play()
        }
    }
}

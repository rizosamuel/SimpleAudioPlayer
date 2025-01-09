//
//  ViewController.swift
//  AudioTestApp
//
//  Created by Rijo Samuel on 27/10/24.
//

import UIKit
import AVFoundation

final class AudioViewController: UIViewController {
    
    private var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupAudioPlayer()
        setupUI()
    }
    
    private func setupAudioPlayer() {
        guard let url = Bundle.main.url(forResource: "glory", withExtension: "mp3") else {
            print("Audio file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Unable to play audio \(error)")
        }
    }
    
    private func setupUI() {
        let playButton = UIButton(type: .system)
        playButton.setTitle("Play", for: .normal)
        playButton.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        
        let pauseButton = UIButton(type: .system)
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.addTarget(self, action: #selector(pauseAudio), for: .touchUpInside)
        
        let stopButton = UIButton(type: .system)
        stopButton.setTitle("Stop", for: .normal)
        stopButton.addTarget(self, action: #selector(stopAudio), for: .touchUpInside)
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.addArrangedSubview(playButton)
        stack.addArrangedSubview(pauseButton)
        stack.addArrangedSubview(stopButton)
        
        stack.center = view.center
        stack.frame = view.bounds
        view.addSubview(stack)
    }
    
    @objc private func playAudio() {
        audioPlayer?.play()
    }
    
    @objc private func pauseAudio() {
        audioPlayer?.pause()
    }
    
    @objc private func stopAudio() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }
}


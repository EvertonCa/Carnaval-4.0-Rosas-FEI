//
//  MenuViewController.swift
//  Carnaval 4.0 Rosas-FEI
//
//  Created by Everton Cardoso on 08/02/20.
//  Copyright © 2020 Everton Cardoso. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class MenuViewController: UIViewController{
    
    @IBOutlet weak var logoRosasView: UIImageView!
    @IBOutlet weak var logoFeiView: UIImageView!
    @IBOutlet weak var startButtonView: UIImageView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet var menuView: UIView!
    @IBOutlet weak var sambodromoView: UIImageView!
    
    var player: AVPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startButtonView.alpha = 0
        self.logoFeiView.alpha = 0
        self.logoRosasView.alpha = 0
        self.videoView.alpha = 0
        self.sambodromoView.alpha = 0
        setupView()
        fadeInVideo()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.startHome))
        startButtonView.addGestureRecognizer(tapRecognizer)
        let tapRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.startSambodromo))
        sambodromoView.addGestureRecognizer(tapRecognizer2)
    }
    
    private func setupView(){
        if let filePath = Bundle.main.path(forResource: "rosas_background", ofType:"mp4") {
            let filePathUrl = NSURL.fileURL(withPath: filePath)
            player = AVPlayer(url: filePathUrl)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.videoView.bounds
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: nil) { (_) in
                self.player?.seek(to: CMTime.zero)
                self.player?.play()
            }
            self.videoView.layer.addSublayer(playerLayer)
            player?.play()
        
        }
    }
    
    @objc func startHome(){
        self.player.pause()
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ARViewController = storyBoard.instantiateViewController(withIdentifier: "ARHomeViewID") as! ARHomeViewController
        ARViewController.modalPresentationStyle = .fullScreen
        ARViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(ARViewController, animated: true, completion: nil)
        menuView.removeFromSuperview()
    }
    
    @objc func startSambodromo(){
        self.player.pause()
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let arSambodromoViewController = storyBoard.instantiateViewController(withIdentifier: "ARSambodromoViewID") as! ARSambodromoViewController
        arSambodromoViewController.modalPresentationStyle = .fullScreen
        arSambodromoViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(arSambodromoViewController, animated: true, completion: nil)
        menuView.removeFromSuperview()
    }
    
    func fadeInVideo(){
        UIView.animate(withDuration: 1.0, delay: 0, animations: {
            self.videoView.alpha = 1.0
        }){ ( success ) in
            self.fadeInAssets()
        }
    }
    
    func fadeInAssets(){
        UIView.animate(withDuration: 2, delay: 3, animations: {
            self.startButtonView.alpha = 1.0
            self.logoFeiView.alpha = 1.0
            self.logoRosasView.alpha = 1.0
            self.sambodromoView.alpha = 1.0
        })
    }

}

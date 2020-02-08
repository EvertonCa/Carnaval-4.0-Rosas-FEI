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
    @IBOutlet weak var houseButtonView: UIImageView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet var menuView: UIView!
    @IBOutlet weak var sambodromoButtonView: UIImageView!
    @IBOutlet weak var whereLabel: UIImageView!
    @IBOutlet weak var knowMoreLabel: UIImageView!
    @IBOutlet weak var rosasFeiButton: UIImageView!
    @IBOutlet weak var cadCarButton: UIImageView!
    
    
    var player: AVPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.houseButtonView.alpha = 0
        self.logoFeiView.alpha = 0
        self.logoRosasView.alpha = 0
        self.videoView.alpha = 0
        self.sambodromoButtonView.alpha = 0
        self.whereLabel.alpha = 0
        self.knowMoreLabel.alpha = 0
        self.rosasFeiButton.alpha = 0
        self.cadCarButton.alpha = 0
        setupView()
        fadeInVideo()
        
        let startHomeRecognizer = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.startHome))
        houseButtonView.addGestureRecognizer(startHomeRecognizer)
        
        let starSambRecognizer = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.startSambodromo))
        sambodromoButtonView.addGestureRecognizer(starSambRecognizer)
        
        let carCarRecognizer = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.openCADCarPage))
        cadCarButton.addGestureRecognizer(carCarRecognizer)
        
        let rosasFeiRecognizer = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.openRosasFeiPage))
        rosasFeiButton.addGestureRecognizer(rosasFeiRecognizer)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
        }
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
    
    @objc func openCADCarPage(){
        if let link = URL(string: "https://www.youtube.com/watch?v=9eFNBqpfdvY") {
          UIApplication.shared.open(link)
        }
    }
    
    @objc func openRosasFeiPage(){
        if let link = URL(string: "https://www.youtube.com/watch?v=oRSXQ2jU0ak") {
          UIApplication.shared.open(link)
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
            self.houseButtonView.alpha = 1.0
            self.logoFeiView.alpha = 1.0
            self.logoRosasView.alpha = 1.0
            self.sambodromoButtonView.alpha = 1.0
            self.whereLabel.alpha = 1.0
            self.knowMoreLabel.alpha = 1.0
            self.rosasFeiButton.alpha = 1.0
            self.cadCarButton.alpha = 1.0
        })
    }

}

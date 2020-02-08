//
//  IntroViewController.swift
//  Carnaval 4.0 Rosas-FEI
//
//  Created by Everton Cardoso on 08/02/20.
//  Copyright © 2020 Everton Cardoso. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController{
    
    var MenuViewController:UIViewController?
    
    @IBOutlet var splashUIView: UIView!
    @IBOutlet weak var splashImageView: UIImageView!
    @IBOutlet weak var titleSplashView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMenuView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            self.anim1()
        }
    }
    
    func anim1(){
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { ( success ) in
            self.anim2()
        }
    }
    
    func anim2(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { ( success ) in
            self.anim3()
        }
    }
    
    func anim3(){
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { ( success ) in
            self.anim4()
        }
    }
    
    func anim4(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { ( success ) in
            self.anim5()
        }
    }
    
    func anim5(){
        UIView.animate(withDuration: 0.2, delay: 0.6, options: .curveEaseIn, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { ( success ) in
            self.anim6()
        }
    }
    
    func anim6(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { ( success ) in
            self.anim7()
        }
    }
    
    func anim7(){
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { ( success ) in
            self.anim8()
        }
    }
    
    func anim8(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { ( success ) in
            self.anim9()
        }
    }
    
    func anim9(){
        UIView.animate(withDuration: 0.3, delay: 0.6, options: .curveEaseIn, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }) { ( success ) in
            self.anim10()
        }
    }
    
    func anim10(){
        UIView.animate(withDuration: 0.4, delay: 0.2, options: .curveEaseIn, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 30, y: 30); self.titleSplashView.transform = CGAffineTransform(scaleX: 0, y: 0)
        }) { ( success ) in
            self.callMenuView()
        }
    }
    
    func loadMenuView() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        self.MenuViewController = storyBoard.instantiateViewController(withIdentifier: "MenuID") as! MenuViewController
        self.MenuViewController!.modalPresentationStyle = .fullScreen
        self.MenuViewController!.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
    }
    
    func callMenuView(){
        self.present(self.MenuViewController!, animated: true, completion: nil)
        splashUIView.removeFromSuperview()
    }
    
}

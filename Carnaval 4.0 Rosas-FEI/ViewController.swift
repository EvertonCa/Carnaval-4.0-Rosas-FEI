//
//  ViewController.swift
//  Carnaval 4.0 Rosas-FEI
//
//  Created by Everton Cardoso on 06/02/20.
//  Copyright © 2020 Everton Cardoso. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
}

//
//  ViewController.swift
//  Carnaval 4.0 Rosas-FEI
//
//  Created by Everton Cardoso on 06/02/20.
//  Copyright © 2020 Everton Cardoso. All rights reserved.
//

import UIKit
import RealityKit
import ARKit

class ARViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        addScene()
    }
    
    func addScene()
    {
        guard let anchor = try? ExperienciaCasa.loadMenu() else { return }
        
        anchor.generateCollisionShapes(recursive: true)
        
        arView.scene.anchors.append(anchor)
    }
    
}

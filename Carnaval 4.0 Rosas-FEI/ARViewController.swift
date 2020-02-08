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
    @IBOutlet weak var coachingOverlay: ARCoachingOverlayView!
    
    /// Convenience accessor for the session owned by ARSCNView.
    var session: ARSession {
        return arView.session
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()        
        presentCoachingOverlay()
        
        addScene()
    }
    
    /// Begins the coaching process that instructs the user's movement during
    /// ARKit's session initialization.
    func presentCoachingOverlay() {
        coachingOverlay.session = arView.session
        coachingOverlay.delegate = self
        coachingOverlay.goal = .horizontalPlane
        coachingOverlay.activatesAutomatically = false
        self.coachingOverlay.setActive(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Prevent the screen from being dimmed to avoid interuppting the AR experience.
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        session.pause()
    }
    
    func addScene()
    {
        guard let anchor = try? ExperienciaCasa.loadMenu() else { return }
        
        anchor.generateCollisionShapes(recursive: true)
        
        arView.scene.addAnchor(anchor)
    }
    
}

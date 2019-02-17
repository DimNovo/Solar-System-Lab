//
//  PlanetPresentationViewController.swift
//  Solar System Lab
//
//  Created by Dmitry Novosyolov on 17/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit
import SceneKit

class PlanetPresentationViewController: UIViewController {

    var planet: Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        let scene = SCNScene()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5.0)
        
        scene.rootNode.addChildNode(cameraNode)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 2)
        
        scene.rootNode.addChildNode(lightNode)
        
        let stars = SCNParticleSystem(named: "StarsParticles.scnp", inDirectory: nil)!
        scene.rootNode.addParticleSystem(stars)
        
        let presentedNode = PresentedPlanetNode()
        scene.rootNode.addChildNode(presentedNode)
        
        let sceneView = self.view as! SCNView
        sceneView.scene = scene
        
        sceneView.showsStatistics = true
        sceneView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sceneView.allowsCameraControl = true
    }
    
    func updateUI() {
        guard let planet = planet else { return }
        planetNodeName = planet.planetName
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

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

    @IBOutlet weak var presentedPlanetNameLabel: UILabel!
    @IBOutlet weak var presentedPlanetDescriptionLabel: UILabel!
    @IBOutlet weak var infoStackView: UIStackView!
    
    var planet: Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        let scene = SCNScene()
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5.0)
        
        scene.rootNode.addChildNode(cameraNode)
        
        if planetNodeName == "Sun" {
            let lightNode = SCNNode()
            lightNode.light = SCNLight()
            lightNode.light?.type = .probe
            lightNode.position = SCNVector3(x: 0, y: 0, z: 0)
            scene.rootNode.addChildNode(lightNode)
        }
        else
        {
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 5)
        scene.rootNode.addChildNode(lightNode)
        }
        
        let stars = SCNParticleSystem(named: "StarsParticles.scnp", inDirectory: nil)!
        scene.rootNode.addParticleSystem(stars)
        
        let presentedNode = PresentedPlanetNode()
        scene.rootNode.addChildNode(presentedNode)
        
        let sceneView = view.subviews.first as! SCNView
        sceneView.scene = scene
        
        
        sceneView.showsStatistics = false
        sceneView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sceneView.allowsCameraControl = true
    }
    
    func updateUI() {
        guard let presentedPlanet = planet else { return }
        infoStackView.isHidden = true
        planetNodeName = presentedPlanet.planetName
        presentedPlanetNameLabel.text = presentedPlanet.planetName
        presentedPlanetDescriptionLabel.text = presentedPlanet.description
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        infoStackView.isHidden.toggle()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

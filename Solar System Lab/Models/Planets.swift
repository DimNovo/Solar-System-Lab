//
//  Planets.swift
//  Solar System Lab
//
//  Created by Dmitry Novosyolov on 17/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit
import SceneKit

var planetNodeName: String?

class PresentedPlanetNode: SCNNode {
        override init() {
        super.init()
            
            switch planetNodeName {
            case "Earth":
                self.geometry = SCNSphere(radius: CGFloat(1.0))
                self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earthDiffuse")
                self.geometry?.firstMaterial?.specular.contents = UIImage(named: "earthSpecular")
                self.geometry?.firstMaterial?.emission.contents = UIImage(named: "earthEmission")
                self.geometry?.firstMaterial?.normal.contents = UIImage(named: "earthNormal")
            case "Venus":
                self.geometry = SCNSphere(radius: CGFloat(0.95))
                self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "venusDiffuse")
                self.geometry?.firstMaterial?.specular.contents = UIImage(named: "venusSpecular")
            case "Moon":
                self.geometry = SCNSphere(radius: CGFloat(0.37))
                self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "moonDiffuse")
            case "Mars":
                self.geometry = SCNSphere(radius: CGFloat(0.53))
                self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "marsDiffuse")
            case "Jupiter":
                self.geometry = SCNSphere(radius: CGFloat(1.5))
                self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "jupiterDiffuse")
            case "Sun":
                self.geometry = SCNSphere(radius: CGFloat(1.7))
                self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "sunDiffuse")
            default:
                break
            }
            
            self.geometry?.firstMaterial?.shininess = 55
            let action = SCNAction.rotate(by: (360 * CGFloat(Double.pi / 180)), around: SCNVector3(0, 1, 0), duration: 10)
            let repeatAction = SCNAction.repeatForever(action)
            self.runAction(repeatAction)
            
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

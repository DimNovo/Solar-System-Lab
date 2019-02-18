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

struct Planet {
    var planetImage: UIImage
    var description: String
    var planetName: String
    
    static func load() -> [Planet] {
        return [
            Planet(planetImage: UIImage(named: "Earth")!,
                   description: "Earth is the third planet from the Sun and the only astronomical object known to harbor life.",
                   planetName: "Earth"),
            Planet(planetImage: UIImage(named: "Moon")!,
                   description: "Moon",
                   planetName: "Moon"),
            Planet(planetImage: UIImage(named: "Mars")!,
                   description: "Mars",
                   planetName: "Mars"),
            Planet(planetImage: UIImage(named: "Venus")!,
                   description: "Venus",
                   planetName: "Venus"),
            Planet(planetImage: UIImage(named: "Jupiter")!,
                   description: "Jupiter",
                   planetName: "Jupiter")
        ]
    }
}

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
            default:
                break
            }
            
            self.geometry?.firstMaterial?.shininess = 55
            let action = SCNAction.rotate(by: (360 * CGFloat(Double.pi / 180)), around: SCNVector3(0, 1, 0), duration: 8)
            let repeatAction = SCNAction.repeatForever(action)
            self.runAction(repeatAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

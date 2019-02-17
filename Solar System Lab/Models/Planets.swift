//
//  Planets.swift
//  Solar System Lab
//
//  Created by Dmitry Novosyolov on 17/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SceneKit

struct Planet {
    var planetImage: UIImage
    var description: String
    var planetName: String
    
    static func load() -> [Planet] {
        return [
            Planet(planetImage: UIImage(named: "Earth")!, description: "Earth", planetName: "Earth"),
            Planet(planetImage: UIImage(named: "Moon")!, description: "Moon", planetName: "Moon"),
            Planet(planetImage: UIImage(named: "Mars")!, description: "Mars", planetName: "Mars"),
            Planet(planetImage: UIImage(named: "Venus")!, description: "Venus", planetName: "Venus"),
            Planet(planetImage: UIImage(named: "Neptune")!, description: "Neptune", planetName: "Neptune")
        ]
    }
}



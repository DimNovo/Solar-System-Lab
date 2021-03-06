//
//  PlanetsListTableViewController.swift
//  Solar System Lab
//
//  Created by Dmitry Novosyolov on 17/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit
import SceneKit

class PlanetsListTableViewController: UITableViewController {

    var planets = [Planet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackOpaque
        self.navigationController?.navigationBar.barTintColor  = UIColor.clear
        
        loadPlanets()
    }
    
    func loadPlanets() {
        planets = Planet.load()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell") as! PlanetViewCell
        
        let planet = planets[indexPath.row]
        
        configure(cell: cell, with: planet)
        return cell
    }
    
    func configure(cell: PlanetViewCell, with planet: Planet) {
        cell.planetImageView.image = planet.planetImage
        cell.planetNameLabel.text = planet.planetName
        cell.planetDescriptionLabel.text = planet.planetDescription
        cell.contentView.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "PlanetPresentationSegue" else { return }
        let controller = segue.destination as! PlanetPresentationViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        controller.planet = planets[indexPath.row]
    }
}

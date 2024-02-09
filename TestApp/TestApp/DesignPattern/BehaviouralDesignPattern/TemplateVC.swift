//
//  TemplateVC.swift
//  TestApp
//
//  Created by Jony on 02/02/24.
//

import UIKit

class TemplateVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let roseGarden = RoseGarden()
        roseGarden.prepare()
    }
}

protocol Garden {
    func prepareSoil()
    func plantSeeds()
    func waterPlants()
    func prepareGarden()
}

extension Garden {
    func prepareGarden() {
        prepareSoil()
        plantSeeds()
        waterPlants()
    }
}

//MARK: Template Design Pattern
final class RoseGarden: Garden {
    
    func prepare() {
        prepareGarden()
    }

    func prepareSoil() {
        print ("prepare soil for rose garden")
    }

    func plantSeeds() {
        print ("plant seeds for rose garden")
    }

    func waterPlants() {
       print ("water the rose garden")
    }
}

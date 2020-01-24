//
//  DetailedManualViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 23.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit
import WebKit

class DetailedManualViewController: UIViewController {

    var exc: Exercise?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var kindLabel: UILabel!
    
    @IBOutlet weak var targetingLabel: UILabel!
    
    @IBOutlet weak var synergistLabel: UILabel!
    
    @IBOutlet weak var technicLabel: UILabel!
    
    @IBOutlet weak var videoWebView: UIWebView!
    
    @IBOutlet weak var videoWebKit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Name: " + exc!.name
        kindLabel.text = "Type: " + exc!.kind
        targetingLabel.text = "Targeting: " + exc!.targetingMuscles
        synergistLabel.text = "Synergists: " + exc!.synergistsMuscles
        technicLabel.text = "Technic: " + exc!.technic
        
        getVideo(exc!.videoURL)
        
//        print(exc)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "StartPage", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainPageID")
        self.present(viewController, animated: true)
    }
    
    func getVideo(_ videoURL: URL) {
//        videoWebView.loadRequest(URLRequest(url: videoURL))
        videoWebKit.load(URLRequest(url: videoURL))
    }
    
    func create(_ exercise: Exercise) {
        self.exc = exercise
    }
}

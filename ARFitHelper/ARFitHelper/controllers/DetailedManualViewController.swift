//
//  DetailedManualViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 23.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit
import WebKit

class DetailedManualViewController: UIViewController{

    var exc: Exercise?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var kindLabel: UILabel!
    
    @IBOutlet weak var targetingLabel: UILabel!
    
    @IBOutlet weak var synergistLabel: UILabel!
    
    @IBOutlet weak var technicLabel: UILabel!
    
    @IBOutlet weak var webKit: WKWebView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = "Exercise"
        
        nameLabel.text = "Name: " + exc!.name
        kindLabel.text = "Type: " + exc!.kind
        targetingLabel.text = "Targeting: " + exc!.targetingMuscles
        synergistLabel.text = "Synergists: " + exc!.synergistsMuscles
        technicLabel.text = "Technic: " + exc!.technic
                
        getVideo(URL(string: exc!.videoURL)!)
        
        
//        if videoWebKit.isLoading == true {
//            activityLoader.startAnimating()
//        }
        
//        if videoWebKit.isLoading == false {
//            activityLoader.stopAnimating()
//            activityLoader.removeFromSuperview()
//        }
        
    }
    
//    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
//        activityLoader.stopAnimating()
//        activityLoader.removeFromSuperview()
//    }

    
    @IBAction func backButtonPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "StartPage", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainPageID")
        self.present(viewController, animated: true)
    }
    
    func getVideo(_ videoURL: URL) {
//        newVideoWebKit.load(URLRequest(url: videoURL))
        webKit.load(URLRequest(url: videoURL))
    }
    
    func create(_ exercise: Exercise) {
        self.exc = exercise
    }
    

}

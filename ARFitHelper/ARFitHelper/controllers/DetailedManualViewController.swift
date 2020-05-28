//
//  DetailedManualViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 23.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit
import WebKit

class DetailedManualViewController: UIViewController, WKNavigationDelegate {

    var exc: Exercise?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var kindLabel: UILabel!
    
    @IBOutlet weak var targetingLabel: UILabel!
    
    @IBOutlet weak var synergistLabel: UILabel!
    
    @IBOutlet weak var technicLabel: UILabel!
    
    @IBOutlet weak var webKit: WKWebView!
    
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webKit.navigationDelegate = self
        self.webKit.isAccessibilityElement = true
        self.webKit.accessibilityIdentifier = "webViewVideo"
        
        title = "Exercise"
        
        nameLabel.text = "Name: " + exc!.name
        kindLabel.text = "Type: " + exc!.kind
        targetingLabel.text = "Targeting: " + exc!.targetingMuscles
        synergistLabel.text = "Synergists: " + exc!.synergistsMuscles
        technicLabel.text = "Technic: " + exc!.technic
       
        getVideo(URL(string: exc!.videoURL)!)
        
        
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityLoader.startAnimating()
        activityLoader.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityLoader.stopAnimating()
        activityLoader.isHidden = true
    }
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "loading" {
//            if webKit.isLoading {
//                activityLoader.startAnimating()
//                activityLoader.isHidden = false
//            } else {
//                activityLoader.stopAnimating()
//            }
//        }
//    }
    
    @IBAction func backButtonPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "StartPage", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainPageID")
        self.present(viewController, animated: true)
    }
    
    func getVideo(_ videoURL: URL) {
        webKit.load(URLRequest(url: videoURL))
    }
    
    func create(_ exercise: Exercise) {
        self.exc = exercise
    }
    
//    func webViewDidStartLoad(_ webView: UIWebView) {
//        activityLoader.isHidden = false
//        activityLoader.startAnimating()
//    }
//
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        activityLoader.stopAnimating()
//        activityLoader.isHidden = true
//    }
}

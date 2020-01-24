//
//  SceneDelegate.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 16.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        FirebaseApp.configure()
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.showModeaAuth()
            }
        }
        
        addFewExercises()
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func showModeaAuth() {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let newViewController = storyboard.instantiateViewController(identifier: "RegisterViewControllerID") as! RegisterViewController
        self.window?.rootViewController?.present(newViewController, animated: true, completion: nil)
    }
    
    func addFewExercises() {
        let ref = Database.database().reference().child("exercises")
        ref.child("bench-press").setValue(["exercisename": "bench-press", "kind": "basic", "targetingMusclesGroup": "chest", "synergistsMusclesGroup": "triceps", "technic": "lie and work hard lie and work hard lie and work hard lie and work hard lie and work hard", "videoURL": "https://youtu.be/sbB_0N_AfHg"])
        ref.child("boom pressure on the inclined bench").setValue(["exercisename": "boom pressure on the inclined bench", "kind": "basic", "targetingMusclesGroup": "big pectoral, small pectoral", "synergistsMusclesGroup": "triceps", "technic": "lie and work hard on the inclined bench", "videoURL": "https://youtu.be/_Wqq1D8FHKI"])
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}


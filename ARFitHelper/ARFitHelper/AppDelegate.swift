//
//  AppDelegate.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 16.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        addFewExercises()
        IQKeyboardManager.shared().isEnabled = true
        
        return true
    }
    
    func addFewExercises() {
           let ref = Database.database().reference().child("exercises")
           ref.child("bench-press").setValue(["exercisename": "bench-press", "kind": "basic", "targetingMusclesGroup": "chest", "synergistsMusclesGroup": "triceps", "technic": "lie and work hard lie and work hard lie and work hard lie and work hard lie and work hard", "videoURL": "https://youtu.be/sbB_0N_AfHg"])
           ref.child("boom pressure on the inclined bench").setValue(["exercisename": "boom pressure on the inclined bench", "kind": "basic", "targetingMusclesGroup": "big pectoral, small pectoral", "synergistsMusclesGroup": "triceps", "technic": "lie and work hard on the inclined bench", "videoURL": "https://youtu.be/_Wqq1D8FHKI"])
           ref.child("lying bench-press with free weights").setValue(["exercisename": "lying bench-press with free weights", "kind": "basic", "targetingMusclesGroup": "big pectoral, small pectoral", "synergistsMusclesGroup": "triceps", "technic": "lie and work hard on the bench with free weights", "videoURL": "https://youtu.be/n48eoyd53kk"])
           ref.child("test").setValue(["exercisename": "test", "kind": "test", "targetingMusclesGroup": "test", "synergistsMusclesGroup": "test", "technic": "test", "videoURL": "https://youtu.be/n48eoyd53kk"])
       }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "ARFitHelper")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}


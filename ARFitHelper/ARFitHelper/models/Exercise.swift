//
//  Exercise.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 22.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import Foundation

class Exercise {
    let name: String
    let kind: String
    let targetingMuscles: String
    let synergistsMuscles: String
    let technic: String
    let videoURL: URL
    
    init(name: String, kind: String, targetingMuscles: String, synergistsMuscles: String, technic: String, videoURL: URL) {
        self.name = name
        self.kind = kind
        self.targetingMuscles = targetingMuscles
        self.synergistsMuscles = synergistsMuscles
        self.technic = technic
        self.videoURL = videoURL
    }
}

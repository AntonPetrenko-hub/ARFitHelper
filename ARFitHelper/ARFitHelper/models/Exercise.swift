//
//  Exercise.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 22.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import Foundation

//class Exercise: Decodable {
//    let name: String
//    let kind: String
//    let targetingMuscles: String
//    let synergistsMuscles: String
//    let technic: String
//    let videoURL: URL
//
//    init(name: String, kind: String, targetingMuscles: String, synergistsMuscles: String, technic: String, videoURL: URL) {
//        self.name = name
//        self.kind = kind
//        self.targetingMuscles = targetingMuscles
//        self.synergistsMuscles = synergistsMuscles
//        self.technic = technic
//        self.videoURL = videoURL
//    }
//}

class Exercise: Codable {
    let name: String
    let kind: String
    let targetingMuscles: String
    let synergistsMuscles: String
    let technic: String
    let videoURL: String
    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case kind
//        case targetingMuscles
//        case synergistsMuscles
//        case technic
//        case videoURL
//    }
    
    init(name: String, kind: String, targetingMuscles: String, synergistsMuscles: String, technic: String, videoURL: String) {
        self.name = name
        self.kind = kind
        self.targetingMuscles = targetingMuscles
        self.synergistsMuscles = synergistsMuscles
        self.technic = technic
        self.videoURL = videoURL
    }
    
//    required init(from decoder: Decoder) throws {
//           let values = try decoder.container(keyedBy: CodingKeys.self)
//           name = try values.decode(String.self, forKey: .name)
//           kind = try values.decode(String.self, forKey: .kind)
//           targetingMuscles = try values.decode(String.self, forKey: .targetingMuscles)
//           synergistsMuscles = try values.decode(String.self, forKey: .synergistsMuscles)
//           technic = try values.decode(String.self, forKey: .technic)
//           videoURL = try values.decode(String.self, forKey: .videoURL)
//       }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//        try container.encode(kind, forKey: .kind)
//        try container.encode(targetingMuscles, forKey: .targetingMuscles)
//        try container.encode(synergistsMuscles, forKey: .synergistsMuscles)
//        try container.encode(technic, forKey: .technic)
//        try container.encode(videoURL, forKey: .videoURL)
//    }
}

// MARK: - User Defaults -

extension Exercise {
    
    static let userDefaultsKey = "ExercisesKey"
    
    static func save (_ exercises: [Exercise]) {
        let data = try? JSONEncoder().encode(exercises)
        UserDefaults.standard.set(data, forKey: Exercise.userDefaultsKey)
    }
    
    static func loadExercises () -> [Exercise] {
        var returnValue: [Exercise] = []
        
        if let data = UserDefaults.standard.data(forKey: Exercise.userDefaultsKey),
            let exercises = try? JSONDecoder().decode([Exercise].self, from: data) {
            returnValue = exercises
        }
        
        return returnValue
    }
}

var chosenExercises = Exercise.loadExercises() {
    didSet {
        Exercise.save(chosenExercises)
    }
}

var exercises = [Exercise]()

//[Exercise(name: "Cardio", kind: "basic", targetingMuscles: "heart", synergistsMuscles: "body", technic: "run", videoURL: "https://youtu.be/A66_4_4eyVg")]

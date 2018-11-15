//
//  jsonParser.swift
//  Field Survey
//
//  Created by Riley Evans on 11/14/18.
//  Copyright © 2018 Riley Evans. All rights reserved.
//

import Foundation

class jsonParser {
    static let dateFormatter = ISO8601DateFormatter()
    class func parse(_ data: Data)-> [Observation] {
        var observationList = [Observation]()
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as?[String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    let jsonData = observation as? [String: String]
                    let classificationString = jsonData?["classification"]
                    var classification: Class?
                    switch classificationString {
                        case "bird": classification = Class.bird
                        case "amphibian": classification = Class.amphibian
                        case "reptile": classification = Class.reptile
                        case "insect": classification = Class.insect
                        case "fish": classification = Class.fish
                        case "plant": classification = Class.plant
                        case "mammal": classification = Class.mammal
                        default : ()
                    }
                    let title = jsonData?["title"]
                    let description = jsonData?["description"]
                    let dateString = jsonData?["date"]
                    let date = dateFormatter.date(from: dateString!)
                    if (date != nil) {
                        print("it worked")
                        let addition = Observation(classification!, title!, description!, date!)
                        observationList.append(addition)
                    } else { print(dateString ?? "Date Parse Failure") }
                    
                }
            }
        }
        return observationList
    }
}

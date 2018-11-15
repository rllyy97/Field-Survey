//
//  jsonLoader.swift
//  Field Survey
//
//  Created by Riley Evans on 11/14/18.
//  Copyright © 2018 Riley Evans. All rights reserved.
//

import Foundation

class jsonLoader {
    class func load(fileName: String) -> [Observation] {
        var observation = [Observation]()
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            observation = jsonParser.parse(data)
        }
        return observation
    }
}

//
//  Character.swift
//  Assignment
//
//  Created by Saim Zahid on 2019-08-19.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

public struct Character: Codable {
    public let id: Int
    public let name: String
    public let status: String
    public let image: String
    public let gender: String
    public let species: String
    public let created: String
}

extension Character {
    func isAlive() -> Bool {
        return self.status == "Alive"
    }
}

//
//  CharacterTests.swift
//  CharacterTests
//
//  Created by Saim Zahid on 2019-08-19.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import XCTest
@testable import Assignment

class CharacterTests: XCTestCase {
    var list = [Character]()
    
    override func setUp() {
        list = [
            Character(id: 1, name: "Rick", status: "Alive", image: "", gender: "", species: "", created: ""),
            Character(id: 2, name: "Morty", status: "Alive", image: "", gender: "", species: "", created: ""),
            Character(id: 3, name: "Bob", status: "Dead", image: "", gender: "", species: "", created: "")
        ]
    }

    func testSetsIsAliveToTrueIfStatusIsAlive() {
        XCTAssertTrue(list.first!.isAlive())
    }
    
    func testSetsIsAliveToFalseIfStatusIsNotAlive() {
        XCTAssertFalse(list.last!.isAlive())
    }
}

//
//  CharactersTableViewControllerTests.swift
//  AssignmentTests
//
//  Created by Saim Zahid on 2019-08-20.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import XCTest
@testable import Assignment

class CharactersTableViewControllerTests: XCTestCase {
    let charactersTableVC = CharactersTableViewController()
    var aliveCharacters = [Character]()
    var deadCharacters = [Character]()
    
    override func setUp() {
        aliveCharacters = [
            Character(id: 1, name: "Rick", status: "Alive", image: "", gender: "", species: "", created: ""),
            Character(id: 2, name: "Morty", status: "Alive", image: "", gender: "", species: "", created: ""),
        ]
        deadCharacters = [
            Character(id: 3, name: "Bob", status: "Dead", image: "", gender: "", species: "", created: "")
        ]
        charactersTableVC.killCharacter(IndexPath(row: 0, section: 0), aliveArray: &aliveCharacters, deadArray: &deadCharacters)
    }
    
    func testKilledCharacterGetsAddedToDeadArray() {
       XCTAssertTrue(deadCharacters.count == 2)
    }
    
    func testKilledCharacterGetsRemovedFromAliveArray() {
        XCTAssertTrue(aliveCharacters.count == 1)
    }
    

}

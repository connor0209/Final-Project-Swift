//
//  t5Tests.swift
//  t5Tests
//
//  Created by Admin on 14/02/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import XCTest
@testable import t5

class t5Tests: XCTestCase {
    var numPlayers = 0
    var rounds = 0
    var groupSize = 0
    var numGroups = 0
    var mTwo = 0
    var mThree = 0
    var mFour = 0
    var prio = true
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        numPlayers = 9
        rounds = 4;
        groupSize = 3
        numGroups = 3
        mTwo = 0
        mThree = 0
        mFour = 0
        prio = true
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        numPlayers = 0
        rounds = 0;
        groupSize = 0
        numGroups = 0
        mTwo = 0
        mThree = 0
        mFour = 0
        prio = true
    }
    
    func testCorrectRounds() {
        let search = Search()
        let group = search.search(numPlayer: numPlayers, rounds: rounds, groupSize: groupSize, numGroups: numGroups, mTwo: mTwo, mThree: mThree, mFour: mFour, prio: prio)
        XCTAssertTrue(group.count == 4)
    }
    
    func testCorrectGroupsPerRound() {
        let search = Search()
        let group = search.search(numPlayer: numPlayers, rounds: rounds, groupSize: groupSize, numGroups: numGroups, mTwo: mTwo, mThree: mThree, mFour: mFour, prio: prio)
        XCTAssertTrue(group[0].count == 3)
    }

    
    func testSearchPerformance() {
        // This is an example of a performance test case.
        self.measure {
            let search = Search()
            let group = search.search(numPlayer: self.numPlayers, rounds: self.rounds, groupSize: self.groupSize, numGroups: self.numGroups, mTwo: self.mTwo, mThree: self.mThree, mFour: self.mFour, prio: self.prio)


            
        }
    }
    
}

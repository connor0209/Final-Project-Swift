//
//  t5UITests.swift
//  t5UITests
//
//  Created by Admin on 14/02/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import XCTest

class t5UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreatingGroupInGUI() {
        let app = XCUIApplication()
        app.buttons["Get Started"].tap()
        let element = app.otherElements.containing(.navigationBar, identifier:"t5.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let incrementButton = element.children(matching: .stepper).element(boundBy: 0).buttons["Increment"]
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        element.children(matching: .textField).element.tap()
        app.pickerWheels["2"].press(forDuration: 1.9);
        
        let incrementButton2 = element.children(matching: .stepper).element(boundBy: 1).buttons["Increment"]
        incrementButton2.tap()
        incrementButton2.tap()
        app.buttons["GO"].tap()
    }
    
    func testSavingAFile(){
        
        let app = XCUIApplication()
        let element = app.otherElements.containing(.navigationBar, identifier:"t5.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let incrementButton = element.children(matching: .stepper).element(boundBy: 0).buttons["Increment"]
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        element.children(matching: .textField).element.tap()
        app.pickerWheels["2"].press(forDuration: 1.5);
        element.children(matching: .stepper).element(boundBy: 1).buttons["Increment"].tap()
        app.buttons["GO"].tap()
        app.navigationBars["Rounds"].buttons["Save"].tap()
        app.alerts["Save"].collectionViews.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("new")
        app.typeText("Test")
        app.otherElements.containing(.navigationBar, identifier:"t5.SavesTableView").children(matching: .other).element.children(matching: .other).element.children(matching: .table).element.tap()
        
    }
    
    func testSaveFileWithNoName(){
        let app = XCUIApplication()
        app.buttons["Get Started"].tap()
        let element = app.otherElements.containing(.navigationBar, identifier:"t5.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let incrementButton = element.children(matching: .stepper).element(boundBy: 0).buttons["Increment"]
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        element.children(matching: .textField).element.tap()
        app.pickerWheels["2"].press(forDuration: 1.9);
        element.children(matching: .stepper).element(boundBy: 1).buttons["Increment"].tap()
        app.buttons["GO"].tap()
        app.navigationBars["Rounds"].buttons["Save"].tap()
        let okButton = app.alerts["Save"].buttons["OK"]
        okButton.tap()
        okButton.tap()
        
    }
    
    func testLoadSaveFile(){        
        let app = XCUIApplication()
        app.buttons["Get Started"].tap()
        let element = app.otherElements.containing(.navigationBar, identifier:"t5.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let incrementButton = element.children(matching: .stepper).element(boundBy: 0).buttons["Increment"]
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        element.children(matching: .textField).element.tap()
        app.pickerWheels["2"].press(forDuration: 2.9);
        app.buttons["GO"].tap()
        app.navigationBars["Rounds"].buttons["Save"].tap()
        app.alerts["Save"].collectionViews.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("temp save")
        app.tables.staticTexts["temp save"].tap()
        
    }
    
    func testViewStatistics(){
        let app = XCUIApplication()
        let element = app.otherElements.containing(.navigationBar, identifier:"t5.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let incrementButton = element.children(matching: .stepper).element(boundBy: 0).buttons["Increment"]
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        element.children(matching: .textField).element.tap()
        app.pickerWheels["2"].press(forDuration: 2.4);
        element.children(matching: .stepper).element(boundBy: 1).buttons["Increment"].tap()
        app.buttons["GO"].tap()
        app.tables.buttons["Statistics"].tap()
        
    }
    
    func testExportToEmail(){
        let app = XCUIApplication()
        app.buttons["Get Started"].tap()
        let element = app.otherElements.containing(.navigationBar, identifier:"t5.View").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let incrementButton = element.children(matching: .stepper).element(boundBy: 0).buttons["Increment"]
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
        element.children(matching: .textField).element.tap()
        app.pickerWheels["2"].press(forDuration: 1.7);
        element.children(matching: .stepper).element(boundBy: 1).buttons["Increment"].tap()
        app.buttons["GO"].tap()
        app.navigationBars["Rounds"].buttons["Share"].tap()
        
    }
    
        
}

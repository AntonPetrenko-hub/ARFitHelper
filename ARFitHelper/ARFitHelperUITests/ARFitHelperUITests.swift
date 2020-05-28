//
//  ARFitHelperUITests.swift
//  ARFitHelperUITests
//
//  Created by Антон Петренко on 07.04.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import XCTest

class ARFitHelperUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessfullRegistration() {
        let app = XCUIApplication()
        app.launch()
        
        let nextButton = app.toolbars["Toolbar"].buttons["Next"]
        let doneButton = app.toolbars["Toolbar"].buttons["Done"]
        
        app.textFields["Enter your name"].tap()
        app.textFields["Enter your name"].typeText("John")
        nextButton.tap()
        app.textFields["Enter your surname"].typeText("Snow")
        nextButton.tap()
        app.textFields["Enter your e-mail"].typeText("johnsnow@gmail.com")
        nextButton.tap()
        app.textFields["Enter your password"].typeText("johnsnow1")
        doneButton.tap()
        app.buttons["Register"].tap()
        app.buttons["Ok"].waitForExistence(timeout: 3)
        app.buttons["Ok"].tap()
        
        let manualTable = app.tables["ManualTable"]
        manualTable.waitForExistence(timeout: 5)
        XCTAssertTrue(manualTable.exists)
    }
    
    func testSuccessfullLogin() {
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Register"].buttons["Back"].tap()
        app.textFields["Login"].tap()
        app.textFields["Login"].typeText("johnsnow@gmail.com")
        app.toolbars["Toolbar"].buttons["Next"].tap()
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText("johnsnow1")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app.buttons["Log in"].tap()
        let manualTable = app.tables["ManualTable"]
        manualTable.waitForExistence(timeout: 5)
        XCTAssertTrue(manualTable.exists)
    }
    
    func testTableCellChoosing() {
        let app = XCUIApplication()
        app.launch()
        let manualTable = app.tables["ManualTable"]
        manualTable.waitForExistence(timeout: 5)
        manualTable.cells.element(matching: .cell, identifier: "manualCell_1").tap()
        app.webViews["webViewVideo"].waitForExistence(timeout: 40)
        XCTAssertTrue(app.webViews["webViewVideo"].exists)
        app.children(matching: .window).element(boundBy: 1).children(matching: .other).element.waitForExistence(timeout: 10.0)
        sleep(20)
        app.windows.element(boundBy: 0).coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).tap()
        app/*@START_MENU_TOKEN@*/.buttons["Mute Toggle"]/*[[".buttons[\"Volume\"]",".buttons[\"Mute Toggle\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Done"].tap()
        app.navigationBars["Exercise"].buttons["Back"].tap()
        manualTable.cells["manualCell_0"].buttons["Add"].tap()
        let okButton = app.alerts["Exercise list changing"].scrollViews.otherElements.buttons["Ok"]
        okButton.tap()
        manualTable.cells["manualCell_1"].buttons["Add"].tap()
        okButton.tap()
        app.tabBars.buttons["Chosen exercises"].tap()
        
    }
    
    func testFailAndSuccessfulAddingExercise() {
        
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Add exercise"].tap()
        app.staticTexts["Add exercise"].tap()
        app.buttons["Ok"].tap()
        app.textFields["NewExerciseName"].tap()
        app.textFields["NewExerciseName"].typeText("testOne")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app.textFields["NewExerciseKind"].tap()
        app.textFields["NewExerciseKind"].typeText("testOne")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app.textFields["NewExerciseTargetingMuscles"].tap()
        app.textFields["NewExerciseTargetingMuscles"].typeText("testOne")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app.textFields["NewExerciseSynergistsMuscles"].tap()
        app.textFields["NewExerciseSynergistsMuscles"].typeText("testOne")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app.textFields["NewExerciseTechnic"].tap()
        app.textFields["NewExerciseTechnic"].typeText("testOne")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app.textFields["NewExerciseVideoURL"].tap()
        app.textFields["NewExerciseVideoURL"].typeText("testOne")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app.staticTexts["Add exercise"].tap()
        app.buttons["Ok"].tap()
    }
    
    func testDoingTraining() {
        
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Start training"].tap()
        app.staticTexts["Begin"].tap()
        app.windows.element(boundBy: 0).coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.28)).tap()
        app.staticTexts["Next"].tap()
        let pickerCoordinate = app.windows.element(boundBy: 0).coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.4))
        pickerCoordinate.tap()
        let finish = app.staticTexts["Finish"]
        finish.tap()
        pickerCoordinate.tap()
        finish.tap()
        pickerCoordinate.tap()
        finish.tap()
        pickerCoordinate.tap()
        finish.tap()
        app.buttons["Ok"].tap()
    }
    
    func testLogOut() {
        
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Profile"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Log out"]/*[[".buttons[\"Log out\"].staticTexts[\"Log out\"]",".staticTexts[\"Log out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        
       
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

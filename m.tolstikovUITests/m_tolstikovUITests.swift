//
//  m_tolstikovUITests.swift
//  m.tolstikovUITests
//
//  Created by Maxim Tolstikov on 01/07/2018.
//  Copyright © 2018 Maxim Tolstikov. All rights reserved.
//

import XCTest

class MtolstikovUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // swiftlint:disable all
    
    // Вход когда пользователь не зарегистрирован
    func testAuthWhenUserIsNotReg() { 
        
        
        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery
            .otherElements
            .containing(.staticText, identifier: "Логин")
        elementsQuery
            .children(matching: .textField)
            .element(boundBy: 0).tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        let dKey = app/*@START_MENU_TOKEN@*/.keys["d"]/*[[".keyboards.keys[\"d\"]",".keys[\"d\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dKey.tap()
        let mKey = app/*@START_MENU_TOKEN@*/.keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        mKey.tap()
        let iKey = app/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        let nKey = app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nKey.tap()
        elementsQuery.children(matching: .textField).element(boundBy: 1).tap()
        let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        let key2 = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        let key3 = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        let key4 = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        let key5 = app/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5.tap()
        let key6 = app/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key6.tap()
        let elementsQuery2 = scrollViewsQuery.otherElements
        elementsQuery2.buttons["Вход"].tap()
        app.alerts["Пользователь не найден!"].buttons["OK"].tap()
        scrollViewsQuery.children(matching: .other).element(boundBy: 0).swipeUp()
        elementsQuery2.buttons["Регистрация"].tap()
        
        let element = scrollViewsQuery.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element(boundBy: 0).children(matching: .textField).element.tap()
        aKey.tap()
        dKey.tap()
        mKey.tap()
        iKey.tap()
        nKey.tap()
        element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.tap()
        moreKey.tap()
        key.tap()
        key2.tap()
        key3.tap()
        key4.tap()
        key5.tap()
        key6.tap()
        snapshot("Registration")
        app/*@START_MENU_TOKEN@*/.navigationBars["Регистрация"]/*[[".scrollViews.navigationBars[\"Регистрация\"]",".navigationBars[\"Регистрация\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Done"].tap()
        app.navigationBars["m_tolstikov.ProductsListTableView"].buttons["Share"].tap()
        
    }
    
    
    // Вход когда пользователь существует
    func testAuthWhenUserIsExist() {
        
        
        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Логин")
        elementsQuery.children(matching: .textField).element(boundBy: 0).tap()
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        let dKey = app/*@START_MENU_TOKEN@*/.keys["d"]/*[[".keyboards.keys[\"d\"]",".keys[\"d\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dKey.tap()
        let mKey = app/*@START_MENU_TOKEN@*/.keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        mKey.tap()
        let iKey = app/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        let nKey = app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nKey.tap()
        elementsQuery.children(matching: .textField).element(boundBy: 1).tap()
        let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let key = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        let key2 = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        let key3 = app/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        let button = scrollViewsQuery.otherElements.buttons["Вход"]
        button.tap()
        app.alerts["Пароль введен не верно!"].buttons["OK"].tap()
        moreKey.tap()
        let key4 = app/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        snapshot("Login")
        button.tap()
        app.navigationBars["m_tolstikov.ProductsListTableView"].buttons["Share"].tap()
        
    }
    
}

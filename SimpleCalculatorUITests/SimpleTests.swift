import XCTest

class SimpleTests: XCTestCase {
    
    var calc = XCUIApplication(bundleIdentifier: "com.xctest.SimpleCalculator")

    override func setUpWithError() throws {
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
    }

    func testExample1() throws {
        calc.launch()
        calc.buttons["2"].firstMatch.tap()
        calc.buttons["+"].firstMatch.tap()
        calc.buttons["2"].firstMatch.tap()
        calc.buttons["="].firstMatch.tap()

        let result = Double(calc.staticTexts["4"].firstMatch.label)

        XCTAssertEqual(result, 4.0)
    }
    
    func testExample2() throws {
        calc.launch()
        XCTAssertEqual(calc.staticTexts["0"].firstMatch.label, "0", "!все хорошо")
        calc.buttons["5"].firstMatch.tap()
        XCTAssertEqual(calc.staticTexts["5"].firstMatch.label, "5", "все не очень хорошо")
        calc.buttons["AC"].firstMatch.tap()
        XCTAssertEqual(calc.staticTexts["0"].firstMatch.label, "0", "!все хорошо")
    }
    
    func testExample3() throws {
        calc.launch()

        calc.buttons["1"].firstMatch.tap()
        calc.buttons["/"].firstMatch.tap()
        calc.buttons["0"].firstMatch.tap()
        calc.buttons["="].firstMatch.tap()
        
        XCTAssertEqual(calc.staticTexts["inf"].firstMatch.label, "inf", "все не очень хорошо")
    }
    
    func testExampleFail() throws {
        calc.launch()
        XCTFail("Failure from xcui tests")
    }
    
    func testExampleThreadWait() throws {
        calc.launch()
        Thread.sleep(forTimeInterval: 5)
        XCTAssert(1 == 1)
    }
}

import XCTest

class SimpleCalculatorUITests: XCTestCase {
    private let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    private let calc = XCUIApplication(bundleIdentifier: "com.xctest.SimpleCalculator")

    private var addressBarButton: XCUIElement { safari.buttons["URL"].firstMatch }
    private var addressBarTextField: XCUIElement { safari.textFields["URL"].firstMatch }
    private var openDeeplinkButton: XCUIElement { safari.buttons["Открыть"] }
    private var link = "https://status.dropbox.com"
    private var loremipsum = "https://www.lipsum.com"

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testDefaultExample() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    func testDebugDescription() throws {
        let app = XCUIApplication()
        app.launch()
        print(app.debugDescription) // or use "po app" command in console
    }

    func testBundleID() {
        XCUIApplication(bundleIdentifier: "com.xctest.SimpleCalculator").launch()
    }
    
    func testSafari() throws {
        safari.launch()
        _ = safari.wait(for: .runningForeground, timeout: 30)

        safari.textFields["TabBarItemTitle"].firstMatch.tap()
        safari.textFields["URL"].firstMatch.typeText("Lorem Ipsum")
        safari.textFields["URL"].firstMatch.typeText("\n")
        XCTAssert(safari.links[loremipsum].waitForExistence(timeout: 10))
    }

    func testTest() throws {
        safari.launch()
        _ = safari.wait(for: .runningForeground, timeout: 30)

        safari.textFields["TabBarItemTitle"].firstMatch.tap()
        addressBarTextField.typeText(link)
        addressBarTextField.typeText("\n")
        XCTAssert(safari.staticTexts["Dropbox"].waitForExistence(timeout: 10))
    }
    
    func testAddSomeFun() throws {
        XCTContext.runActivity(named: "Open Safari") { _ in
            safari.launch()
            _ = safari.wait(for: .runningForeground, timeout: 30)
        }
    
        XCTContext.runActivity(named: "Open dropbox page") { _ in
            safari.textFields["TabBarItemTitle"].firstMatch.tap()
            addressBarTextField.typeText(link)
            addressBarTextField.typeText("\n")
        }
        
        XCTContext.runActivity(named: "Check dropbox page") { _ in
            XCTAssert(safari.staticTexts["Dropbox"].waitForExistence(timeout: 10))
        }
        
        XCTContext.runActivity(named: "Attcah") { _ in
            XCTAssert(safari.staticTexts["Dropbox"].waitForExistence(timeout: 10))
        }

    }

}

import XCTest
@testable import Sensazonal

class LocaleTests: XCTestCase {

    func testLocalizeAvocadoStringThenReturnAvocadoInPortuguese() {
        let avocado = Locale.localize("AVOCADO")

        XCTAssertEqual(avocado, "Abacate")
    }

    func testLocalizeWordThatDoesntExistThenReturnSameWord() {
        let string = "!@#$%^"

        let localized = Locale.localize(string)

        XCTAssertEqual(localized, string)
    }

}

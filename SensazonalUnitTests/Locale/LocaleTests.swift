import XCTest
@testable import Sensazonal

class LocaleTests: XCTestCase {

    func testLocalizeAvocadoStringThenReturnAvocadoInPortuguese() {
        let avocado = Locale.localize("AVOCADO")

        XCTAssertEqual(avocado, "Abacate")
    }
    
}

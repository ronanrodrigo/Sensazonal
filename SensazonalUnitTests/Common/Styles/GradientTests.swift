import XCTest
@testable import Sensazonal

final class GradientTests: XCTestCase {

    func testMakeGradientWithTwoColors() {
        let black = UIColor.black
        let transparentBlack = black.withAlphaComponent(0)

        let gradient = Gradient.make(startColor: .black)
        let cgColors: [CGColor]! = gradient.colors as? [CGColor]
        let startColorComponents = cgColors[1].components
        let endColorComponents = cgColors[0].components

        XCTAssertEqual(startColorComponents!, black.cgColor.components!)
        XCTAssertEqual(endColorComponents!, transparentBlack.cgColor.components!)
    }

}

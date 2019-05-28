import XCTest
@testable import Core

final class ListFoodInteractorFactoryTests: XCTestCase {

    func testMakeReturnsInteractorType() {
        let interactor = ListFoodInteractorFactory.make(presenter: ListFoodPresenterMock(), gateway: ListFoodGatewayMock())

        XCTAssertTrue(type(of: interactor) == ListFoodInteractor.self)
    }

}

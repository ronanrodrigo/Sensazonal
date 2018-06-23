import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class FavoritateFoodInteractorTests: XCTestCase {

    private var favoritateFoodGateway: FavoritateFoodStubGateway!
    private var favoriteFoodsGateway: FavoriteFoodStubGateway!
    private var interactor: FavoritateFoodInteractor!
    private var presenter: FavoriteFoodSpyPresenter!
    private let keyName = "TANGERINE"

    override func setUp() {
        super.setUp()
        favoritateFoodGateway = FavoritateFoodStubGateway()
        favoriteFoodsGateway = FavoriteFoodStubGateway()
        presenter = FavoriteFoodSpyPresenter()
        interactor = FavoritateFoodInteractor(favoritateGateway: favoritateFoodGateway, favoriteFoodsGateway: favoriteFoodsGateway,
                                              presenter: presenter)
    }

    func testFavoriteWhenFoodIsNotFavoritedThenFavoriteFood() {
        favoritateFoodGateway.resultStub = .success(keyName)
        favoriteFoodsGateway.foodsStub = .success([])

        interactor.favorite(keyName: keyName)

        XCTAssertTrue(favoritateFoodGateway.didFavoriteFood)
        XCTAssertEqual(favoritateFoodGateway.didFavoriteFoodKeyName, keyName)
    }

    func testFavoriteWhenFoodIsNotFavoritedThenPresentFavoritedFood() {
        favoritateFoodGateway.resultStub = .success(keyName)
        favoriteFoodsGateway.foodsStub = .success([])

        interactor.favorite(keyName: keyName)

        XCTAssertEqual(presenter.didPresentFavoritedWith, keyName)
    }

    func testFavoriteWhenFoodIsFavoritedThenUnfavoriteFood() {
        favoritateFoodGateway.resultStub = .success(keyName)
        favoriteFoodsGateway.foodsStub = .success([keyName])

        interactor.favorite(keyName: keyName)

        XCTAssertFalse(favoritateFoodGateway.didFavoriteFood)
        XCTAssertEqual(favoritateFoodGateway.didFavoriteFoodKeyName, keyName)
    }

    func testFavoriteWhenFoodIsFavoritedThenPreentUnfavoriteFood() {
        favoritateFoodGateway.resultStub = .success(keyName)
        favoriteFoodsGateway.foodsStub = .success([keyName])

        interactor.favorite(keyName: keyName)

        XCTAssertEqual(presenter.didPresentUnfavoritedWith, keyName)
    }

    func testFavoriteWhenErrorOcurrerOnRetriveFavoriteFoodsThenPresentError() {
        favoriteFoodsGateway.foodsStub = .failure(.unknown)

        interactor.favorite(keyName: keyName)

        XCTAssertTrue(presenter.didPresentError)
    }

    func testFavoriteWhenErrorOcurrerOnFavoritateAFoodThenPresentError() {
        favoritateFoodGateway.resultStub = .failure(.unknown)
        favoriteFoodsGateway.foodsStub = .success([keyName])

        interactor.favorite(keyName: keyName)

        XCTAssertTrue(presenter.didPresentError)
    }

}

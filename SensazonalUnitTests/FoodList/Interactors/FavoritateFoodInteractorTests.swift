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
        favoritateFoodGateway.resultStub = .success(Food(keyName: keyName, keyGroup: "", months: [], favorited: true))
        favoriteFoodsGateway.foodsStub = .success([])

        interactor.favorite(foodKeyName: keyName)

        XCTAssertTrue(favoritateFoodGateway.didFavoriteFood)
        XCTAssertEqual(favoritateFoodGateway.didFavoriteFoodKeyName, keyName)
    }

    func testFavoriteWhenFoodIsNotFavoritedThenPresentFavoritedFood() {
        favoritateFoodGateway.resultStub = .success(Food(keyName: keyName, keyGroup: "", months: [], favorited: true))
        favoriteFoodsGateway.foodsStub = .success([])

        interactor.favorite(foodKeyName: keyName)

        XCTAssertEqual(presenter.didPresentFavoritedWith?.keyName, keyName)
    }

    func testFavoriteWhenFoodIsFavoritedThenUnfavoriteFood() {
        favoritateFoodGateway.resultStub = .success(Food(keyName: keyName, keyGroup: "", months: [], favorited: false))
        favoriteFoodsGateway.foodsStub = .success([keyName])

        interactor.favorite(foodKeyName: keyName)

        XCTAssertFalse(favoritateFoodGateway.didFavoriteFood)
        XCTAssertEqual(favoritateFoodGateway.didFavoriteFoodKeyName, keyName)
    }

    func testFavoriteWhenFoodIsFavoritedThenPreentUnfavoriteFood() {
        favoritateFoodGateway.resultStub = .success(Food(keyName: keyName, keyGroup: "", months: [], favorited: false))
        favoriteFoodsGateway.foodsStub = .success([keyName])

        interactor.favorite(foodKeyName: keyName)

        XCTAssertEqual(presenter.didPresentUnfavoritedWith?.keyName, keyName)
    }

    func testFavoriteWhenErrorOcurrerOnRetriveFavoriteFoodsThenPresentError() {
        favoriteFoodsGateway.foodsStub = .failure(.unknown)

        interactor.favorite(foodKeyName: keyName)

        XCTAssertTrue(presenter.didPresentError)
    }

    func testFavoriteWhenErrorOcurrerOnFavoritateAFoodThenPresentError() {
        favoritateFoodGateway.resultStub = .failure(.unknown)
        favoriteFoodsGateway.foodsStub = .success([keyName])

        interactor.favorite(foodKeyName: keyName)

        XCTAssertTrue(presenter.didPresentError)
    }

}

import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class FavoritateFoodInteractorTests: XCTestCase {

    private var favoritateFoodGateway: FavoritateFoodStubGateway!
    private var favoriteFoodsGateway: FavoriteFoodStubGateway!
    private var interactor: FavoritateFoodInteractor!
    private var presenter: FavoriteFoodSpyPresenter!
    private let foodKey = Food.Key("TANGERINE", "FRUIT")

    override func setUp() {
        super.setUp()
        favoritateFoodGateway = FavoritateFoodStubGateway()
        favoriteFoodsGateway = FavoriteFoodStubGateway()
        presenter = FavoriteFoodSpyPresenter()
        interactor = FavoritateFoodInteractor(favoritateGateway: favoritateFoodGateway, favoriteFoodsGateway: favoriteFoodsGateway,
                                              presenter: presenter)
    }

    func testFavoriteWhenFoodIsNotFavoritedThenFavoriteFood() {
        favoritateFoodGateway.resultStub = .success(foodKey)
        favoriteFoodsGateway.foodsStub = .success([])

        interactor.favorite(foodKey: foodKey)

        XCTAssertTrue(favoritateFoodGateway.didFavoriteFood)
        XCTAssertEqual(favoritateFoodGateway.didFavoriteFoodKey, foodKey)
    }

    func testFavoriteWhenFoodIsNotFavoritedThenPresentFavoritedFood() {
        favoritateFoodGateway.resultStub = .success(foodKey)
        favoriteFoodsGateway.foodsStub = .success([])

        interactor.favorite(foodKey: foodKey)

        XCTAssertEqual(presenter.didPresentFavoritedWith, foodKey)
    }

    func testFavoriteWhenFoodIsFavoritedThenUnfavoriteFood() {
        favoritateFoodGateway.resultStub = .success(foodKey)
        favoriteFoodsGateway.foodsStub = .success([foodKey])

        interactor.favorite(foodKey: foodKey)

        XCTAssertFalse(favoritateFoodGateway.didFavoriteFood)
        XCTAssertEqual(favoritateFoodGateway.didFavoriteFoodKey, foodKey)
    }

    func testFavoriteWhenFoodIsFavoritedThenPreentUnfavoriteFood() {
        favoritateFoodGateway.resultStub = .success(foodKey)
        favoriteFoodsGateway.foodsStub = .success([foodKey])

        interactor.favorite(foodKey: foodKey)

        XCTAssertEqual(presenter.didPresentUnfavoritedWith, foodKey)
    }

    func testFavoriteWhenErrorOcurrerOnRetriveFavoriteFoodsThenPresentError() {
        favoriteFoodsGateway.foodsStub = .failure(.unknown)

        interactor.favorite(foodKey: foodKey)

        XCTAssertTrue(presenter.didPresentError)
    }

    func testFavoriteWhenErrorOcurrerOnFavoritateAFoodThenPresentError() {
        favoritateFoodGateway.resultStub = .failure(.unknown)
        favoriteFoodsGateway.foodsStub = .success([foodKey])

        interactor.favorite(foodKey: foodKey)

        XCTAssertTrue(presenter.didPresentError)
    }

}

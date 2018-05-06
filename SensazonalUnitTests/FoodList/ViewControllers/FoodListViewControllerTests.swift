import XCTest
import FBSnapshotTestCase
@testable import Sensazonal

final class FoodListViewControllerTests: FBSnapshotTestCase {

    private var foodViewModel: FoodViewModel { return FoodViewModel.sample }

    func testBindViewModelThenPopulateCollectionView() throws {
        let viewController = FoodListViewController()
        let viewModel = FoodListViewModel(foodsViewModel: [foodViewModel], month: try GregorianMonth(number: 1))

        viewController.bind(viewModel: viewModel)

        XCTAssertEqual(viewController.numberOfItemsImSection(0), 1)
    }

    func testNotCallBindViewModelThenGenerateEmptyDataSource() {
        let viewController = FoodListViewController()

        XCTAssertEqual(viewController.numberOfItemsImSection(0), 0)
    }

    func testBindViewModelThePresentViewControllerWithCollectionView() {
        let viewController = FoodListViewController()
        let month = try! GregorianMonth(number: 1) // swiftlint:disable:this force_try
        let viewModel = FoodListViewModel(foodsViewModel: [foodViewModel, foodViewModel, foodViewModel], month: month)

        viewController.bind(viewModel: viewModel)

        FBSnapshotVerifyView(viewController.view)
        FBSnapshotVerifyLayer(viewController.view.layer)
    }

    func testNavigationItemRightBarButtonItemWhenViewDidLoadThenIsAMonthSelectorBarButton() {
        let viewController = FoodListViewController()

        viewController.viewDidLoad()

        XCTAssertTrue(viewController.navigationItem.rightBarButtonItem!.isKind(of: MonthSelectorBarButton.self))
    }

    func testNavigationItemRightBarButtonItemWhenTappedThenOpenMonthSelector() {
        let viewController = FoodListViewController()
        let delegate = StubFoodListControllerDelegate()
        viewController.delegate = delegate
        viewController.viewDidLoad()
        let monthSelectorBarButton = viewController.navigationItem.rightBarButtonItem!

        UIApplication.shared.sendAction(monthSelectorBarButton.action!, to: monthSelectorBarButton.target!,
                                        from: self, for: nil)

        XCTAssertTrue(delegate.didOpenMonthSelector)
    }

    func testFoodsTotalWhenViewModelHasFoodsThenReturnTotalFoods() {
        let viewController = FoodListViewController()
        let month = try! GregorianMonth(number: 1) // swiftlint:disable:this force_try
        let viewModel = FoodListViewModel(foodsViewModel: [foodViewModel, foodViewModel, foodViewModel], month: month)
        viewController.bind(viewModel: viewModel)

        let totalFoods = viewController.foodsTotal()

        XCTAssertEqual(totalFoods, viewModel.foodsViewModel.count)
    }

    func testFoodsAtPositionWhenGivenAValidPositionFoodsThenReturnAFoodViewModel() {
        let viewController = FoodListViewController()
        let month = try! GregorianMonth(number: 1) // swiftlint:disable:this force_try
        let viewModel = FoodListViewModel(foodsViewModel: [foodViewModel, foodViewModel, foodViewModel], month: month)
        viewController.bind(viewModel: viewModel)

        let totalFoods = viewController.foodsTotal()

        XCTAssertEqual(totalFoods, viewModel.foodsViewModel.count)
    }

}

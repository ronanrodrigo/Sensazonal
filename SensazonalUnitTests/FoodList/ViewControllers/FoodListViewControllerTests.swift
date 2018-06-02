import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class FoodListViewControllerTests: XCTestCase {

    private var foodViewModel: [FoodGroupViewModel: [FoodViewModel]] { return [.sample: [.sample]] }

    func testBindViewModelThenPopulateCollectionView() throws {
        let viewController = FoodListViewController()
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: try GregorianMonth(number: 1))

        viewController.bind(viewModel: viewModel)

        XCTAssertEqual(viewController.numberOfItemsImSection(0), 1)
    }

    func testNotCallBindViewModelThenGenerateEmptyDataSource() {
        let viewController = FoodListViewController()

        XCTAssertEqual(viewController.numberOfItemsImSection(0), 0)
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

    func testFoodsQuantityWhenViewModelHasFoodsThenReturnTotalFoods() {
        let viewController = FoodListViewController()
        let month = try! GregorianMonth(number: 1) // swiftlint:disable:this force_try
        let foodViewModel = [FoodGroupViewModel.sample: [FoodViewModel.sample, .sample]]
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: month)
        viewController.bind(viewModel: viewModel)

        let totalFoods = try? viewController.foodsQuantity(at: 0)

        XCTAssertEqual(totalFoods, viewModel.foodsViewModel[FoodGroupViewModel.sample]!.count)
    }

    func testFoodsQuantityAtPositionWhenGivenAValidPositionFoodsThenReturnAFoodViewModel() {
        let viewController = FoodListViewController()
        let month = try! GregorianMonth(number: 1) // swiftlint:disable:this force_try
        let foodViewModel = [FoodGroupViewModel.sample: [FoodViewModel.sample, .sample]]
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: month)
        viewController.bind(viewModel: viewModel)

        let totalFoods = try? viewController.foodsQuantity(at: 0)

        XCTAssertEqual(totalFoods, viewModel.foodsViewModel[FoodGroupViewModel.sample]!.count)
    }

    func testFoodsQuantityAtPositionWhenGivenAnInvalidPositionFoodsThenThrowsAnError() {
        let viewController = FoodListViewController()
        let month = try! GregorianMonth(number: 1) // swiftlint:disable:this force_try
        let foodViewModel = [FoodGroupViewModel.sample: [FoodViewModel.sample, .sample]]
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: month)
        viewController.bind(viewModel: viewModel)

        XCTAssertThrowsError(try viewController.foodsQuantity(at: -1))
    }

    func testGroupAtSectionWhenGivenAnInvalidSectionThenThrowsAnError() {
        let viewController = FoodListViewController()
        let month = try! GregorianMonth(number: 1) // swiftlint:disable:this force_try
        let foodViewModel = [FoodGroupViewModel.sample: [FoodViewModel.sample, .sample]]
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: month)
        viewController.bind(viewModel: viewModel)

        XCTAssertThrowsError(try viewController.group(at: -1))
    }

    func testFoodWhenGivenAnInvalidRowThenThrowsAnError() {
        let viewController = FoodListViewController()
        let month = try! GregorianMonth(number: 1) // swiftlint:disable:this force_try
        let foodViewModel = [FoodGroupViewModel.sample: [FoodViewModel.sample, .sample]]
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: month)
        viewController.bind(viewModel: viewModel)

        XCTAssertThrowsError(try viewController.food(at: IndexPath(row: -1, section: 0)))
    }

    func testFoodWhenGivenAnInvalidSectionThenThrowsAnError() {
        let viewController = FoodListViewController()
        let month = try! GregorianMonth(number: 1) // swiftlint:disable:this force_try
        let foodViewModel = [FoodGroupViewModel.sample: [FoodViewModel.sample, .sample]]
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: month)
        viewController.bind(viewModel: viewModel)

        XCTAssertThrowsError(try viewController.food(at: IndexPath(row: 0, section: -1)))
    }

}

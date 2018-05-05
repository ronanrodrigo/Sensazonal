import XCTest
@testable import Sensazonal

final class FoodCollectionViewDataSourceTests: XCTestCase {

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    func testNumberOfSctionsThenReturnOne() {
        let dataSource = FoodCollectionViewDataSource(dataProvider: StubFoodListDataProvider())

        let totalSections = dataSource.numberOfSections(in: collectionView)

        XCTAssertEqual(totalSections, 1)
    }

    func testNumberOfItemsWhenDataProviderHasTenFoodsThenReturnTen() {
        let numberOfItems = 10
        let dataSource = FoodCollectionViewDataSource(dataProvider: StubFoodListDataProvider(total: numberOfItems))

        let totalItemsInSection = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)

        XCTAssertEqual(totalItemsInSection, numberOfItems)
    }

    func testCellForRowAtIndexPathWhenHasFoodsThenReturnFoodCell() {
        collectionView.register(FoodViewCell.self, forCellWithReuseIdentifier: FoodViewCell.identifier)
        let dataSource = FoodCollectionViewDataSource(dataProvider: StubFoodListDataProvider(total: 10))
        collectionView.dataSource = dataSource

        let cell = dataSource.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0))

        XCTAssertTrue(cell.isKind(of: FoodViewCell.self))
    }

}

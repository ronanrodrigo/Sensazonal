import XCTest
import FBSnapshotTestCase
@testable import Sensazonal

final class FoodViewCellTests: FBSnapshotTestCase {

    func testViewCreationWhenBindedWithViewModelThenPresentFoodsForSelectedMonth() {
        let view = FoodViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 120))
        let viewModel = FoodViewModel.sample

        view.bind(viewModel: viewModel)

        FBSnapshotVerifyView(view)
        FBSnapshotVerifyLayer(view.layer)
    }

}

import XCTest
import FBSnapshotTestCase
@testable import Sensazonal

final class FoodGroupViewTestsTests: FBSnapshotTestCase {

    func testViewCreationWhenBindedWithViewModelThenPresentFoodsForSelectedMonth() {
        let view = FoodGroupView(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
        let viewModel = FoodGroupViewModel.sample

        view.bind(group: viewModel)

        FBSnapshotVerifyView(view)
        FBSnapshotVerifyLayer(view.layer)
    }

}

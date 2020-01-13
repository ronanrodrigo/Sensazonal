// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

@testable import SensazonaliOS

// swiftlint:disable all
class ListFoodTableViewControllerBindMock: ListFoodTableViewControllerBind {
    var bindViewModelCallsCount = 0
    var bindViewModelCalled: Bool { return bindViewModelCallsCount > 0 }
    var bindViewModelReceivedViewModel: ListFoodViewModel!
    var bindViewModelReceivedInvocations: [ListFoodViewModel] = []
    var bindViewModelClosure: ((ListFoodViewModel) -> Void)?
    func bind(viewModel: ListFoodViewModel) {
        bindViewModelCallsCount += 1
        bindViewModelReceivedViewModel = viewModel
        bindViewModelReceivedInvocations.append(viewModel)
        bindViewModelClosure?(viewModel)
    }
    var bindErrorViewModelCallsCount = 0
    var bindErrorViewModelCalled: Bool { return bindErrorViewModelCallsCount > 0 }
    var bindErrorViewModelReceivedErrorViewModel: ListFoodErrorViewModel!
    var bindErrorViewModelReceivedInvocations: [ListFoodErrorViewModel] = []
    var bindErrorViewModelClosure: ((ListFoodErrorViewModel) -> Void)?
    func bind(errorViewModel: ListFoodErrorViewModel) {
        bindErrorViewModelCallsCount += 1
        bindErrorViewModelReceivedErrorViewModel = errorViewModel
        bindErrorViewModelReceivedInvocations.append(errorViewModel)
        bindErrorViewModelClosure?(errorViewModel)
    }
}

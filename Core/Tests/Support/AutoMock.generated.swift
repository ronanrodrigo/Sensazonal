// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

@testable import Core

// swiftlint:disable all
class ListFoodGatewayMock: ListFoodGateway {
    var allByMonthOnCompleteCallsCount = 0
    var allByMonthOnCompleteCalled: Bool { return allByMonthOnCompleteCallsCount > 0 }
    var allByMonthOnCompleteReceivedArguments: (month: Month, onComplete: (Result<[GroupedFoods], ListFoodError>) -> Void)!
    var allByMonthOnCompleteReceivedInvocations: [(month: Month, onComplete: (Result<[GroupedFoods], ListFoodError>) -> Void)] = []
    var allByMonthOnCompleteClosure: ((Month, @escaping (Result<[GroupedFoods], ListFoodError>) -> Void) -> Void)?
    func all(byMonth month: Month, onComplete: @escaping (Result<[GroupedFoods], ListFoodError>) -> Void) {
        allByMonthOnCompleteCallsCount += 1
        allByMonthOnCompleteReceivedArguments = (month: month, onComplete: onComplete)
        allByMonthOnCompleteReceivedInvocations.append((month: month, onComplete: onComplete))
        allByMonthOnCompleteClosure?(month, onComplete)
    }
}
class ListFoodPresenterMock: ListFoodPresenter {
    var presentGroupedFoodsMonthCallsCount = 0
    var presentGroupedFoodsMonthCalled: Bool { return presentGroupedFoodsMonthCallsCount > 0 }
    var presentGroupedFoodsMonthReceivedArguments: (groupedFoods: [GroupedFoods], month: Month)!
    var presentGroupedFoodsMonthReceivedInvocations: [(groupedFoods: [GroupedFoods], month: Month)] = []
    var presentGroupedFoodsMonthClosure: (([GroupedFoods], Month) -> Void)?
    func present(groupedFoods: [GroupedFoods], month: Month) {
        presentGroupedFoodsMonthCallsCount += 1
        presentGroupedFoodsMonthReceivedArguments = (groupedFoods: groupedFoods, month: month)
        presentGroupedFoodsMonthReceivedInvocations.append((groupedFoods: groupedFoods, month: month))
        presentGroupedFoodsMonthClosure?(groupedFoods, month)
    }
    var presentErrorCallsCount = 0
    var presentErrorCalled: Bool { return presentErrorCallsCount > 0 }
    var presentErrorReceivedError: ListFoodError!
    var presentErrorReceivedInvocations: [ListFoodError] = []
    var presentErrorClosure: ((ListFoodError) -> Void)?
    func present(error: ListFoodError) {
        presentErrorCallsCount += 1
        presentErrorReceivedError = error
        presentErrorReceivedInvocations.append(error)
        presentErrorClosure?(error)
    }
}
class MonthGatewayMock: MonthGateway {
    var currentCallsCount = 0
    var currentCalled: Bool { return currentCallsCount > 0 }
    var currentReturnValue: Month!
    var currentClosure: (() -> Month)?
    func current() -> Month {
        currentCallsCount += 1
        return currentClosure.map({ $0() }) ?? currentReturnValue
    }
    var monthNumberThrowableError: Error?
    var monthNumberCallsCount = 0
    var monthNumberCalled: Bool { return monthNumberCallsCount > 0 }
    var monthNumberReceivedNumber: Int!
    var monthNumberReceivedInvocations: [Int] = []
    var monthNumberReturnValue: Month!
    var monthNumberClosure: ((Int) throws -> Month)?
    func month(number: Int) throws -> Month {
        if let error = monthNumberThrowableError { throw error }
        monthNumberCallsCount += 1
        monthNumberReceivedNumber = number
        monthNumberReceivedInvocations.append(number)
        return try monthNumberClosure.map({ try $0(number) }) ?? monthNumberReturnValue
    }
    var allCallsCount = 0
    var allCalled: Bool { return allCallsCount > 0 }
    var allReturnValue: [Month]!
    var allClosure: (() -> [Month])?
    func all() -> [Month] {
        allCallsCount += 1
        return allClosure.map({ $0() }) ?? allReturnValue
    }
}

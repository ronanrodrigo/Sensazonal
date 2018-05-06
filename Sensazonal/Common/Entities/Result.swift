enum Result<T> {

    case success(T), failure(SensazonalError)

    func onSuccess(_ callback: (T) -> Void) {
        if case let .success(data) = self { callback(data) }
    }

    func onFailure(_ callback: (SensazonalError) -> Void) {
        if case let .failure(error) = self { callback(error) }
    }

}

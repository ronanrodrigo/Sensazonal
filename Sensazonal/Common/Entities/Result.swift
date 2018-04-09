enum Result<T> {
    case success(T)
    case failure(SensazonalError)

    func onSuccess(_ callback: (T) -> Void) {
        if case .success(let data) = self { callback(data) }
    }

    func onFailure(_ callback: (SensazonalError) -> Void) {
        if case .failure(let error) = self { callback(error) }
    }

}

enum Result<T> {
    case success(T)
    case failure(SensazonalError)

    func handle(_ onSuccess: (T) -> Void, _ onFailure: (SensazonalError) -> Void) {
        switch self {
        case let .success(item): onSuccess(item)
        case let .failure(error): onFailure(error)
        }
    }
}

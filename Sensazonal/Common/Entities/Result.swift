enum Result<T> {
    case success(T)
    case failure(SensazonalError)

    func onSuccess(_ callback: (T) -> Void) {
        switch self {
        case let .success(data): callback(data)
        default: return
        }
    }

    func onFailure(_ callback: (SensazonalError) -> Void) {
        switch self {
        case let .failure(error): callback(error)
        default: return
        }
    }

}

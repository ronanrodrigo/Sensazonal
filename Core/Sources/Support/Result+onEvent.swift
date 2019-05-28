extension Result {

    @discardableResult
    func onSuccess(_ callback: (Success) -> Void) -> Result {
        if case let .success(data) = self { callback(data) }
        return self
    }

    @discardableResult
    func onSuccess(_ callback: ((Success) -> Void)?) -> Result {
        guard let callback = callback else { return self }
        if case let .success(data) = self { callback(data) }
        return self
    }

    @discardableResult
    func onFailure(_ callback: (Failure) -> Void) -> Result {
        if case let .failure(error) = self { callback(error) }
        return self
    }

    @discardableResult
    func onFailure(_ callback: ((Failure) -> Void)?) -> Result {
        guard let callback = callback else { return self }
        if case let .failure(error) = self { callback(error) }
        return self
    }

}

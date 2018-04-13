func weak<T: AnyObject>(_ instance: T?, _ callback: @escaping (T) -> Void) -> () -> Void {
    return { [weak instance] in
        guard let strongContext = instance else { return }
        callback(strongContext)
    }
}

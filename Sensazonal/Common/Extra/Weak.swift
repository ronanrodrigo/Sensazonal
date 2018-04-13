func weak<T: AnyObject>(_ instance: T?, _ fn: @escaping (T) -> Void) -> () -> Void {
    return { [weak instance] in
        guard let strongContext = instance else { return }
        fn(strongContext)
    }
}

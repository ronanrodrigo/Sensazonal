class Logger {

    static var shared: Logger = Logger()

    func notImplemented(_ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        fatalError("\(function) at \(file):\(line)")
    }

}

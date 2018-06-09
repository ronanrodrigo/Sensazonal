import UIKit
import os

class Logger {

    static var shared: Logger = Logger()

    func notImplemented(_ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        fatalError("\(function) at \(file):\(line)")
    }

    func outOfBounds(_ file: String = #file, _ function: String = #function, _ line: Int = #line, at indexPath: IndexPath) {
        let message = "\(function) at \(file):\(line) at indexPath:\(indexPath)"
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "IndexOutOfBounds")
        os_log("%@", log: log, type: .error, message)
    }

    func outOfBounds(_ file: String = #file, _ function: String = #function, _ line: Int = #line, at position: Int) {
        let message = "\(function) at \(file):\(line) at indexPath:\(position)"
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "IndexOutOfBounds")
        os_log("%@", log: log, type: .error, message)
    }

}

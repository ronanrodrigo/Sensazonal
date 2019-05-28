import Foundation

let executables: [String: (() -> Void)] = [
    "MOCKS": { shell("./codegen", "mocks") },
    "SETUP": { shell("./setup") },
]

executables.keys.forEach { (key) in
    if ProcessInfo.processInfo.environment[key] != nil {
        executables[key, default: {}]()
    }
}

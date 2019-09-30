import Foundation

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.currentDirectoryPath = "/Users/ronan/Developer/Sensazonal/Support"
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

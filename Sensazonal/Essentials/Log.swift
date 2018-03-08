import UIKit
import os.log

struct Log {

    static func coreDataError(_ error: Error?) {
        guard let error = error as NSError? else { return }
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "CoreData")
        os_log("Persistent Container Error", log: log, type: .fault, error.userInfo, error.localizedDescription)
    }

}

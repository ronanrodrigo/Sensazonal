import Foundation
import CoreData

extension NSPersistentContainer {

    static let singleton: NSPersistentContainer = {
        let dataModelFileName = "Sensazonal"
        let container = NSPersistentContainer(name: dataModelFileName)
        container.loadPersistentStores { Log.coreDataError($1) }
        return container
    }()

}

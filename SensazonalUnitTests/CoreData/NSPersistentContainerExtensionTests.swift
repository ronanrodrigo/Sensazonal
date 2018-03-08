import XCTest
import CoreData
@testable import Sensazonal

class NSPersistentContainerExtensionTests: XCTestCase {

    func testInitializeContainerSingleton() {
        let containerSingleton = NSPersistentContainer.singleton

        XCTAssertEqual(containerSingleton.name, "Sensazonal")
    }

}

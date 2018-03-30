@testable import Sensazonal

class StubLogger: Logger {

    var fileLogged = ""
    var functionLogged = ""

    override func notImplemented(_ file: String, _ function: String, _ line: Int) {
        fileLogged = file
        functionLogged = function
    }

}

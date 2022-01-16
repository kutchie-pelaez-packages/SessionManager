import CoreUtils

public protocol SessionManager: Startable {
    var session: Int { get }
}

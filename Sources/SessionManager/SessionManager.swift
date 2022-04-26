import Core
import Tweak

public protocol SessionManager: TweakReceiver {
    var sessionValueSubject: ValueSubject<Int> { get }
}

extension SessionManager {
    public var session: Int { sessionValueSubject.value }
}

import Core
import Tweak

public protocol SessionManager: TweakReceiver {
    var sessionValueSubject: ValueSubject<Int> { get }
}

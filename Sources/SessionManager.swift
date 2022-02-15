import Tweak

public protocol SessionManager: TweakReceiver {
    var session: Int { get }
}

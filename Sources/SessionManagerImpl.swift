import Core
import Tweak

final class SessionManagerImpl: SessionManager {
    init() {
        incrementSession()
    }

    @UserDefault("session", default: 0)
    private var storedSession: Int

    private func incrementSession() {
        storedSession += 1
    }

    private func decrementSession() {
        storedSession = (storedSession - 1).clamped(0...)
    }

    // MARK: - TweakReceiver

    func receive(_ tweak: Tweak) {
        switch tweak.id {
        case .Session.incrementSessionNumber:
            incrementSession()

        case .Session.decrementSessionNumber:
            decrementSession()

        default:
            break
        }
    }

    // MARK: - SessionManager

    var session: Int {
        storedSession
    }
}

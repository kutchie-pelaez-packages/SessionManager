import Combine
import Core
import SessionManager
import Tweak

final class SessionManagerImpl: SessionManager {
    init() {
        subscribeToEvents()
        incrementSession()
    }

    @UserDefault("session", default: 0)
    private var storedSession: Int
    private lazy var _sessionValueSubject = MutableValueSubject(storedSession)

    private var cancellables = [AnyCancellable]()

    private func subscribeToEvents() {
        sessionValueSubject
            .sink { [weak self] session in
                self?.storedSession = session
            }
            .store(in: &cancellables)
    }

    private func incrementSession() {
        _sessionValueSubject.value += 1
    }

    private func decrementSession() {
        _sessionValueSubject.value = (_sessionValueSubject.value - 1).clamped(0...)
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

    var sessionValueSubject: ValueSubject<Int> { _sessionValueSubject }
}

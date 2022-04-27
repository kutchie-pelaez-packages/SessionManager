import Combine
import Core
import SessionManager
import SessionTweaking
import Tweaking

final class SessionManagerImpl: SessionManager, TweakReceiver {
    @UserDefault("session", default: 0)
    private var storedSession: Int

    private lazy var _sessionValueSubject = MutableValueSubject(storedSession)

    private var cancellables = [AnyCancellable]()

    init() {
        subscribeToEvents()
        incrementSession()
    }

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

    // MARK: - SessionManager

    var sessionValueSubject: ValueSubject<Int> { _sessionValueSubject }

    // MARK: - TweakReceiver

    func receive(_ tweak: Tweak) {
        switch tweak.id {
        case .Session.increment:
            incrementSession()

        case .Session.decrement:
            decrementSession()

        default:
            break
        }
    }
}

@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testTeaPot() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "teapot", afterResponse: { res in
            XCTAssertEqual(res.status, .imATeapot)
        })
    }
}

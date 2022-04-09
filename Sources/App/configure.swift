import Vapor
import Leaf

// configures your application
public func configure(_ app: Application) throws {
    // HTTP v1.1
    app.http.server.configuration.supportVersions = [.one]
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    // Leaf Templating engine
    app.views.use(.leaf)
    // register routes
    try routes(app)
}

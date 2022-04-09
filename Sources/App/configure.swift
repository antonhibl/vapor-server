import Vapor
import Leaf
import Fluent
import FluentPostgresDriver

final class Galaxy: Model, Content {
    // Name of the table or collection.
    static let schema = "galaxies"

    // Unique identifier for this Galaxy.
    @ID(key: .id)
    var id: UUID?

    // The Galaxy's name.
    @Field(key: "name")
    var name: String

    // Creates a new, empty Galaxy.
    init() { }

    // Creates a new Galaxy with all properties set.
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

struct CreateGalaxy: AsyncMigration {
    // Prepares the database for storing Galaxy models.
    func prepare(on database: Database) async throws {
        try await database.schema("galaxies")
            .id()
            .field("name", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) async throws {
        try await database.schema("galaxies").delete()
    }
}

// configures your application
public func configure(_ app: Application) throws {
    // HTTP v1.1
    app.http.server.configuration.supportVersions = [.one]
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    // load in postgreSQL database
    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "", database: "kibby"), as: .psql)
    app.migrations.add(CreateGalaxy())
    // Leaf Templating engine
    app.views.use(.leaf)
    // register routes
    try routes(app)
}

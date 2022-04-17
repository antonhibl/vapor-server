import Vapor
import Foundation
import Fluent
import FluentPostgresDriver
import CryptoKit

func routes(_ app: Application) throws {
    
    app.get { req async throws -> View in
        return try await req.view.render("home", ["title": "Vapor Home",
                                                  "body": ""])
    }
  
    app.get("hello") { req async throws -> View in
        return try await req.view.render("hello", ["name": "Leaf"])
    }
    
    app.get("life") { req async throws -> View in
        return try await req.view.render("life")
    }
    
    app.get("teapot") { req -> Response in
        return Response(status: .imATeapot, body: BrewTea())
    }
    
    app.get("galaxies") { req async throws in
        try await Galaxy.query(on: req.db).all()
    }
    
    app.post("galaxies") { req async throws -> Galaxy in
        let galaxy = try req.content.decode(Galaxy.self)
        try await galaxy.create(on: req.db)
        return galaxy
    }
    
    app.post("contact-me") { req -> Response in
        return Response()
    }
}

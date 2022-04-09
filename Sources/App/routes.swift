import Vapor
import Foundation

func routes(_ app: Application) throws {
    
    app.get { req async throws -> View in
        return try await req.view.render("home", ["title": "Vapor Home",
                                                  "body": ""])
    }
  
    app.get("hello") { req async throws -> View in
        return try await req.view.render("hello", ["name": "Leaf"])
    }
    
    app.get("teapot") { req -> Response in
        return Response(status: .imATeapot, body: BrewTea())
    }
    
    app.post("contact-me") { req -> Response in
        return Response()
    }
}

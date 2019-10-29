import Vapor
import FluentSQLite

final class PolygonController {
    func create(_ req: Request) throws -> Future<Polygon> {
        print("\n\n\(req)\n")
        return try req.content.decode(Polygon.self).flatMap { polygon in
            return polygon.save(on: req)
        }
    }
    
    func fetch(_ req: Request) throws -> Future<[Polygon]> {
        print("\n\n\(req)\n")
        return Polygon.query(on: req).all()
    }
}

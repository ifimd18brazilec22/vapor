import Vapor
import FluentSQLite

final class LiveLocationController {
    func create(_ req: Request) throws -> Future<CellorLocation> {
        try req.content.decode(LiveLocation.self).flatMap({ (newLocation) -> EventLoopFuture<String> in
            LiveLocation.query(on: req).delete()
            return newLocation.save(on: req).map { _ in
                return "added"
            }
        })
        return try req.content.decode(CellorLocation.self).flatMap { location in
            return location.save(on: req)
        }
    }
    
    func fetchOne(_ req: Request) throws -> Future<LiveLocation> {
        return LiveLocation.query(on: req).first().unwrap(or: Abort(HTTPResponseStatus(statusCode: 404)))
    }
}

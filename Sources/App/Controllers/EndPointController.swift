import Vapor
import FluentSQLite

final class EndPointController {
    func fetchOne(_ req: Request) throws -> Future<EndPoint> {
        return EndPoint.query(on: req).first().unwrap(or: Abort(HTTPResponseStatus(statusCode: 404)))
    }
    
    func create(_ req: Request) throws -> Future<EndPoint> {
        return try req.content.decode(EndPoint.self).flatMap { location in
            EndPoint.query(on: req).delete()
            return location.save(on: req)
        }
    }
    
    func clear(_ req: Request) throws -> Future<[EndPoint]> {
        EndPoint.query(on: req).delete()
        return EndPoint.query(on: req).all()
    }
}

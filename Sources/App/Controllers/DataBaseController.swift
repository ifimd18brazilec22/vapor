import Vapor
import FluentSQLite

final class DataBaseController<T: SQLiteModel>{
    func fetchOne(_ req: Request) throws -> Future<T> {
        return T.query(on: req).first().unwrap(or: Abort(HTTPResponseStatus(statusCode: 404)))
    }
    
    func create(_ req: Request) throws -> Future<T> {
        return try req.content.decode(T.self).flatMap { location in
            T.query(on: req).delete()
            return location.save(on: req)
        }
    }
    
    func clear(_ req: Request) throws -> Future<[T]> {
        T.query(on: req).delete()
        return T.query(on: req).all()
    }
    
    func fetchAll( _ req: Request) throws -> Future<[T]> {
        return T.query(on: req).all()
    }
}

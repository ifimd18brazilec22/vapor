import Vapor
import FluentSQLite

final class EndPoint: Codable {
    var id: Int?
    var latitude: Double
    var longitude: Double
    
    init(id: Int? = nil,
         latitude: Double,
         longitude: Double) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension EndPoint: SQLiteModel { }
extension EndPoint: Migration { }
extension EndPoint: Content { }
extension EndPoint: Parameter { }

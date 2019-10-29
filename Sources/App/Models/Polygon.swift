import Vapor
import FluentSQLite

final class Polygon: Codable {
    var id: Int?
    var locations: [Location]
    
    init(id: Int? = nil,
         locations: [Location]) {
        self.id = id
        self.locations = locations
    }
}

struct Location: Codable {
    var longitude: Double
    var latitude: Double
}

extension Polygon: SQLiteModel { }
extension Polygon: Migration { }
extension Polygon: Content { }
extension Polygon: Parameter { }

import Vapor
import FluentSQLite

final class LiveLocation: Codable {
    var id: Int?
    var latitude: Double
    var longitude: Double
    var cellor: String
    
    init(id: Int? = nil,
         latitude: Double,
         longitude: Double,
         cellor: String) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.cellor = cellor
    }
}

extension LiveLocation: SQLiteModel { }
extension LiveLocation: Migration { }
extension LiveLocation: Content { }
extension LiveLocation: Parameter { }

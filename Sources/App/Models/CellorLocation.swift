import Vapor
import FluentSQLite

final class CellorLocation: Codable {
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

extension CellorLocation: SQLiteModel { }
extension CellorLocation: Migration { }
extension CellorLocation: Content { }
extension CellorLocation: Parameter { }

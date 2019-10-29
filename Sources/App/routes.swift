import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    let liveLocationController = LiveLocationController()
    router.get("api/location/live", use: liveLocationController.fetchOne)
    router.post("api/location/live", use: liveLocationController.create)

    let endPointController = EndPointController()
    router.get("api/location/endPoint", use: endPointController.fetchOne)
    router.post("api/location/endPoint", use: endPointController.create)
    router.delete("api/location/endPoint", use: endPointController.clear)
    
    let polygonController = PolygonController()
    router.get("api/location/polygon", use: polygonController.fetch)
    router.post("api/location/polygon", use: polygonController.create)
//    router.delete("api/location/polygon", use: polygonController.clear)
}

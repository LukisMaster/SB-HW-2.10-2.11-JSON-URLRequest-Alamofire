//
//  Model.swift
//  SB-HW-2.10-Networking-API-JSON
//
//  Created by Sergey Nestroyniy on 05.10.2022.
//

struct ToolCartonData : Decodable {
    static let url = "https://testimonialapi.toolcarton.com/api"
    
    var id : Int
    var name : String
    var location : String
    var designation : String
    var avatar : String?
    var message : String
    var rating : Double
    var audio : String
    
    init(dictionaryData: [String: Any]){
        id = dictionaryData["id"] as! Int
        name = dictionaryData["name"] as! String
        location = dictionaryData["location"] as! String
        designation = dictionaryData["designation"] as! String
        avatar = dictionaryData["avatar"] as? String
        message = dictionaryData["message"] as! String
        rating = dictionaryData["rating"] as! Double
        audio = dictionaryData["audio"] as! String
    }
    
    static func getToolCartons(from value: Any) -> [ToolCartonData] {
        print(value)
        guard let toolCartonsData = value as? [[String: Any]] else { return [] }
        return toolCartonsData.compactMap { ToolCartonData(dictionaryData: $0) }
    }
    
    func getInfo () -> [String] {
        var info : [String] = []
        info.append("id: " + String(id))
        info.append("location: " + location)
        info.append("designation: " + designation)
        info.append("message: " + message)
        info.append("rating: " + String(format: "%.01f", rating))
        return info
    }
}



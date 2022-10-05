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
    var rating : Float
    var audio : String
    
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



//
//  Venue.swift
//  YelpFusion
//
//
//  
//

import Foundation

struct Venue: Decodable, Identifiable {
        
    var name                    : String?
    var id                      : String?
    var rating                  : Float?
    var price                   : String?
    var is_closed               : Bool?
    var distance                : Double?
    var address                 : String?
    var latitude                : Float?
    var longitude               : Float?
}



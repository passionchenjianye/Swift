//
//  Photo.swift
//  testCell
//
//  Created by Tony on 12/30/14.
//  Copyright (c) 2014 Tony. All rights reserved.
//

import Foundation

// NSObject per avere KVC
// NOTA: KVC non funziona su property optionals
class Photo : NSObject {
    
    var titolo : String
    var autore : String
    var lat : Double
    var long : Double
    var descr : String
    var data : String
    
    override init () {
        
        titolo = ""
        autore = ""
        descr = ""
        data = ""
        lat = 0
        long = 0
        
        super.init()
    }
    
    func description() -> String {
        
        return "\(titolo) (\(autore)): \(descr)\r\n\r\n"
    }
    
}

//
//  Mobileia.swift
//  MobileiaCore
//
//  Created by Matias Camiletti on 8/9/17.
//  Copyright © 2017 Matias Camiletti. All rights reserved.
//

import Foundation

public class Mobileia {
    static var instance : Mobileia = Mobileia()
    
    var appId : Int = 0;
    var deviceToken : String = "";
    
    static func getInstance() -> Mobileia {
        return instance;
    }
}

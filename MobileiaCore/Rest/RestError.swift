//
//  Error.swift
//  MobileiaCore
//
//  Created by Matias Camiletti on 8/9/17.
//  Copyright © 2017 Matias Camiletti. All rights reserved.
//

import Foundation

public class RestError{
    public var code : Int = 0;
    public var message : String = "";
    
    init(){}
    
    init(code: Int, message: String) {
        self.code = code;
        self.message = message;
    }
}

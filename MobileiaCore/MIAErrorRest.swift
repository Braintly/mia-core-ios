//
//  MIAErrorRest.swift
//  Show Prode
//
//  Created by Matias Camiletti on 11/3/18.
//  Copyright © 2018 Matias Camiletti. All rights reserved.
//

import Foundation

open class MIAErrorRest{
    @objc open dynamic var code : Int = 0;
    @objc open dynamic var message : String = "";
    
    public init(){}
    
    public init(code: Int, message: String) {
        self.code = code;
        self.message = message;
    }
}

//
//  MIAErrorRest.swift
//  Show Prode
//
//  Created by Matias Camiletti on 11/3/18.
//  Copyright © 2018 Matias Camiletti. All rights reserved.
//

import Foundation

public class MIAErrorRest{
    @objc dynamic var code : Int = 0;
    @objc dynamic var message : String = "";
    
    init(){}
    
    init(code: Int, message: String) {
        self.code = code;
        self.message = message;
    }
}

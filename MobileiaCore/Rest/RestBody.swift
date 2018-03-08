//
//  RestBody.swift
//  MobileiaCore
//
//  Created by Matias Camiletti on 8/9/17.
//  Copyright © 2017 Matias Camiletti. All rights reserved.
//

import Foundation

public class RestBody<T> {
    public var success : Bool = false;
    public var response : T?;
    public var error : RestError = RestError();
}

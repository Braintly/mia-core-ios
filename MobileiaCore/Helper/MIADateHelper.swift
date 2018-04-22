//
//  MIADateHelper.swift
//  Show Prode
//
//  Created by Matias Camiletti on 30/3/18.
//  Copyright © 2018 Matias Camiletti. All rights reserved.
//

import UIKit

open class MIADateHelper: NSObject {
    
    open func stringToDate(_ string : String, format : String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = format //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") //Current time zone
        return dateFormatter.date(from: string) //according to date format your date string
    }
    
    open func dateToString(_ date : Date, format : String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date);
    }
    
    open func stringToString(_ string : String , format : String = "yyyy-MM-dd HH:mm:ss", exformat : String = "DD 'de' MMMM") -> String {
        let date = stringToDate(string, format: format);
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = exformat;
        return dateFormatter.string(from: date!);
    }
    
    open func isToday(_ date : Date) -> Bool {
        return NSCalendar.current.isDateInToday(date);
    }
    
    open func isToday(_ string : String) -> Bool {
        let date = stringToDate(string);
        if(date == nil){
            return false;
        }
        return NSCalendar.current.isDateInToday(date!);
    }
}

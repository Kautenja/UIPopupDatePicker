//
//  Date+Extensions.swift
//  UIPopupDatePicker
//
//  Created by James Kauten on 8/1/17.
//  Copyright © 2017 CK Software. All rights reserved.
//

import Foundation

// some manipulators for basic time
extension Date {
    
    /// Return a version of self at the given time
    /// - parameters:
    ///   - hour: the hour to use
    ///   - minute: the minute to use
    func at(hour: Int, minute: Int) -> Date {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var components = calendar.dateComponents([.calendar,
                                                  .timeZone,
                                                  .year,
                                                  .month,
                                                  .day],
                                                 from: self)
        components.hour = hour
        components.minute = minute
        let date = calendar.date(from: components)!
        return date
    }
    
    /// Return self with the time rounded about the 5 minute mark
    var roundedAbout5Min: Date {
        // round the start date about the 5 minute mark
        let components = Calendar.current.dateComponents([.hour, .minute], from: self)
        guard let hour = components.hour, let _minute = components.minute else {
            NSLog("failed to unwrap hour, minute from default Date")
            return self
        }
        var minute = _minute
        if minute % 5 > 0 {
            minute = minute - minute % 5
        }
        return self.at(hour: hour, minute: minute)
    }
    
    /// Return the date today rounded about the 5 minute mark
    static var today5min: Date {
        return Date().roundedAbout5Min
    }
    
}

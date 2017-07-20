//
//  BDatePicker.swift
//  Bindr
//
//  Created by James Kauten on 12/17/16.
//  Copyright © 2016 Kauten Creations. All rights reserved.
//

import UIKit
import PopupDialog
import FSCalendar

/// Combine the day, month, year from date with the hours, minutes, seconds, of
/// time
/// - parameters:
///   - date: the date to get the day month year from
///   - time: the date to get the hours minutes seconds from
func combine(date: Date, time: Date) -> Date {
    let cal = Calendar.current
    var dateComponents = cal.dateComponents([.day, .month, .year], from: date)
    let timeComponents = cal.dateComponents([.hour, .minute], from: time)
    
    dateComponents.hour = timeComponents.hour
    dateComponents.minute = timeComponents.minute
    dateComponents.second = 0
    
    return cal.date(from: dateComponents)!
}

/// A class to select a date a time with prettier UI
public class UIPopupDatePicker: UIViewController {
    
    /// the popup that this picker is contained in
    var popup: PopupDialog!
    
    /// the day selection agent
    @IBOutlet var calendar: FSCalendar!
    
    /// the time selection agent
    @IBOutlet var timePicker: UIDatePicker! {
        didSet {
            // try to make the two ugly lines invisible on the picker view
            if timePicker.subviews.count >= 1 {
                if timePicker.subviews[0].subviews.count >= 2 {
                    timePicker.subviews[0].subviews[1].isHidden = true
                    timePicker.subviews[0].subviews[2].isHidden = true
                }
            }
        }
    }

    /// the current date
    public var date: Date {
        set {
            calendar.select(newValue)
            timePicker.setDate(newValue, animated: true)
        }
        get {
            return combine(date: calendar.selectedDate!, time: timePicker.date)
        }
    }
    
    /// Handles 'saving'
    var handler: ((Date?)->Void)?
    
    /// Setup the view after it's loaded into memory
    override public func viewDidLoad() {
        super.viewDidLoad()
        let hvnl = "HelveticaNeue-Light"
        calendar.appearance.headerTitleFont = UIFont(name: hvnl, size: 12.0)!
        calendar.appearance.weekdayFont = UIFont(name: hvnl, size: 18.0)!
        todayPressed()
    }
    
    /// Dismiss the view controller with no changes made
    @IBAction func cancelPressed() {
        popup.dismiss(animated: true, completion: nil)
    }
    
    /// Handle a press to the clear button
    @IBAction func clearPressed() {
        if let completion = handler {
            completion(nil)
        }
        popup.dismiss(animated: true, completion: nil)
    }
    
    /// Handle a press to the 'today' button
    @IBAction func todayPressed() {
        date = Date()
    }
    
    /// Handle a press to the done button
    @IBAction func donePressed() {
        popup.dismiss(animated: true, completion: nil)
        handler?(date)
    }
    
    /// Display a new date picker on top of an existing view controller
    /// - parameters:
    ///   - viewController: the view controller to present on top of
    ///   - date: the date to display
    ///   - block: the function to handle completion
    public class func show(on viewController: UIViewController,
                           with date: Date?=nil,
                           block handler: ((Date?)->Void)?=nil) -> UIPopupDatePicker {
        // load the view from the storyboard
        let name = String(describing: classForCoder())
        let bundle = Bundle(for: UIPopupDatePicker.self)
        let storyboard: UIStoryboard = UIStoryboard(name: name, bundle: bundle)
        let vc = storyboard.instantiateInitialViewController()
        let picker = vc as! UIPopupDatePicker
        // create the popup
        let popup = PopupDialog.init(viewController: picker, gestureDismissal: false)
        picker.popup = popup
        picker.handler = handler
        if let _date = date {
            picker.date = _date
        }
        // present the view controller
        viewController.present(popup, animated: true, completion: nil)
        // return the picker for further config
        return picker
    }
    
}

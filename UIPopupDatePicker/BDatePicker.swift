//
//  BDatePicker.swift
//  Bindr
//
//  Created by James Kauten on 12/17/16.
//  Copyright © 2016 Kauten Creations. All rights reserved.
//

import UIKit
import FSCalendar
import PopupDialog

// A class to select a date a time with prettier UI
public class BDatePicker: UIViewController
{
    // the popup that this picker is contained in
    var popup: PopupDialog!
    
    // the day selection agent
    @IBOutlet var calendar: FSCalendar!
    
    // the time selection agent
    @IBOutlet var timePicker: UIDatePicker!

    // Handles 'saving'
    var handler: ((Date?)->Void)?
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        calendar.appearance.headerTitleFont = UIFont(name: "HelveticaNeue-Light", size: 12.0)!
        calendar.appearance.weekdayFont = UIFont(name: "HelveticaNeue-Light", size: 18.0)!
        todayPressed()
    }
    
    /**
     Dismisses the view controller with no changes made
     */
    @IBAction func cancelPressed()
    {
        popup.dismiss(animated: true, completion: nil)
    }
    
    /**
     Simulates a clear by performing the handler with a nil date
     */
    @IBAction func clearPressed()
    {
        if let completion = handler
        {
            completion(nil)
        }
        
        popup.dismiss(animated: true, completion: nil)
    }
    
    /**
     Called when a user presses the today button. Sets the time and date to
     today.
     */
    @IBAction func todayPressed()
    {
        let today = Date()
        set(date: today)
    }
    
    /**
     Gathers the selected date and performs the handler with it
     */
    @IBAction func donePressed()
    {
        if let completion = handler
        {
            let date = selectedDate()
            popup.dismiss(animated: true, completion: nil)
            completion(date)
        }
        else
        {
            popup.dismiss(animated: true, completion: nil)
        }
    }
    
    /**
     Sets the date
     - to: the date to set to
     */
    func set(date to: Date)
    {
        calendar.select(to)
        timePicker.setDate(to, animated: true)
    }
    
    /**
     Compiles the components into a date object
     - returns:
       - a formatted date from the components
     */
    func selectedDate() -> Date
    {
        let cal = Calendar.current
        
        let day = calendar.selectedDate
        var dayComponents = cal.dateComponents([.day, .month, .year], from: day)
        
        let time = timePicker.date
        let timeComponents = cal.dateComponents([.hour, .minute], from: time)
        
        dayComponents.hour = timeComponents.hour
        dayComponents.minute = timeComponents.minute
        dayComponents.second = 0
        
        let finalDate = cal.date(from: dayComponents)!
        
        return finalDate
    }
    
    /**
     Static function to instantiate the ViewController on top of an existing
     - parameters:
       - viewController: the view controller to present on top of
       - date: the date to display
       - handler: the function to handle completion
     */
    open class func show(on viewController: UIViewController,
                         with date: Date? = nil,
                         handledBy handler: ((Date?)->Void)? = nil) -> BDatePicker
    {
        let frameworkBundle = Bundle(for: BDatePicker.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("BDatePicker.bundle")
        
        let resourceBundle = Bundle(url: bundleURL!)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "BDatePicker", bundle: resourceBundle)
        let bDatePicker = storyboard.instantiateViewController(withIdentifier: "BDatePicker") as! BDatePicker
        
        let popup = PopupDialog.init(viewController: bDatePicker, gestureDismissal: false)
        bDatePicker.popup = popup
        
        viewController.present(popup, animated: true, completion: nil)
        
        bDatePicker.handler = handler
        if date != nil
        {
            bDatePicker.set(date: date!)
        }
        
        return bDatePicker
    }
    
}

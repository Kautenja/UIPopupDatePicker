//
//  ViewController.swift
//  PopupDatePicker
//
//  Created by James Kauten on 7/18/17.
//  Copyright © 2017 CK Software. All rights reserved.
//

// import the framework first!
import UIPopupDatePicker

/// Main view controller for the example app
class ViewController: UIViewController {
    
    /// label for displaying the currently selected date
    @IBOutlet var dateLabel: UILabel!
    
    /// the selected date
    var date: Date? {
        didSet {
            guard let _date = date else {
                dateLabel.text = "nil"
                return
            }
            let format = DateFormatter()
            format.dateStyle = .medium
            format.timeStyle = .short
            self.dateLabel.text = format.string(from: _date)
        }
    }

    /// Called when a user presses the button on this view to select a date
    /// with a time
    @IBAction func selectWithTimePressed() {
        // display a date popup in default configuration
        let popup = UIPopupDatePicker.show(on: self, with: date) { (selected) in
            self.date = selected
        }
        popup.headerText = "Picker with time"
    }
    
    /// Called when a user presses the button on this view to select a date
    /// without a time
    @IBAction func selectWithoutTimePressed() {
        // display a date popup without the time picker
        let popup = UIPopupDatePicker.show(on: self, with: date) { (selected) in
            self.date = selected
        }
        popup.isPickerEnabled = false
        popup.headerText = "Picker without time"
    }
    
}


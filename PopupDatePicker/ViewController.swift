//
//  ViewController.swift
//  PopupDatePicker
//
//  Created by James Kauten on 7/18/17.
//  Copyright © 2017 CK Software. All rights reserved.
//

import UIPopupDatePicker

/// Main view controller for the example app
class ViewController: UIViewController {
    
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
    
    /// label for displaying the currently selected date
    @IBOutlet var dateLabel: UILabel!

    /// Called when a user presses the button on this view to select a date
    /// with a time
    @IBAction func selectWithTimePressed() {
        let _ = UIPopupDatePicker.show(on: self, with: date) { (selected) in
            self.date = selected
        }
    }
    
    /// Called when a user presses the button on this view to select a date
    /// without a time
    @IBAction func selectWithoutTimePressed() {
        let picker = UIPopupDatePicker.show(on: self, with: date) { (selected) in
            self.date = selected
        }
        picker.isPickerEnabled = false
    }
    
}


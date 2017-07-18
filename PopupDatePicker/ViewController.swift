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
    
    /// label for displaying the currently selected date
    @IBOutlet var dateLabel: UILabel!
    
    /// Handles a change in the date picker, for this view
    /// - parameters:
    /// - newDate: the newly selected date (nil if clear is pressed)
    func HandleDateDidChange(to newDate: Date?) {
        guard let date = newDate else {
            dateLabel.text = "nil"
            return
        }
        dateLabel.text = date.description
    }
    
    /// Called when a user presses the button on this view to select a date
    @IBAction func selectPressed() {
        let _ = UIPopupDatePicker.show(on:self, block: HandleDateDidChange)
    }
    
}


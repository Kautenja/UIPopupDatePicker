# UIPopupDatePicker

[![swift-badge][]][swift-link]
[![carthage-badge][]][carthage-link]

[swift-badge]: https://img.shields.io/badge/swift-4.0-orange.svg
[swift-link]: https://swift.org/
[carthage-badge]: https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat
[carthage-link]: https://github.com/Carthage/Carthage


## Screenshots

### With Time Picker

<img src="https://user-images.githubusercontent.com/2184469/28429001-cf56a958-6d40-11e7-86f7-aeb86693bb4d.PNG" width = 300>

### Without Time Picker

<img src="https://user-images.githubusercontent.com/2184469/28429000-ce02e79c-6d40-11e7-9775-c37001308080.PNG" width = 300>

## Requirements

This framework relies on (and installs):

*   [PopupDialog](https://github.com/Orderella/PopupDialog)
*   [FSCalendar](https://github.com/WenchaoD/FSCalendar)

## Installation

### Carthage

Add the following to your Cartfile

```ruby
github "kautenja/UIPopupDatePicker" ~> 1.1
```

## Example

To run the example project, clone the repo, and build it on devices of you choosing.


### Code Usage

#### Creation

The main entry point for UIPopupDatePicker is the static `show` method.

```swift
_ = UIPopupDatePicker.show(on: self, with: nil, block: nil)
```

#### Customization

This function returns an instance of UIPopupDatePicker in case you might want to
manipulate some of the controller manually:

```swift
let popup = UIPopupDatePicker.show(on: self, with: nil, block: nil)
popup.headerText = "Some text you might want as a title!"
```

#### Callback

To respond to a change in the date use the callback handler:

```swift
_ = UIPopupDatePicker.show(on: self, with: Date()) { (selected) in
    NSLog("UIPopupDatePicker returned \(selected) in the callback")
}
```

the parameter passed to the anonymous function an optional date (`Date?`). If the user:

1. presses done

the callback will be executed with the date from the calendar and time from the picker. If
the time picker is hidden, the time will be the time that the popup was first created.

2. presses clear

the callback will be executed passing `nil` as the parameter to the anonymous function.
Use this to remove a date from something.

3. presses cancel

the callback **IS NOT** executed and the popup dismisses with no changes to the parent
view controller.

### Code Samples

see [ViewController](PopupDatePicker/ViewController.swift) for a production example of how this might come together


## Author

Kautenja, kautencreations@gmail.com


## License

**TL;DR** do what you want with it.

UIPopupDatePicker is available under the MIT license. See the [LICENSE](./LICSENSE) file
for more info.

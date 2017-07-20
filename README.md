# UIPopupDatePicker

[![swift-badge][]][swift-link]

[swift-badge]: https://img.shields.io/badge/swift-4.0-orange.svg
[swift-link]: https://swift.org/


## Screenshots



## Requirements

This framework relies on (and installs):

*   [PopupDialog](https://github.com/Orderella/PopupDialog)
*   [FSCalendar](https://github.com/WenchaoD/FSCalendar)

## Installation

### Carthage

Add the following to your Cartfile

```
github "kautenja/UIPopupDatePicker" "master"
```

## Example

To run the example project, clone the repo, and build it on devices of you choosing.


### Code Usage

The main entry point for UIPopupDatePicker is the static `show` method.

```swift
let _ = UIPopupDatePicker.show(on: self, with: nil block: nil)
```

This function returns an instance of UIPopupDatePicker in case you might want to
manipulate some of the controller manually.

To respond to a change in the date use the callback handler

```swift
let _ = UIPopupDatePicker.show(on: self, with: nil block: nil)
```

see [ViewController](PopupDatePicker/ViewController.swift) for a production example of how this might come together


## Author

Kautenja, kautencreations@gmail.com


## License

UIPopupDatePicker is available under the MIT license. See the [LICENSE](./LICSENSE) file for more info.

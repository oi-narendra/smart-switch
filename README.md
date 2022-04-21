<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
## Features

A smart switch for you.

## Usage

```dart
SmartSwitch(
          size: SwitchSize.medium,
          disabled: false,
          activeColor: Colors.green,
          inActiveColor: Colors.red,
          defaultActive: true,
          onChanged: (value) {
            debugPrint('value: $value');
          },
        ),
```

## Parameters

    * size: SwitchSize
        * small
        * medium
        * large
        * default: medium
    * disabled: bool
        * default: false
    * activeColor: Color
        * default: Theme.of(context).primaryColor
    * inActiveColor: Color
        * default: Colors.grey.shade400
    * defaultActive: bool
        * default: true
    * onChanged: (bool value)
        * default: null

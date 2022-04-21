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

    | Parameter | Type | Default | Description |
    | --------- | ---- | ------- | ----------- |
    | size | SwitchSize | SwitchSize.medium | The size of the switch. |
    | disabled | bool | false | Whether the switch is disabled. |
    | activeColor | Color | Colors.green | The color of the active switch. |
    | inActiveColor | Color | Colors.red | The color of the inactive switch. |
    | defaultActive | bool | true | Whether the switch is active by default. |
    | onChanged | Function(bool) | null | The callback for when the switch changes. |


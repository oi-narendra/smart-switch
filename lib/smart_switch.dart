library smart_switch;

import 'package:flutter/material.dart';

class SmartSwitch extends StatefulWidget {
  final SwitchSize size;
  final Color? activeColor;
  final Color? inActiveColor;
  final bool disabled;
  final bool defaultActive;
  final Function(bool)? onChanged;
  const SmartSwitch({
    Key? key,
    this.size = SwitchSize.medium,
    this.inActiveColor,
    this.activeColor,
    this.disabled = false,
    this.defaultActive = true,
    this.onChanged,
  }) : super(key: key);

  @override
  State<SmartSwitch> createState() => _SmartSwitchState();
}

class _SmartSwitchState extends State<SmartSwitch> {
  bool _active = true;
  double _y = -0.4;
  double _opacity = 0.0;

  @override
  void initState() {
    _active = widget.defaultActive;
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _y = 0;
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width *
        0.24 *
        (widget.size == SwitchSize.small
            ? 0.9
            : widget.size == SwitchSize.medium
                ? 1
                : 1.1);
    final height = 40.0 *
        (widget.size == SwitchSize.small
            ? 0.9
            : widget.size == SwitchSize.medium
                ? 1
                : 1.1);

    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 1000),
      child: AnimatedSlide(
        offset: Offset(0, _y),
        duration: const Duration(milliseconds: 1000),
        child: GestureDetector(
          onTap: () {
            if (widget.disabled) {
              return;
            }
            setState(() {
              _active = !_active;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(_active);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: widget.disabled
                    ? Colors.grey
                    : _active
                        ? widget.activeColor ?? Theme.of(context).primaryColor
                        : widget.inActiveColor ?? Colors.grey.shade400,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: const Offset(0, 5),
                  ),
                ]),
            width: width,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Expanded(
                          child: Text(
                        'OFF',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white),
                      )),
                      Expanded(
                          child: Text(
                        'ON',
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                ),
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment:
                      _active ? Alignment.centerLeft : Alignment.centerRight,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: double.infinity,
                    width: width / 1.7,
                    child: Card(
                        clipBehavior: Clip.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum SwitchSize { small, medium, large }

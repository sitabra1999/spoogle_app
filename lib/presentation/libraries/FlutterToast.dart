import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Toast {
  static const int lengthShort = 1;
  static const int lengthLong = 2;
  static const int bottom = 0;
  static const int center = 1;
  static const int top = 2;

  static void show(String msg, BuildContext context,
      {int duration = 1,
        int gravity = 0,
        Color backgroundColor = const Color(0xAA000000),
        textStyle = const TextStyle(fontSize: 15, color: Colors.white),
        double backgroundRadius = 20,
        bool? rootNavigator,
        Border? border,
      }) {
    ToastView.dismiss();
    ToastView.createView(msg, context, duration, gravity, backgroundColor,
        textStyle, backgroundRadius, border);
  }
}

class ToastView {
  static final ToastView _singleton = ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState? overlayState;
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void createView(
      String msg,
      BuildContext context,
      int duration,
      int gravity,
      Color background,
      TextStyle textStyle,
      double backgroundRadius,
      Border? border,) async
  {
    overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
          widget: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(backgroundRadius),
                    border: border,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                  child: Text(msg, softWrap: true, style: textStyle),
                ),
            ),
          ),
          gravity: gravity,
      ),
    );
    _isVisible = true;
    overlayState?.insert(_overlayEntry!);
    await Future.delayed(
        Duration(seconds: duration == null ? Toast.lengthShort : duration));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class ToastWidget extends StatelessWidget {
  const ToastWidget({
    Key? key,
    required this.widget,
    required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final int gravity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: gravity == 2 ? MediaQuery.of(context).viewInsets.top + 50 : null,
        bottom: gravity == 0 ? MediaQuery.of(context).viewInsets.bottom + 50 : null,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ));
  }
}
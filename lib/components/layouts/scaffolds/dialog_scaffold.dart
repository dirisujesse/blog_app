import 'package:blog/style/colors.dart';
import 'package:blog/utils/extensions.dart';
import 'package:flutter/material.dart';

class AppDialogScaffold extends StatelessWidget {
  final Widget child;
  final bool showClose;
  final Future future;

  AppDialogScaffold({
    @required this.child,
    @required this.showClose,
    this.future,
  });

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Container(
          margin: scaler.insets.only(
            top: .5,
            left: 7,
            right: 7,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              scaler.fontSizer.sp(50),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (showClose)
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        if (future != null) {
                          future.timeout(
                            Duration(milliseconds: 1),
                          );
                        }
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.purple,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(scaler.fontSizer.sp(50)),
                            bottomLeft:
                                Radius.circular(scaler.fontSizer.sp(50)),
                          ),
                        ),
                        padding: scaler.insets.all(3),
                        child: Icon(
                          Icons.close,
                          color: AppColors.white,
                          size: scaler.fontSizer.sp(50),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: scaler.insets.only(
                    top: showClose ? 0 : 3,
                    bottom: 3,
                    left: 4,
                    right: 4,
                  ),
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

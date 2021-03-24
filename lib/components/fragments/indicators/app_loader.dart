import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apploader extends StatelessWidget {
  const Apploader();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS ? CupertinoActivityIndicator(radius: 15,) : CircularProgressIndicator(),
    );
  }
}
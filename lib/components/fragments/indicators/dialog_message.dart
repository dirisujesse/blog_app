import 'package:blog/components/fragments/indicators/app_loader.dart';
import 'package:blog/style/colors.dart';
import 'package:flutter/material.dart';

enum MessageType {
  Error,
  Warning,
  Success,
  Info,
  Pending,
}

class DialogMessage extends StatelessWidget {
  final dynamic message;
  final MessageType messageType;
  final TextAlign textAlign;

  DialogMessage({
    @required this.message,
    this.messageType = MessageType.Info,
    this.textAlign = TextAlign.center,
  });

  String _parsedMessage() {
    if (message is String) {
      return message;
    } else if (message is Map || message is List) {
      final List<String> messageArr = message is Map
          ? message.values.map((it) => "$it").toList()
          : message.map((it) => "$it").toList();
      return messageArr.join("; ");
    } else {
      return "";
    }
  }

  Widget _messageIcon() {
    switch (messageType) {
      case MessageType.Error:
        return Icon(
          Icons.error_outline,
          size: 30,
          color: AppColors.red,
        );
        break;
      case MessageType.Success:
        return Icon(
          Icons.sentiment_satisfied,
          size: 30,
          color: AppColors.green,
        );
        break;
      case MessageType.Warning:
        return Icon(
          Icons.warning,
          size: 30,
          color: AppColors.red.withGreen(100),
        );
        break;
      case MessageType.Pending:
        return const Apploader();
        break;
      default:
        return Icon(
          Icons.notifications,
          size: 30,
          color: AppColors.black,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _messageIcon(),
        SizedBox(height: 5),
        Flexible(
          child: Text(
            _parsedMessage(),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

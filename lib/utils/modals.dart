import 'dart:async';
import 'package:blog/components/fragments/indicators/dialog_message.dart';
import 'package:blog/components/layouts/scaffolds/dialog_scaffold.dart';
import 'package:blog/utils/helpers.dart';
import 'package:flutter/material.dart';

enum FutureState {
  Loading,
  Complete,
  Fail,
}

Future<T> formSubmitDialog<T>({
  @required BuildContext context,
  @required Future<T> future,
  String errorMessage =
      "An unexpected error occurred and the request failed, please try again",
  String prompt = "Working on it",
  String successMessage,
  bool forceErrorMessage = false,
}) async {
  ValueNotifier<FutureState> isResolved = ValueNotifier(FutureState.Loading);
  final T result = await showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        child: ValueListenableBuilder(
          valueListenable: isResolved,
          builder: (context, FutureState val, _) {
            return AppDialogScaffold(
              future: future,
              child: FutureBuilder(
                future: future,
                builder: (context, AsyncSnapshot<T> res) {
                  if (res.hasData) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) {
                        Timer(
                          Duration(
                              milliseconds:
                                  successMessage == null ? 500 : 3000),
                          () {
                            Navigator.of(context).pop(res?.data ?? "success");
                          },
                        );
                      },
                    );
                    if (successMessage == null) {
                      return DialogMessage(
                        message: "",
                        messageType: MessageType.Pending,
                      );
                    }
                    return DialogMessage(
                      message: successMessage ?? "Success",
                      messageType: MessageType.Success,
                    );
                  }
                  if (res.hasError) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) {
                        isResolved.value = FutureState.Complete;
                      },
                    );

                    return DialogMessage(
                      message: parseError(res.error, errorMessage),
                      messageType: MessageType.Error,
                    );
                  }
                  return DialogMessage(
                    message: prompt,
                    messageType: MessageType.Pending,
                  );
                },
              ),
              showClose: true,
            );
          },
        ),
        onWillPop: () async => isResolved.value == FutureState.Complete,
      );
    },
  );
  return result;
}

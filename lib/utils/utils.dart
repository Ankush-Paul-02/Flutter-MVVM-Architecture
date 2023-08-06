import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/res/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';

class AppUtils {
  //! Toast message
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  //! Flushbar
  static flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeInOut,
        message: message,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        borderRadius: BorderRadius.circular(20),
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          color: Vx.white,
          size: 28,
        ),
        duration: const Duration(seconds: 2),
      )..show(context),
    );
  }

  //! Snackbar
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.black,
        content: message.text.size(16).white.make(),
      ),
    );
  }

  //! FocusNode
  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocusNode,
    FocusNode nextFocusNode,
  ) {
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }
}

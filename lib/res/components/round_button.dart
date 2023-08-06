import 'package:flutter/material.dart';
import 'package:flutter_mvvm/res/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: 200,
        child: loading
            ? const CircularProgressIndicator(
                color: AppColors.cyan,
                strokeWidth: 3,
              ).centered().box.size(20, 20).make()
            : title.text.color(AppColors.cyan).semiBold.make().centered(),
      ),
    );
  }
}

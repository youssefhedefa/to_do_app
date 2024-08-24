import 'package:flutter/material.dart';
import 'package:to_do_app/utils/helper/text_style_helper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text,required this.color, this.onPressed});

  final String text;
  final Color color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: color,
      child: Text(
        text,
        style: AppTextStyleHelper.font18GreyRegular,
      ),
    );
  }
}

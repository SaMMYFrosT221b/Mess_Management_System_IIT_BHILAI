import 'package:flutter/material.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/constants/text_string.dart';

class LoginFormHeader extends StatelessWidget {
  const LoginFormHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(messWelcomeScreenImage),
          height: size.height * 0.2,
        ),
        Text(
          messLoginTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          messLoginSubTitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

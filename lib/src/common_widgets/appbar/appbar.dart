import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:mess_management_system/src/constants/sizes.dart';

class MessAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MessAppBar(
      {super.key,
      this.title,
      required this.showBackArrow,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: showBackArrow
            ? IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_left))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

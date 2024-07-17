import 'package:flutter/material.dart';

import '../../../../../Notofication_screen.dart';
import '../../../../../Utils/AppSizes.dart';
import '../../../../../Utils/colors.dart';


class SAppbar extends StatelessWidget implements PreferredSizeWidget {
  SAppbar({super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed});

  final String? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: EdgeInsets.only(left: Sizes.responsiveDefaultSpace(context),
            top: Sizes.responsiveSm(context),
            bottom: Sizes.responsiveSm(context)),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: AppColors.bgBlue,
            ),
            child: Center(
              child: IconButton(
                  onPressed: () => {
                  scaffoldKey.currentState?.openDrawer(),
              },
                  icon: const Icon(Icons.menu,
                    size: 22,)
              ),
            )),
      ),
      title: Text(
        title!,
        style: const TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(
              right: Sizes.responsiveDefaultSpace(context)),
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.bgBlue,
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const NotificationScreen(),
                    ));
                  },
                  icon: const Icon(Icons.notifications_outlined),
                ),
              )),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/app_icon.dart';
import 'package:nimbus/presentation/widgets/buttons/social_button.dart';
import 'package:nimbus/presentation/widgets/nimbus_link.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

List<Widget> buildSocialIcons(List<SocialButtonData> socialItems) {
  final items = <Widget>[];
  for (var index = 0; index < socialItems.length; index++) {
    items.add(
      NimBusLink(
        url: socialItems[index].url,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryColor.withOpacity(0.3),
            ),
          ),
          child: AppIcon(
            socialItems[index].iconData,
            color: AppColors.primaryColor,
            size: Sizes.ICON_SIZE_18,
          ),
        ),
      ),
    );
    items.add(SpaceW16());
  }
  return items;
}

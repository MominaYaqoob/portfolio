import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/hero_stats_row.dart';
import 'package:nimbus/presentation/widgets/page_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/presentation/pages/home/sections/header_section/widgets.dart';
import 'package:nimbus/values/values.dart';

class HeaderSectionMobile extends StatelessWidget {
  const HeaderSectionMobile({super.key, this.onViewWork});

  final VoidCallback? onViewWork;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PageSection(
      showTopGlow: true,
      paddingVertical: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.darkCard,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppColors.darkBorder),
            ),
            child: Text(
              StringConst.HERO_BADGE,
              style: textTheme.labelLarge?.copyWith(
                color: AppColors.primaryColor,
                fontSize: 12,
              ),
            ),
          ),
          SpaceH20(),
          Text(
            StringConst.HERO_TITLE_LINE_1,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
              height: 1.15,
            ),
          ),
          ShaderMask(
            shaderCallback: (bounds) => AppGradients.heroText.createShader(bounds),
            child: Text(
              StringConst.HERO_TITLE_LINE_2,
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w800,
                height: 1.15,
              ),
            ),
          ),
          SpaceH16(),
          SelectableText(
            StringConst.ABOUT_DEV,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.grey250,
              height: 1.7,
            ),
          ),
          SpaceH24(),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              NimbusButton(
                width: 160,
                height: 48,
                buttonTitle: StringConst.HIRE_ME_NOW,
                buttonColor: AppColors.primaryColor,
                titleColor: AppColors.darkBackground,
                opensUrl: true,
                url: StringConst.MAILTO_SCHEME,
                borderRadius: const BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
              ),
              NimbusButton(
                width: 160,
                height: 48,
                buttonTitle: StringConst.VIEW_MY_WORK,
                buttonColor: AppColors.darkCard,
                titleColor: AppColors.white,
                onPressed: onViewWork,
                borderRadius: const BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
              ),
            ],
          ),
          SpaceH30(),
          const HeroStatsRow(),
          SpaceH20(),
          Wrap(
            alignment: WrapAlignment.center,
            children: buildSocialIcons(Data.socialData),
          ),
        ],
      ),
    );
  }
}

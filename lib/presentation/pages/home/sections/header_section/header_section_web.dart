import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/hero_stats_row.dart';
import 'package:nimbus/presentation/widgets/page_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/presentation/pages/home/sections/header_section/widgets.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderSectionWeb extends StatelessWidget {
  const HeaderSectionWeb({super.key, this.onViewWork});

  final VoidCallback? onViewWork;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final headlineSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_30,
      Sizes.TEXT_SIZE_48,
      md: Sizes.TEXT_SIZE_40,
    );

    return PageSection(
      showTopGlow: true,
      paddingVertical: responsiveSize(context, 48, 80),
      child: Stack(
        children: [
          const Positioned.fill(child: _HeroBackdrop()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _HeroBadge(textTheme: textTheme),
              SpaceH24(),
              Text(
                StringConst.HERO_TITLE_LINE_1,
                textAlign: TextAlign.center,
                style: textTheme.displaySmall?.copyWith(
                  fontSize: headlineSize,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                  letterSpacing: -0.5,
                ),
              ),
              ShaderMask(
                shaderCallback: (bounds) =>
                    AppGradients.heroText.createShader(bounds),
                child: Text(
                  StringConst.HERO_TITLE_LINE_2,
                  textAlign: TextAlign.center,
                  style: textTheme.displaySmall?.copyWith(
                    fontSize: headlineSize,
                    color: AppColors.white,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SpaceH24(),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 680),
                child: SelectableText(
                  StringConst.ABOUT_DEV,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.grey250,
                    height: 1.8,
                    fontSize: 17,
                  ),
                ),
              ),
              SpaceH36(),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 12,
                children: [
                  NimbusButton(
                    width: 220,
                    height: 52,
                    buttonTitle: StringConst.HIRE_ME_NOW,
                    buttonColor: AppColors.primaryColor,
                    titleColor: AppColors.darkBackground,
                    opensUrl: true,
                    url: StringConst.MAILTO_SCHEME,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Sizes.RADIUS_10)),
                  ),
                  NimbusButton(
                    width: 190,
                    height: 52,
                    buttonTitle: StringConst.VIEW_MY_WORK,
                    buttonColor: AppColors.darkCard,
                    titleColor: AppColors.white,
                    onPressed: onViewWork,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Sizes.RADIUS_10)),
                  ),
                ],
              ),
              SpaceH48(),
              const HeroStatsRow(),
              SpaceH24(),
              Wrap(
                alignment: WrapAlignment.center,
                children: buildSocialIcons(Data.socialData),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroBackdrop extends StatelessWidget {
  const _HeroBackdrop();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _GridPainter(color: AppColors.darkBorder.withOpacity(0.2)),
            ),
          ),
          Positioned(
            right: -120,
            top: -10,
            bottom: -10,
            child: Container(
              width: 380,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.transparent,
                    AppColors.primaryColor.withOpacity(0.35),
                    AppColors.primaryColor.withOpacity(0.12),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: -80,
            bottom: -80,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryColor.withOpacity(0.28),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    const gap = 34.0;
    for (double x = 0; x <= size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _HeroBadge extends StatelessWidget {
  const _HeroBadge({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.darkBorder),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.22),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        StringConst.HERO_BADGE,
        style: textTheme.labelLarge?.copyWith(
          color: AppColors.primaryColor,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class EducationSection extends StatefulWidget {
  EducationSection({Key? key});

  @override
  _EducationSectionState createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double contentAreaWidth = responsiveSize(
      context,
      screenWidth,
      screenWidth * 0.5,
      md: screenWidth * 0.5,
    );

    return VisibilityDetector(
      key: Key('education-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 30) {
          _controller.forward();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
        child: ResponsiveBuilder(
          refinedBreakpoints: RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth <= 1024) {
              return Column(
                children: [
                  ContentArea(
                    width: screenWidth,
                    child: _buildNimbusInfoSectionSm(),
                  ),
                  SpaceH40(),
                  ContentArea(
                    width: screenWidth,
                    child: _buildEducationList(),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentArea(
                    width: contentAreaWidth,
                    child: _buildEducationList(),
                  ),
                  ContentArea(
                    width: contentAreaWidth,
                    child: _buildNimbusInfoSectionLg(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildNimbusInfoSectionSm() {
    return NimbusInfoSection2(
      sectionTitle: "education",
      title1: "Academic",
      title2: "Background",
      body: "Pursuing BS Software Engineering at University of Gujrat. Strong foundation in computer science with focus on mobile app development and modern technologies.",
    );
  }

  Widget _buildNimbusInfoSectionLg() {
    return NimbusInfoSection1(
      sectionTitle: "education",
      title1: "Academic",
      title2: "Background",
      body: "Pursuing BS Software Engineering at University of Gujrat. Strong foundation in computer science with focus on mobile app development and modern technologies.",
    );
  }

  Widget _buildEducationList() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: Data.educationData.asMap().entries.map((entry) {
          int index = entry.key;
          EducationData education = entry.value;
          return Padding(
            padding: EdgeInsets.only(bottom: Sizes.PADDING_24),
            child: _buildEducationCard(education, index),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEducationCard(EducationData education, int index) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 8,
      shadowColor: AppColors.yellow300.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
        side: BorderSide(
          color: AppColors.yellow300.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(Sizes.PADDING_24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.white,
              AppColors.white.withOpacity(0.95),
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.yellow300,
                borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.yellow300.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                education.icon,
                color: AppColors.white,
                size: Sizes.ICON_SIZE_30,
              ),
            ),
            SpaceW16(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    education.degree,
                    style: textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SpaceH8(),
                  Text(
                    education.institution,
                    style: textTheme.subtitle1?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SpaceH8(),
                  Text(
                    education.duration,
                    style: textTheme.bodyText2?.copyWith(
                      color: AppColors.grey300,
                    ),
                  ),
                  if (education.specialization != null) ...[
                    SpaceH8(),
                    Text(
                      education.specialization!,
                      style: textTheme.bodyText1?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: AppColors.black400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


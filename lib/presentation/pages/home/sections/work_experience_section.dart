import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class WorkExperienceSection extends StatefulWidget {
  WorkExperienceSection({Key? key});

  @override
  _WorkExperienceSectionState createState() => _WorkExperienceSectionState();
}

class _WorkExperienceSectionState extends State<WorkExperienceSection>
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Ensure content is visible on mobile even if VisibilityDetector doesn't fire immediately.
    // Start the animation so users on small screens see the section.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _controller.forward();
      }
    });
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
      key: Key('work-experience-section'),
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
                    child: _buildExperienceList(),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentArea(
                    width: contentAreaWidth,
                    child: _buildNimbusInfoSectionLg(),
                  ),
                  ContentArea(
                    width: contentAreaWidth,
                    child: _buildExperienceList(),
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
      sectionTitle: "work experience",
      title1: "Professional",
      title2: "Experience",
      body: "Hands-on experience building modern, user-friendly mobile applications with Flutter. Working on Firebase integrations, REST APIs, and UI/UX improvements.",
    );
  }

  Widget _buildNimbusInfoSectionLg() {
    return NimbusInfoSection1(
      sectionTitle: "work experience",
      title1: "Professional",
      title2: "Experience",
      body: "Hands-on experience building modern, user-friendly mobile applications with Flutter. Working on Firebase integrations, REST APIs, and UI/UX improvements.",
    );
  }

  Widget _buildExperienceList() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: Data.workExperienceData.asMap().entries.map((entry) {
          int index = entry.key;
          WorkExperienceData experience = entry.value;
          return Padding(
            padding: EdgeInsets.only(bottom: Sizes.PADDING_24),
            child: _buildExperienceCard(experience, index),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildExperienceCard(WorkExperienceData experience, int index) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 8,
      shadowColor: AppColors.primaryColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
        side: BorderSide(
          color: AppColors.primaryColor.withOpacity(0.1),
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
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                experience.icon,
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
                    experience.position,
                    style: textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SpaceH8(),
                  Text(
                    experience.company,
                    style: textTheme.subtitle1?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SpaceH8(),
                  Text(
                    experience.duration,
                    style: textTheme.bodyText2?.copyWith(
                      color: AppColors.grey300,
                    ),
                  ),
                  SpaceH16(),
                  ...experience.responsibilities.map((responsibility) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: Sizes.PADDING_8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 6, right: 12),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              responsibility,
                              style: textTheme.bodyText2?.copyWith(
                                color: AppColors.black400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


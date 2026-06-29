import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/widgets/app_icon.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/project_preview.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'package:url_launcher/link.dart';

class ProjectData {
  final String title;
  final String category;
  final String description;
  final List<String> techStack;
  final ProjectPreviewType previewType;
  final double width;
  final double height;
  final double mobileWidth;
  final double mobileHeight;
  final bool isLive;
  final bool isComingSoon;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? liveUrl;

  ProjectData({
    required this.title,
    required this.category,
    required this.description,
    required this.techStack,
    required this.previewType,
    required this.width,
    this.mobileHeight = 0.5,
    this.mobileWidth = 1.0,
    this.height = 0.4,
    this.isLive = false,
    this.isComingSoon = false,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.liveUrl,
  });
}

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.techStack,
    required this.previewType,
    required this.width,
    required this.height,
    this.bannerHeight,
    this.titleStyle,
    this.subtitleStyle,
    this.isLive = false,
    this.isComingSoon = false,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.liveUrl,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String description;
  final List<String> techStack;
  final ProjectPreviewType previewType;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double width;
  final double height;
  final double? bannerHeight;
  final bool isLive;
  final bool isComingSoon;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? liveUrl;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  void _setHover(bool hovering) {
    if (!isDisplayDesktop(context)) return;
    setState(() => _hovering = hovering);
    if (hovering) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = !isDisplayDesktop(context);
    final showOverlay = isMobile || _hovering || widget.isComingSoon;

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(_hovering ? 0.25 : 0.08),
              blurRadius: _hovering ? 24 : 12,
              offset: Offset(0, _hovering ? 12 : 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
          child: Stack(
            children: [
              ProjectPreview(
                type: widget.previewType,
                width: widget.width,
                height: widget.height,
              ),
              AnimatedOpacity(
                opacity: showOverlay ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: _ProjectOverlay(
                  width: widget.width,
                  height: widget.height,
                  title: widget.title,
                  subtitle: widget.subtitle,
                  description: widget.description,
                  techStack: widget.techStack,
                  titleStyle: widget.titleStyle,
                  subtitleStyle: widget.subtitleStyle,
                  isLive: widget.isLive,
                  isComingSoon: widget.isComingSoon,
                  githubUrl: widget.githubUrl,
                  playStoreUrl: widget.playStoreUrl,
                  appStoreUrl: widget.appStoreUrl,
                  liveUrl: widget.liveUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectOverlay extends StatelessWidget {
  const _ProjectOverlay({
    required this.width,
    required this.height,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.techStack,
    this.titleStyle,
    this.subtitleStyle,
    this.isLive = false,
    this.isComingSoon = false,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.liveUrl,
  });

  final double width;
  final double height;
  final String title;
  final String subtitle;
  final String description;
  final List<String> techStack;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool isLive;
  final bool isComingSoon;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? liveUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(Sizes.PADDING_16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.55),
              Colors.black.withOpacity(0.82),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle.toUpperCase(),
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.primaryColor,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
            SpaceH8(),
            Text(
              title,
              style: titleStyle ??
                  textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SpaceH8(),
            Expanded(
              child: Text(
                description,
                style: subtitleStyle ??
                    textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 13,
                      height: 1.5,
                    ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: techStack
                  .map(
                    (tech) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      child: Text(
                        tech,
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SpaceH12(),
            _buildIconLinks(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIconLinks(BuildContext context) {
    if (isComingSoon) {
      return Text(
        'In Progress',
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.accentCyan,
              fontWeight: FontWeight.w700,
            ),
      );
    }

    final icons = <Widget>[];

    if (githubUrl != null && githubUrl!.isNotEmpty) {
      icons.add(_ProjectIconButton(
        icon: FontAwesomeIcons.github,
        url: githubUrl!,
        tooltip: 'View on GitHub',
      ));
    }

    if (liveUrl != null && liveUrl!.isNotEmpty) {
      icons.add(_ProjectIconButton(
        icon: FontAwesomeIcons.externalLinkAlt,
        url: liveUrl!,
        tooltip: 'View Live',
      ));
    }

    if (isLive) {
      if (playStoreUrl != null && playStoreUrl!.isNotEmpty) {
        icons.add(_ProjectIconButton(
          icon: FontAwesomeIcons.googlePlay,
          url: playStoreUrl!,
          tooltip: 'Play Store',
        ));
      }
      if (appStoreUrl != null && appStoreUrl!.isNotEmpty) {
        icons.add(_ProjectIconButton(
          icon: FontAwesomeIcons.appStore,
          url: appStoreUrl!,
          tooltip: 'App Store',
        ));
      }
    }

    if (icons.isEmpty) return const SizedBox.shrink();

    return Row(mainAxisSize: MainAxisSize.min, children: icons);
  }
}

class _ProjectIconButton extends StatefulWidget {
  const _ProjectIconButton({
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  final FaIconData icon;
  final String url;
  final String tooltip;

  @override
  State<_ProjectIconButton> createState() => _ProjectIconButtonState();
}

class _ProjectIconButtonState extends State<_ProjectIconButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Tooltip(
        message: widget.tooltip,
        child: Link(
          uri: Uri.parse(widget.url),
          target: LinkTarget.blank,
          builder: (context, followLink) {
            return GestureDetector(
              onTap: followLink,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.only(
                  right: responsiveSize(context, Sizes.PADDING_4, Sizes.PADDING_8),
                ),
                padding: EdgeInsets.all(
                  responsiveSize(context, Sizes.PADDING_6, Sizes.PADDING_8),
                ),
                decoration: BoxDecoration(
                  color: _isHovering
                      ? AppColors.primaryColor.withOpacity(0.4)
                      : Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                  border: Border.all(
                    color: _isHovering
                        ? AppColors.primaryColor.withOpacity(0.6)
                        : Colors.white.withOpacity(0.25),
                  ),
                ),
                child: FaIcon(
                  widget.icon,
                  size: responsiveSize(context, Sizes.TEXT_SIZE_14, Sizes.TEXT_SIZE_16),
                  color: AppColors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

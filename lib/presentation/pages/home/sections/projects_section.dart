import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/page_section.dart';
import 'package:nimbus/presentation/widgets/project_item.dart';
import 'package:nimbus/presentation/widgets/section_header.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectsSection extends StatefulWidget {
  ProjectsSection({Key? key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _projectController;
  late Animation<double> _projectScaleAnimation;

  static const double _gridSpacing = 20;

  @override
  void initState() {
    super.initState();
    _projectController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _projectScaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _projectController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _playProjectAnimation();
    });
  }

  @override
  void dispose() {
    _projectController.dispose();
    super.dispose();
  }

  Future<void> _playProjectAnimation() async {
    try {
      await _projectController.forward().orCancel;
    } on TickerCanceled {
      // disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = widthOfScreen(context) < 768;

    return VisibilityDetector(
      key: const Key('project-section'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction * 100 > 20) {
          _playProjectAnimation();
        }
      },
      child: PageSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProjectsHeader(),
            SpaceH40(),
            _buildLiveProjectsSection(isMobile: isMobile),
            SpaceH60(),
            _buildComingSoonSection(isMobile: isMobile),
            SpaceH60(),
            _buildOfflineProjectsSection(isMobile: isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsHeader() {
    return SectionHeader(
      label: StringConst.PROJECTS_LABEL,
      title: StringConst.PROJECTS_TITLE,
      subtitle: StringConst.PROJECTS_DESC,
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        SpaceH12(),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.grey250,
              ),
        ),
      ],
    );
  }

  Widget _buildComingSoonSection({required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          StringConst.COMING_SOON,
          StringConst.COMING_SOON_DESC,
        ),
        SpaceH30(),
        _buildProjectGrid(Data.comingSoonProjects, isMobile: isMobile),
      ],
    );
  }

  Widget _buildLiveProjectsSection({required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          StringConst.LIVE_PROJECTS_TITLE,
          StringConst.LIVE_PROJECTS_DESC,
        ),
        SpaceH30(),
        _buildProjectGrid(Data.liveProjects, isMobile: isMobile),
      ],
    );
  }

  Widget _buildOfflineProjectsSection({required bool isMobile}) {
    if (Data.offlineProjects.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          StringConst.OFFLINE_PROJECTS_TITLE,
          StringConst.OFFLINE_PROJECTS_DESC,
        ),
        SpaceH30(),
        _buildProjectGrid(Data.offlineProjects, isMobile: isMobile),
      ],
    );
  }

  /// Two-column grid on tablet/desktop; single column on narrow screens.
  Widget _buildProjectGrid(
    List<ProjectData> data, {
    required bool isMobile,
  }) {
    if (data.isEmpty) return const SizedBox.shrink();

    final crossAxisCount = isMobile ? 1 : 2;
    final screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    final cardWidth =
        (screenWidth - _gridSpacing * (crossAxisCount - 1)) / crossAxisCount;
    final cardHeight = isMobile
        ? assignHeight(context, 0.3)
        : cardWidth * 0.72;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: _gridSpacing,
        mainAxisSpacing: _gridSpacing,
        mainAxisExtent: cardHeight,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final project = data[index];
        return ScaleTransition(
          scale: _projectScaleAnimation,
          child: ProjectItem(
            width: cardWidth,
            height: cardHeight,
            title: project.title,
            subtitle: project.category,
            description: project.description,
            techStack: project.techStack,
            previewType: project.previewType,
            isLive: project.isLive,
            isComingSoon: project.isComingSoon,
            githubUrl: project.githubUrl,
            playStoreUrl: project.playStoreUrl,
            appStoreUrl: project.appStoreUrl,
            liveUrl: project.liveUrl,
          ),
        );
      },
    );
  }
}

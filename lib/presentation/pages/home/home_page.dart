import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/widgets/app_icon.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/pages/home/sections/about_me_section.dart';
import 'package:nimbus/presentation/pages/home/sections/footer_section.dart';
import 'package:nimbus/presentation/pages/home/sections/header_section/header_section.dart';
import 'package:nimbus/presentation/pages/home/sections/process_section.dart';
import 'package:nimbus/presentation/pages/home/sections/projects_section.dart';
import 'package:nimbus/presentation/pages/home/sections/services_section.dart';
import 'package:nimbus/presentation/pages/home/sections/tech_stack_section.dart';
import 'package:nimbus/presentation/pages/home/sections/work_experience_section.dart';
import 'package:nimbus/presentation/widgets/floating_dock_nav.dart';
import 'package:nimbus/presentation/widgets/floating_whatsapp_button.dart';
import 'package:nimbus/presentation/widgets/section_nav_data.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../widgets/floating_gmail_button.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );
  final GlobalKey _contactKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  int _activeDockIndex = 0;

  late final List<SectionNavData> navItems = [
    SectionNavData(name: StringConst.HOME, key: GlobalKey(), isSelected: true),
    SectionNavData(name: StringConst.ABOUT, key: GlobalKey()),
    SectionNavData(name: StringConst.SERVICES, key: GlobalKey()),
    SectionNavData(name: StringConst.PROJECTS, key: GlobalKey()),
    SectionNavData(name: StringConst.WORK_EXPERIENCE, key: GlobalKey()),
    SectionNavData(name: StringConst.CONTACT, key: _contactKey),
  ];

  void _scrollToHome() {
    scrollToSection(navItems[0].key.currentContext!);
  }

  void _scrollToProjects() {
    scrollToSection(navItems[3].key.currentContext!);
  }

  void _scrollToIndex(int index) {
    if (index >= navItems.length) return;
    final sectionContext = navItems[index].key.currentContext;
    if (sectionContext != null) {
      setState(() => _activeDockIndex = index);
      scrollToSection(sectionContext);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 100) {
        _controller.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.darkBackground,
          floatingActionButton: ScaleTransition(
            scale: _animation,
            child: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.darkBackground,
              onPressed: _scrollToHome,
              child: const AppIcon(
                AppIconData.fa(FontAwesomeIcons.arrowUp),
                size: Sizes.ICON_SIZE_18,
                color: AppColors.darkBackground,
              ),
            ),
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeaderSection(
                  key: navItems[0].key,
                  onViewWork: _scrollToProjects,
                ),
                Container(
                  key: navItems[1].key,
                  child: VisibilityDetector(
                    key: const Key('about'),
                    onVisibilityChanged: (visibilityInfo) {
                      if (visibilityInfo.visibleFraction * 100 > 10) {
                        _controller.forward();
                      }
                    },
                    child: const AboutMeSection(),
                  ),
                ),
                Container(
                  key: navItems[2].key,
                  child: const ServicesSection(),
                ),
                const TechStackSection(),
                Container(
                  key: navItems[3].key,
                  child: ProjectsSection(),
                ),
                Container(
                  key: navItems[4].key,
                  child: const WorkExperienceSection(),
                ),
                const ProcessSection(),
                Container(
                  key: _contactKey,
                  child: const FooterSection(),
                ),
                const SizedBox(height: 92),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FloatingDockNav(
            items: List.generate(
              navItems.length,
              (index) => DockItem(
                icon: defaultDockIcons[index],
                label: navItems[index].name,
                isActive: _activeDockIndex == index,
                onTap: () => _scrollToIndex(index),
              ),
            ),
          ),
        ),
        FloatingWhatsAppButton(
          phoneNumber: StringConst.WHATSAPP_NUMBER,
          message: StringConst.WHATSAPP_MESSAGE,
        ),
        FloatingGmailButton(
          gmailAddress: StringConst.DEV_EMAIL,
          subject: 'Hello from Portfolio',
        ),
      ],
    );
  }
}

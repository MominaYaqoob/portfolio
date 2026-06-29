part of 'values.dart';

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: StringConst.GITHUB_URL,
      iconData: AppIconData.fa(FontAwesomeIcons.github),
      url: StringConst.GITHUB_URL,
    ),
    SocialButtonData(
      tag: StringConst.LINKED_IN_URL,
      iconData: AppIconData.fa(FontAwesomeIcons.linkedin),
      url: StringConst.LINKED_IN_URL,
    ),
  ];

  static List<HeroStatData> heroStats = [
    HeroStatData(
      value: StringConst.HERO_STAT_1_VALUE,
      label: StringConst.HERO_STAT_1_LABEL,
    ),
    HeroStatData(
      value: StringConst.HERO_STAT_2_VALUE,
      label: StringConst.HERO_STAT_2_LABEL,
    ),
    HeroStatData(
      value: StringConst.HERO_STAT_3_VALUE,
      label: StringConst.HERO_STAT_3_LABEL,
    ),
    HeroStatData(
      value: StringConst.HERO_STAT_4_VALUE,
      label: StringConst.HERO_STAT_4_LABEL,
    ),
  ];

  static const List<String> valuePills = [
    'Innovation',
    'Quality',
    'Collaboration',
    'Impact',
  ];

  static const List<String> coreStackPills = [
    'Flutter',
    'Dart',
    'Firebase',
    'REST APIs',
    'Riverpod',
    'Figma',
    'Material Design',
  ];

  static List<ServiceCardData> servicesData = [
    ServiceCardData(
      title: 'Cross-Platform Mobile Apps',
      description:
          'Native-quality iOS and Android apps built with Flutter and Dart — responsive, performant, and maintainable.',
      icon: Icons.phone_android,
    ),
    ServiceCardData(
      title: 'Firebase Backend Integration',
      description:
          'Authentication, Firestore, Realtime Database, push notifications, and cloud-powered features for live apps.',
      icon: Icons.cloud,
    ),
    ServiceCardData(
      title: 'REST API Development',
      description:
          'Connecting mobile apps to RESTful APIs for product data, user actions, checkout flows, and live content.',
      icon: Icons.api,
    ),
    ServiceCardData(
      title: 'UI/UX Design',
      description:
          'User-centered interface design with Figma prototyping and Material Design implementation in Flutter.',
      icon: Icons.design_services,
    ),
    ServiceCardData(
      title: 'Real-Time Features',
      description:
          'Live chat, location tracking, geo-fencing, SOS alerts, and notification systems for interactive experiences.',
      icon: Icons.bolt,
    ),
    ServiceCardData(
      title: 'App Optimization',
      description:
          'Debugging, performance tuning, clean code refactoring, and improving existing Flutter applications.',
      icon: Icons.speed,
    ),
  ];

  static List<TechCategoryData> techStackCategories = [
    TechCategoryData(
      title: 'Mobile & Framework',
      technologies: [
        'Flutter',
        'Dart',
        'Material Design',
        'Cupertino Widgets',
        'Responsive UI',
      ],
    ),
    TechCategoryData(
      title: 'Backend & APIs',
      technologies: [
        'Firebase Auth',
        'Cloud Firestore',
        'Realtime Database',
        'FCM',
        'REST APIs',
        'JSON',
      ],
    ),
    TechCategoryData(
      title: 'State & Architecture',
      technologies: [
        'Riverpod',
        'Bloc',
        'Provider',
        'Clean Architecture',
        'Git & GitHub',
      ],
    ),
    TechCategoryData(
      title: 'Design & Tools',
      technologies: [
        'Figma',
        'UI/UX Design',
        'Android Studio',
        'VS Code',
        'Firebase Hosting',
      ],
    ),
  ];

  static List<ProcessStepData> processSteps = [
    ProcessStepData(
      number: '01',
      title: 'Understand',
      description:
          'Learn your goals, users, and requirements to craft a clear roadmap.',
    ),
    ProcessStepData(
      number: '02',
      title: 'Design',
      description:
          'Plan UI/UX flows, wireframes, and architecture before writing code.',
    ),
    ProcessStepData(
      number: '03',
      title: 'Develop',
      description:
          'Build features with Flutter, Firebase, and clean, maintainable code.',
    ),
    ProcessStepData(
      number: '04',
      title: 'Integrate',
      description:
          'Connect APIs, authentication, real-time data, and backend services.',
    ),
    ProcessStepData(
      number: '05',
      title: 'Test',
      description:
          'Debug, optimize performance, and ensure smooth user experience.',
    ),
    ProcessStepData(
      number: '06',
      title: 'Deliver',
      description:
          'Ship polished apps ready for demos, portfolios, and production use.',
    ),
  ];

  static List<ProjectData> liveProjects = [
    ProjectData(
      title: StringConst.PORTFOLIO_1_TITLE,
      category: 'E-Commerce',
      description: StringConst.PORTFOLIO_1_DESC,
      techStack: const ['Flutter', 'Firebase', 'Provider', 'REST API'],
      previewType: ProjectPreviewType.ecommerce,
      width: 0.5,
      mobileHeight: 0.32,
      height: 0.38,
      githubUrl: StringConst.ECOMMERCE_GITHUB,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_2_TITLE,
      category: 'Assistive Technology',
      description: StringConst.PORTFOLIO_2_DESC,
      techStack: const ['Flutter', 'GPS', 'TTS', 'Accessibility'],
      previewType: ProjectPreviewType.assistive,
      width: 0.5,
      mobileHeight: 0.32,
      height: 0.38,
      githubUrl: StringConst.STICK4GUIDE_GITHUB,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_3_TITLE,
      category: 'Delivery & Logistics',
      description: StringConst.PORTFOLIO_3_DESC,
      techStack: const ['Flutter', 'FCM', 'REST API', 'Maps'],
      previewType: ProjectPreviewType.delivery,
      width: 0.5,
      mobileHeight: 0.32,
      height: 0.38,
      githubUrl: StringConst.PELICKAN_GITHUB,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_8_TITLE,
      category: 'Diary & Notes',
      description: StringConst.PORTFOLIO_8_DESC,
      techStack: const ['Flutter', 'Firebase', 'Provider', 'Mood UI'],
      previewType: ProjectPreviewType.cloudNotes,
      width: 0.5,
      mobileHeight: 0.32,
      height: 0.38,
      githubUrl: StringConst.CLOUD_NOTES_GITHUB,
    ),
  ];

  static List<ProjectData> comingSoonProjects = [
    ProjectData(
      title: StringConst.PORTFOLIO_6_TITLE,
      category: StringConst.COMING_SOON,
      description: StringConst.PORTFOLIO_6_DESC,
      techStack: const ['Flutter', 'Riverpod', 'Firebase', 'FCM'],
      previewType: ProjectPreviewType.portfolio,
      width: 0.5,
      mobileHeight: 0.32,
      height: 0.38,
      isComingSoon: true,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_7_TITLE,
      category: StringConst.COMING_SOON,
      description: StringConst.PORTFOLIO_7_DESC,
      techStack: const ['Flutter', 'REST API', 'Hive', 'Bloc'],
      previewType: ProjectPreviewType.ecommerce,
      width: 0.5,
      mobileHeight: 0.32,
      height: 0.38,
      isComingSoon: true,
    ),
  ];

  static List<ProjectData> offlineProjects = [
    ProjectData(
      title: StringConst.PORTFOLIO_5_TITLE,
      category: 'Web Portfolio',
      description: StringConst.PORTFOLIO_5_DESC,
      techStack: const ['Flutter Web', 'Firebase', 'Responsive UI'],
      previewType: ProjectPreviewType.portfolio,
      width: 0.33,
      mobileHeight: 0.32,
      height: 0.35,
      isLive: true,
      githubUrl: StringConst.PORTFOLIO_GITHUB,
      liveUrl: StringConst.PORTFOLIO_LIVE,
    ),
  ];

  static List<WorkExperienceData> workExperienceData = [
    WorkExperienceData(
      company: 'QMH Technologies (Private) Limited',
      position: 'Development Intern',
      duration: 'Oct 2025 – Jan 2026',
      icon: Icons.work,
      responsibilities: [
        'Developed cross-platform mobile features using Flutter, Dart, Firebase, and REST API integration.',
        'Built a complete eCommerce app with product listing, cart, authentication, and checkout flows.',
        'Designed end-to-end UI/UX for the PELICKAN Driver App including prototyping and developer handoff.',
        'Improved Material Design interfaces, navigation patterns, and real-time data features in a team environment.',
      ],
    ),
  ];
}

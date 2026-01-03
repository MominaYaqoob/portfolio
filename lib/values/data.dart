part of 'values.dart';

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: StringConst.GITHUB_URL,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialButtonData(
      tag: StringConst.LINKED_IN_URL,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
  ];
  static List<SocialButton2Data> socialData2 = [
    SocialButton2Data(
      title: "GitHub",
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: "LinkedIn",
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
      titleColor: AppColors.pink300,
      buttonColor: AppColors.pink300,
      iconColor: AppColors.white,
    ),
  ];

  static List<SkillLevelData> skillLevelData = [
    SkillLevelData(skill: StringConst.TOOLS_1_NAME, level: 85), // Flutter / Dart
    SkillLevelData(skill: StringConst.TOOLS_2_NAME, level: 80), // Firebase (Auth, Firestore, Realtime DB)
    SkillLevelData(skill: StringConst.TOOLS_3_NAME, level: 75), // REST API Integration
    SkillLevelData(skill: StringConst.TOOLS_4_NAME, level: 75), // UI/UX Design
    SkillLevelData(skill: StringConst.TOOLS_5_NAME, level: 80), // State Management (Provider, setState)
    SkillLevelData(skill: StringConst.TOOLS_6_NAME, level: 75), // Clean Architecture
    SkillLevelData(skill: StringConst.TOOLS_7_NAME, level: 70), // Firebase Cloud Messaging
    SkillLevelData(skill: StringConst.TOOLS_8_NAME, level: 80), // Responsive UI
    SkillLevelData(skill: StringConst.TOOLS_9_NAME, level: 75), // Git & GitHub
    SkillLevelData(skill: StringConst.TOOLS_10_NAME, level: 70), // Figma
  ];

  static List<SkillCardData> skillCardData = [
    SkillCardData(
      title: StringConst.SKILLS_1,
      description: StringConst.SKILLS_1_DESC,
      iconData: Icons.phone_android,
    ),
    SkillCardData(
      title: "",
      description: "",
      iconData: Icons.pages_outlined,
    ), //not being used
    SkillCardData(
      title: StringConst.SKILLS_2,
      description: StringConst.SKILLS_2_DESC,
      iconData: FontAwesomeIcons.youtube,
    ),
    SkillCardData(
      title: StringConst.SKILLS_3,
      description: StringConst.SKILLS_3_DESC,
      iconData: Icons.science,
    ),
    SkillCardData(
      title: StringConst.SKILLS_4,
      description: StringConst.SKILLS_4_DESC,
      iconData: Icons.cloud,
    ),
    SkillCardData(
      title: "",
      description: "",
      iconData: Icons.pages_outlined,
    ), //not being used
  ];
  static List<StatItemData> statItemsData = [
    StatItemData(value: 4, subtitle: StringConst.HAPPY_CLIENTS),
    StatItemData(value: 1, subtitle: StringConst.YEARS_OF_EXPERIENCE),
    StatItemData(value: 10, subtitle: StringConst.INCREDIBLE_PROJECTS),
    StatItemData(value: 1, subtitle: StringConst.AWARD_WINNING),
  ];

  // static List<ProjectCategoryData> projectCategories = [
  //   ProjectCategoryData(title: StringConst.ALL, number: 5, isSelected: true),
  //   ProjectCategoryData(title: StringConst.BRANDING, number: 2),
  //   ProjectCategoryData(title: StringConst.PACKAGING, number: 0),
  //   ProjectCategoryData(title: StringConst.PHOTOGRAPHY, number: 1),
  //   ProjectCategoryData(title: StringConst.WEB_DESIGN, number: 2),
  // ];

  static List<AwardItemData> awards1 = [
    AwardItemData(
      title: StringConst.AWARDS_1,
      icon: Icons.emoji_events,
      iconColor: AppColors.yellow400,
      url: null,
    ),
    AwardItemData(
      title: StringConst.AWARDS_2,
      icon: Icons.accessibility_new,
      iconColor: AppColors.blue300,
      url: null,
    ),
    AwardItemData(
      title: StringConst.AWARDS_3,
      icon: Icons.shopping_cart,
      iconColor: AppColors.red300,
      url: null,
    ),
    AwardItemData(
      title: StringConst.AWARDS_5,
      icon: Icons.phone_android,
      iconColor: AppColors.purple300,
      url: null,
    ),
  ];
  static List<AwardItemData> awards2 = [
    AwardItemData(
      title: StringConst.AWARDS_4,
      icon: Icons.security,
      iconColor: AppColors.green300,
      url: null,
    ),
    AwardItemData(
      title: StringConst.AWARDS_6,
      icon: Icons.design_services,
      iconColor: AppColors.blue400,
      url: null,
    ),
    AwardItemData(
      title: StringConst.AWARDS_7,
      icon: Icons.cloud,
      iconColor: AppColors.orange300,
      url: null,
    ),
    AwardItemData(
      title: StringConst.AWARDS_8,
      icon: Icons.api,
      iconColor: AppColors.pink300,
      url: null,
    ),
  ];

  static List<NimBusCardData> nimbusCardData = [
    NimBusCardData(
      title: "Flutter Developer",
      subtitle: "Cross-platform mobile apps",
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
    ),
    NimBusCardData(
      title: "UI/UX Designer",
      subtitle: "Beautiful & intuitive designs",
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      circleBgColor: AppColors.yellow100,
    ),
    NimBusCardData(
      title: "Firebase Expert",
      subtitle: "Backend & real-time features",
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      leadingIconColor: AppColors.black,
      circleBgColor: AppColors.grey50,
    ),
  ];

  // Live Projects - Featured Projects
  static List<ProjectData> liveProjects = [
    ProjectData(
      title: StringConst.PORTFOLIO_1_TITLE,
      category: "E-Commerce",
      projectCoverUrl: ImagePath.PORTFOLIO_1,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: false,
      githubUrl: "",
      playStoreUrl: "",
      appStoreUrl: "",
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_2_TITLE,
      category: "Assistive Technology",
      projectCoverUrl: ImagePath.PORTFOLIO_2,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: false,
      githubUrl: "",
      playStoreUrl: "",
      appStoreUrl: "",
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_3_TITLE,
      category: "Delivery System",
      projectCoverUrl: ImagePath.PORTFOLIO_3,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: false,
      githubUrl: "",
      playStoreUrl: "",
      appStoreUrl: "",
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_4_TITLE,
      category: "Restaurant",
      projectCoverUrl: ImagePath.PORTFOLIO_4,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: false,
      githubUrl: "",
      playStoreUrl: "",
      appStoreUrl: "",
    ),
  ];

  // Offline / Non-Published Projects
  static List<ProjectData> offlineProjects = [];

  // Legacy projects (kept for backward compatibility if needed)
  static List<ProjectData> allProjects = [
    ProjectData(
      title: StringConst.PORTFOLIO_1_TITLE,
      category: StringConst.BRANDING,
      projectCoverUrl: ImagePath.PORTFOLIO_1,
      width: 0.5,
      mobileHeight: 0.3,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_2_TITLE,
      category: StringConst.BRANDING,
      projectCoverUrl: ImagePath.PORTFOLIO_2,
      width: 0.225,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_4_TITLE,
      category: StringConst.PHOTOGRAPHY,
      projectCoverUrl: ImagePath.PORTFOLIO_4,
      width: 0.2375,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_5_TITLE,
      category: StringConst.WEB_DESIGN,
      projectCoverUrl: ImagePath.PORTFOLIO_5,
      width: 0.2375,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_6_TITLE,
      category: StringConst.WEB_DESIGN,
      projectCoverUrl: ImagePath.PORTFOLIO_6,
      width: 0.475,
      mobileHeight: 0.3,
    ),
  ];
  static List<ProjectData> branding = [
    ProjectData(
      title: StringConst.PORTFOLIO_1_TITLE,
      category: StringConst.BRANDING,
      projectCoverUrl: ImagePath.PORTFOLIO_1,
      width: 0.5,
      mobileHeight: 0.3,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_2_TITLE,
      category: StringConst.BRANDING,
      projectCoverUrl: ImagePath.PORTFOLIO_2,
      width: 0.225,
    ),
  ];
  static List<ProjectData> packaging = [];
  static List<ProjectData> photograhy = [
    ProjectData(
      title: StringConst.PORTFOLIO_4_TITLE,
      category: StringConst.PHOTOGRAPHY,
      projectCoverUrl: ImagePath.PORTFOLIO_4,
      width: 0.2375,
    ),
  ];
  static List<ProjectData> webDesign = [
    ProjectData(
      title: StringConst.PORTFOLIO_5_TITLE,
      category: StringConst.WEB_DESIGN,
      projectCoverUrl: ImagePath.PORTFOLIO_5,
      width: 0.2375,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_6_TITLE,
      category: StringConst.WEB_DESIGN,
      projectCoverUrl: ImagePath.PORTFOLIO_6,
      width: 0.475,
      mobileHeight: 0.3,
    ),
  ];

  static List<WorkExperienceData> workExperienceData = [
    WorkExperienceData(
      company: "QMH Technologies",
      position: "Mobile App Development Intern",
      duration: "Oct 2025 – Present",
      icon: Icons.work,
      responsibilities: [
        "Worked on Flutter development with Firebase and REST API integrations.",
        "Improved UI/UX for multiple mobile applications.",
        "Implemented authentication, notifications, and real-time database features.",
        "Collaborated with developers to deliver functional modules.",
      ],
    ),
  ];

  static List<EducationData> educationData = [
    EducationData(
      degree: "BS Software Engineering",
      institution: "University of Gujrat, Pakistan",
      duration: "2021–2025",
      icon: Icons.school,
    ),
    EducationData(
      degree: "FSC (ICS)",
      institution: "F.G Inter College, Mangla Cantt",
      duration: "2019–2021",
      icon: Icons.book,
    ),
    EducationData(
      degree: "Matric (Computer Science)",
      institution: "WAPDA Model High School Mangla",
      duration: "2017–2019",
      icon: Icons.menu_book,
    ),
  ];
}

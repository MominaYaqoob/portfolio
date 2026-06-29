import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

enum ProjectPreviewType {
  ecommerce,
  assistive,
  delivery,
  portfolio,
  cloudNotes,
}

class ProjectPreview extends StatelessWidget {
  const ProjectPreview({
    super.key,
    required this.type,
    required this.width,
    required this.height,
  });

  final ProjectPreviewType type;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: _gradientForType(type),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: _ProjectImagePreview(
                imagePath: _imageForType(type),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: height * 0.35,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.35),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _imageForType(ProjectPreviewType type) {
    switch (type) {
      case ProjectPreviewType.ecommerce:
        return ImagePath.PREVIEW_ECOMMERCE;
      case ProjectPreviewType.assistive:
        return ImagePath.PREVIEW_STICK4GUIDE;
      case ProjectPreviewType.delivery:
        return ImagePath.PREVIEW_PELICKAN;
      case ProjectPreviewType.portfolio:
        return ImagePath.PREVIEW_PORTFOLIO;
      case ProjectPreviewType.cloudNotes:
        return ImagePath.PREVIEW_CLOUD_NOTES;
    }
  }

  LinearGradient _gradientForType(ProjectPreviewType type) {
    switch (type) {
      case ProjectPreviewType.ecommerce:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2F2413), Color(0xFF3D2E14)],
        );
      case ProjectPreviewType.assistive:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1F1A12), Color(0xFF342810)],
        );
      case ProjectPreviewType.delivery:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2C2218), Color(0xFF3A2A17)],
        );
      case ProjectPreviewType.portfolio:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF231B11), Color(0xFF30220E)],
        );
      case ProjectPreviewType.cloudNotes:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A1F3D), Color(0xFF3D2A4A)],
        );
    }
  }
}

class _ProjectImagePreview extends StatelessWidget {
  const _ProjectImagePreview({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: AppColors.darkCard,
          alignment: Alignment.center,
          child: Icon(
            Icons.image_not_supported_outlined,
            color: AppColors.grey250,
          ),
        );
      },
    );
  }
}

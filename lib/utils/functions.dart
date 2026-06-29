import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:url_launcher/url_launcher.dart';

const kDuration = Duration(milliseconds: 600);

Future<void> openUrlLink(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}

void scrollToSection(BuildContext context) {
  void tryScroll() {
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return;
    }

    Scrollable.ensureVisible(
      context,
      duration: kDuration,
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  SchedulerBinding.instance.addPostFrameCallback((_) {
    tryScroll();
    SchedulerBinding.instance.addPostFrameCallback((_) => tryScroll());
  });
}

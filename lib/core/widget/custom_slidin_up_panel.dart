import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomSlidinUpPanel extends StatelessWidget {
  final PanelController controller;
  final Widget panel;
  final Widget body;
  const CustomSlidinUpPanel({
    super.key,
    required this.controller,
    required this.panel,
    required this.body,
  });

  @override
  Widget build(BuildContext context) => SlidingUpPanel(
    body: body,
    panel: panel,
    minHeight: 10,
    maxHeight: 500,
    backdropEnabled: true,
    controller: controller,
    borderRadius: .only(topLeft: .circular(20), topRight: .circular(20)),
  );
}

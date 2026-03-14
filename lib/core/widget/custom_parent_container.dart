import 'package:flutter/widgets.dart';
import 'package:investment_fund/core/extension/context_extension.dart';

class CustomParentContainer extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomParentContainer({
    super.key,
    required this.children,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return context.isDesktop
        ? Row(
            mainAxisAlignment: mainAxisAlignment ?? .start,
            crossAxisAlignment: crossAxisAlignment ?? .start,
            children: children.map((e) => Expanded(child: e)).toList(),
          )
        : Column(
            mainAxisAlignment: mainAxisAlignment ?? .start,
            crossAxisAlignment: crossAxisAlignment ?? .start,
            children: children,
          );
  }
}

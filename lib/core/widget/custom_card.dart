import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final bool isColumn;
  final Color? color;
  final double padding;
  final Function()? onTap;
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  const CustomCard({
    super.key,
    this.color,
    this.onTap,
    this.padding = 16,
    this.isColumn = true,
    required this.children,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: .only(topLeft: .circular(10), bottomRight: .circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: .all(padding),
          child: isColumn
              ? Column(
                  mainAxisAlignment: mainAxisAlignment ?? .start,
                  crossAxisAlignment: crossAxisAlignment ?? .start,
                  children: children,
                )
              : Row(
                  crossAxisAlignment: crossAxisAlignment ?? .start,
                  mainAxisAlignment: mainAxisAlignment ?? .start,
                  children: children,
                ),
        ),
      ),
    );
  }
}

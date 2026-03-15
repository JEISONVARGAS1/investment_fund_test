import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final bool isColumn;
  final Color? color;
  final double padding;
  final double? height;
  final Function()? onTap;
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  const CustomCard({
    super.key,
    this.color,
    this.onTap,
    this.padding = 16,
    this.height,
    this.isColumn = true,
    required this.children,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    final content = isColumn
        ? Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
            children: children,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            children: children,
          );

    final constrainedContent = height != null
        ? SizedBox(
            height: height,
            child: SingleChildScrollView(
              scrollDirection: isColumn ? Axis.vertical : Axis.horizontal,
              child: content,
            ),
          )
        : content;

    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: constrainedContent,
        ),
      ),
    );
  }
}

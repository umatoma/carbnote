import 'package:flutter/material.dart';

class CnBackgroundImageContainer extends StatelessWidget {
  const CnBackgroundImageContainer({
    Key key,
    @required this.image,
    @required this.child,
    this.width = double.infinity,
    this.height = double.infinity,
  }) : super(key: key);

  final ImageProvider<Object> image;
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class CnProgressContainer extends StatelessWidget {
  const CnProgressContainer({
    Key key,
    @required this.isProgressing,
    @required this.child,
  }) : super(key: key);

  final bool isProgressing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isProgressing) ...[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: LinearProgressIndicator(),
            ),
          ),
        ],
      ],
    );
  }
}

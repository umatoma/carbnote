import 'package:flutter/material.dart';

class CnPrimaryButton extends StatelessWidget {
  const CnPrimaryButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.width = double.infinity,
    this.height = 48,
  }) : super(key: key);

  final void Function() onPressed;
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: Theme.of(context).outlinedButtonTheme.style.copyWith(
              overlayColor: MaterialStateProperty.all(
                Theme.of(context).primaryColorDark.withOpacity(0.5),
              ),
              foregroundColor: MaterialStateProperty.all(
                onPressed == null ? Colors.grey : Colors.white,
              ),
              backgroundColor: MaterialStateProperty.all(
                onPressed == null
                    ? Theme.of(context).primaryColor.withOpacity(0.5)
                    : Theme.of(context).primaryColor,
              ),
            ),
        child: child,
      ),
    );
  }
}

class CnSecondaryButton extends StatelessWidget {
  const CnSecondaryButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.width = double.infinity,
    this.height = 48,
    this.selected = false,
  }) : super(key: key);

  final void Function() onPressed;
  final Widget child;
  final double width;
  final double height;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: Theme.of(context).outlinedButtonTheme.style.copyWith(
              side: MaterialStateProperty.all(
                selected
                    ? BorderSide(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      )
                    : null,
              ),
              overlayColor: MaterialStateProperty.all(
                Theme.of(context).primaryColorLight.withOpacity(0.5),
              ),
              foregroundColor: MaterialStateProperty.all(
                onPressed == null
                    ? Colors.grey
                    : Theme.of(context).primaryColor,
              ),
              backgroundColor: MaterialStateProperty.all(
                onPressed == null
                    ? Colors.white.withOpacity(0.8)
                    : Colors.white,
              ),
            ),
        child: child,
      ),
    );
  }
}

class CnBottomButtonsContainer extends StatelessWidget {
  const CnBottomButtonsContainer({
    Key key,
    @required this.children,
    this.shadowColor = Colors.white,
  }) : super(key: key);

  final List<Widget> children;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            shadowColor,
            shadowColor.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final child in children) ...[
                child,
                if (children.last != child) const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

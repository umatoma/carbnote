import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CnNavBar extends CupertinoNavigationBar {
  const CnNavBar({
    Widget leading,
    Widget middle,
    Widget trailing,
  }) : super(
          backgroundColor: Colors.white,
          border: const Border(),
          leading: leading,
          middle: middle,
          trailing: trailing,
        );
}

class CnTransparentNavBar extends StatefulWidget
    implements ObstructingPreferredSizeWidget {
  const CnTransparentNavBar({
    Key key,
    this.leading,
  }) : super(key: key);

  final Widget leading;

  @override
  _MyCupertinoNavigationBarState createState() =>
      _MyCupertinoNavigationBarState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(kMinInteractiveDimensionCupertino);
  }

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}

class _MyCupertinoNavigationBarState extends State<CnTransparentNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMinInteractiveDimensionCupertino +
          MediaQuery.of(context).padding.top,
      child: SafeArea(
        bottom: false,
        child: NavigationToolbar(
          leading: widget.leading == null
              ? null
              : Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: widget.leading,
                ),
          centerMiddle: true,
          middleSpacing: 6.0,
        ),
      ),
    );
  }
}

class CnNavButton extends StatelessWidget {
  const CnNavButton({
    Key key,
    @required this.onPressed,
    @required this.icon,
  }) : super(key: key);

  const CnNavButton.back({
    Key key,
    @required this.onPressed,
  })  : icon = const Icon(CupertinoIcons.chevron_back),
        super(key: key);

  const CnNavButton.close({
    Key key,
    @required this.onPressed,
  })  : icon = const Icon(CupertinoIcons.multiply),
        super(key: key);

  const CnNavButton.gear({
    Key key,
    @required this.onPressed,
  })  : icon = const Icon(CupertinoIcons.gear),
        super(key: key);

  final void Function() onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          onPressed: onPressed,
          color: Theme.of(context).primaryColor,
          icon: icon,
        ),
      ),
    );
  }
}

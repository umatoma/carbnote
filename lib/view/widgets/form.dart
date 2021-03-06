import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbnote/view/widgets/animation.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CnTextField extends StatefulWidget {
  const CnTextField({
    Key key,
    this.onChanged,
    this.onFocusChanged,
    this.controller,
    this.initialValue,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.hintText,
    this.prefixIcon = CupertinoIcons.pencil,
    this.maxLength = 128,
    this.autofocus = false,
  }) : super(key: key);

  final void Function(String value) onChanged;
  final void Function(bool hasFocus) onFocusChanged;
  final TextEditingController controller;
  final String initialValue;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final String hintText;
  final IconData prefixIcon;
  final int maxLength;
  final bool autofocus;

  @override
  _CnTextFieldState createState() => _CnTextFieldState();
}

class _CnTextFieldState extends State<CnTextField> {
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusNodeChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusNodeChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: widget.readOnly ? Colors.transparent : Colors.grey[300],
        ),
      ),
      child: Center(
        child: TextFormField(
          onChanged: widget.onChanged,
          focusNode: _focusNode,
          controller: widget.controller,
          initialValue: widget.initialValue,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          readOnly: widget.readOnly,
          cursorWidth: 1,
          maxLines: 1,
          maxLength: widget.maxLength,
          autofocus: widget.autofocus,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 4),
            counterText: '',
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            alignLabelWithHint: true,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            prefixIconConstraints: const BoxConstraints(
              maxWidth: 32,
              maxHeight: 32,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                widget.prefixIcon,
                size: 16,
                color: widget.readOnly
                    ? Colors.grey[300]
                    : Theme.of(context).primaryColor,
              ),
            ),
            // prefixIcon: Icon(CupertinoIcons.pencil),
          ),
        ),
      ),
    );
  }

  void _onFocusNodeChange() {
    widget.onFocusChanged?.call(_focusNode.hasFocus);
  }
}

class CnImageField extends StatelessWidget {
  const CnImageField({
    @required this.onPressed,
    @required this.icon,
    this.image,
  })  : imageURL = null,
        imageFile = null,
        super();

  const CnImageField.fileOrURL({
    @required this.onPressed,
    @required this.icon,
    this.imageURL,
    this.imageFile,
  })  : image = null,
        super();

  final void Function() onPressed;
  final IconData icon;
  final String imageURL;
  final File imageFile;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    Widget _image = image;
    if (imageFile != null) {
      _image = Image.file(imageFile);
    } else if (imageURL != null) {
      _image = CachedNetworkImage(
        placeholder: (context, url) => Image.memory(kTransparentImage),
        imageUrl: imageURL,
      );
    }

    return SizedBox(
      width: 128,
      height: 128,
      child: Stack(
        children: [
          Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(64),
              border: Border.all(
                width: 1,
                color: Colors.grey[300],
              ),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(64),
              color: Colors.white,
              child: InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(64),
                child: ClipOval(
                  child: _image == null
                      ? Center(
                          child: Icon(
                            icon,
                            size: 32,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: _image,
                          ),
                        ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.up_arrow,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CnSlider extends StatelessWidget {
  const CnSlider({
    Key key,
    @required this.onChanged,
    @required this.value,
    @required this.label,
    this.min = 0.0,
    this.max = 100.0,
    this.divisions,
    this.readOnly = false,
    this.width = double.infinity,
    this.height = 48.0,
  }) : super(key: key);

  final void Function(double value) onChanged;
  final double value;
  final String label;
  final double min;
  final double max;
  final int divisions;
  final bool readOnly;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '$min',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '$max',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: height,
                  child: SliderTheme(
                    data: Theme.of(context).sliderTheme.copyWith(
                          trackHeight: 2,
                          tickMarkShape: SliderTickMarkShape.noTickMark,
                          disabledActiveTrackColor:
                              Theme.of(context).primaryColor,
                          inactiveTrackColor: Colors.grey[300],
                          disabledThumbColor: Colors.grey[300],
                        ),
                    child: Slider(
                      onChanged: readOnly ? null : onChanged,
                      value: value,
                      min: min,
                      max: max,
                      divisions: divisions,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 48,
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyText2.apply(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}

class CnCheckBox extends StatelessWidget {
  const CnCheckBox({
    Key key,
    @required this.onPressed,
    @required this.child,
    @required this.value,
  }) : super(key: key);

  final void Function(bool value) onPressed;
  final Widget child;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return CnSecondaryButton(
      onPressed: () => onPressed(!value),
      height: 24,
      leading: CnScaleSwitcher(
        child: Icon(
          CupertinoIcons.checkmark_alt,
          key: ValueKey(value),
          size: 16,
          color: value ? Theme.of(context).primaryColor : Colors.grey[300],
        ),
      ),
      child: DefaultTextStyle(
        style: Theme.of(context)
            .textTheme
            .overline
            .apply(color: Theme.of(context).primaryColor),
        child: child,
      ),
      trailing: const SizedBox(width: 16),
    );
  }
}

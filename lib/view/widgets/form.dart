import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CnTextField extends StatelessWidget {
  const CnTextField({
    Key key,
    this.onChanged,
    this.controller,
    this.initialValue,
    this.keyboardType,
    this.obscureText = false,
    this.hintText,
    this.prefixIcon = CupertinoIcons.pencil,
  }) : super(key: key);

  final void Function(String value) onChanged;
  final TextEditingController controller;
  final String initialValue;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final IconData prefixIcon;

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
          color: Colors.grey[300],
        ),
      ),
      child: Center(
        child: TextFormField(
          onChanged: onChanged,
          controller: controller,
          initialValue: initialValue,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorWidth: 1,
          maxLines: 1,
          maxLength: 128,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 4),
            counterText: '',
            hintText: hintText,
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
                prefixIcon,
                size: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
            // prefixIcon: Icon(CupertinoIcons.pencil),
          ),
        ),
      ),
    );
  }
}

class CnImageField extends StatelessWidget {
  const CnImageField({
    @required this.onPressed,
    this.image,
  }) : super();

  final void Function() onPressed;
  final Widget image;

  @override
  Widget build(BuildContext context) {
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
                  child: image == null
                      ? Center(
                          child: Icon(
                            CupertinoIcons.person,
                            size: 32,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: image,
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

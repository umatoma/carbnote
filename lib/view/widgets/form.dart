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
    @required this.icon,
    this.image,
  }) : super();

  final void Function() onPressed;
  final IconData icon;
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

class CnGramField extends StatefulWidget {
  const CnGramField({
    @required this.onChanged,
    @required this.gram,
  }) : super();

  final void Function(int value) onChanged;
  final int gram;

  @override
  _CnGramFieldState createState() => _CnGramFieldState();
}

class _CnGramFieldState extends State<CnGramField> {
  final int _digits = 3;
  List<FixedExtentScrollController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _controllers = widget.gram
        .toString()
        .padLeft(_digits, '0')
        .split('')
        .map((s) => int.tryParse(s) ?? 0)
        .map((n) => FixedExtentScrollController(initialItem: n))
        .toList();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = List.generate(10, (i) {
      return Text(
        '$i',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      );
    }).toList();
    return Container(
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          for (final controller in _controllers)
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _buildPicker(
                  onSelectedItemChanged: (i) => _onSelectedItemChanged(),
                  controller: controller,
                  looping: true,
                  children: items,
                ),
              ),
            ),
          Container(
            width: 24,
            height: 32,
            color: Colors.grey[200],
            child: const Center(
              child: Text('g'),
            ),
          ),
        ],
      ),
    );
  }

  void _onSelectedItemChanged() {
    final gramString = _controllers.map((c) => c.selectedItem % 10).join('');
    final gram = int.tryParse(gramString) ?? 0;
    widget.onChanged(gram);
  }

  Widget _buildPicker({
    @required void Function(int i) onSelectedItemChanged,
    @required FixedExtentScrollController controller,
    @required bool looping,
    @required List<Widget> children,
  }) {
    return CupertinoPicker(
      onSelectedItemChanged: onSelectedItemChanged,
      scrollController: controller,
      itemExtent: 32,
      looping: looping,
      backgroundColor: Colors.white,
      selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
        capLeftEdge: false,
        capRightEdge: false,
      ),
      children: children,
    );
  }
}

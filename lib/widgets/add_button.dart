import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  final int width;
  final int height;
  final String addText;
  final int maxValue;
  final Function(int) onChanged;
  final Function(int) onMaxValue;
  final Color disabledColor;
  final Color enabledColor;
  final Color iconColor;
  final Color countColor;
  final Color textColor;
  final Color textBackgroundColor;
  final Color countBackgroundColor;
  final Color borderColor;
  final bool showBorder;

  AddButton({
    @required this.onChanged,
    this.height,
    this.maxValue,
    this.onMaxValue,
    this.width = 100,
    this.addText = 'ADD',
    this.disabledColor = Colors.grey,
    this.enabledColor = Colors.deepOrange,
    this.countColor = Colors.black,
    this.iconColor = Colors.white,
    this.textBackgroundColor = const Color(0xFFFF7230),
    this.countBackgroundColor = Colors.white,
    this.textColor = Colors.white,
    this.borderColor = Colors.deepOrange,
    this.showBorder = true,
  });

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
    return widget.onChanged(count);
  }

  void decrement() {
    setState(() {
      count--;
    });
    return widget.onChanged(count);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height?.toDouble(),
      width: widget.width?.toDouble(),
      child: Container(
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: count == 0
              ? this.widget.textBackgroundColor
              : this.widget.countBackgroundColor,
          borderRadius: BorderRadius.circular(5),
          border: this.widget.showBorder
              ? Border.all(color: this.widget.borderColor)
              : null,
        ),
        child: Row(
          children: [
            count == 0
                ? SizedBox.shrink()
                : _buildButton(
                    onTap: decrement,
                    iconData: Icons.remove,
                  ),
            Expanded(
              child: InkWell(
                onTap: () => count == 0
                    ? count == widget.maxValue
                        ? widget.onMaxValue == null
                            ? null
                            : widget.onMaxValue(count)
                        : increment()
                    : null,
                child: Text(
                  count == 0 ? widget.addText : count.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: count == 0
                        ? this.widget.textColor
                        : this.widget.countColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            _buildButton(
              onTap: () =>
              count == widget.maxValue
                  ? widget.onMaxValue == null
                  ? null
                  : widget.onMaxValue(count)
                  : increment(),
              iconData: Icons.add,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildButton({
    @required VoidCallback onTap,
    @required IconData iconData,
  }) {
    return Container(
      color: iconData == Icons.add
          ? count == widget.maxValue
          ? this.widget.disabledColor
          : this.widget.enabledColor
          : this.widget.enabledColor,
      alignment: Alignment.center,
      width: 30,
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: 20,
        icon: Icon(iconData, color: this.widget.iconColor),
        onPressed: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  final int width;
  final int height;
  final String addText;
  final int maxValue;
  final int minValue;
  final Function(int) onChanged;
  final Function(int) onMaxValue;
  final Function(int) onMinValue;
  final double iconSize;
  final Color disabledColor;
  final Color enabledColor;
  final Color iconColor;
  final Color countColor;
  final Color textColor;
  final Color textBackgroundColor;
  final Color countBackgroundColor;
  final Color borderColor;
  final bool showBorder;
  final IconData addIcon;
  final IconData removeIcon;
  final int initialValue;

  AddButton({
    @required this.onChanged,
    this.height,
    this.maxValue,
    this.onMaxValue,
    this.onMinValue,
    this.iconSize,
    this.initialValue,
    this.width = 100,
    this.minValue = 0,
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
    this.addIcon = Icons.add,
    this.removeIcon = Icons.remove,
  }) {
    if (initialValue != null && minValue != null)
      assert(
        minValue <= initialValue,
        "The initialValue must be greater than minValue",
      );

    if (initialValue != null && maxValue != null)
      assert(
        initialValue <= maxValue,
        "The initialValue must be less than maxValue",
      );
  }

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  int count;

  @override
  void initState() {
    count = widget.initialValue ?? widget.minValue;
    super.initState();
  }

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
              onTap: () =>
              count == widget.minValue
                  ? widget.onMinValue == null
                  ? null
                  : widget.onMinValue(count)
                  : decrement(),
            ),
            Expanded(
              child: InkWell(
                onTap: () =>
                count == 0
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
              isAddButton: true,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildButton({
    @required VoidCallback onTap,
    bool isAddButton = false,
  }) {
    return Container(
      color: isAddButton
          ? count == widget.maxValue
          ? this.widget.disabledColor
          : this.widget.enabledColor
          : count == widget.minValue
          ? this.widget.disabledColor
          : this.widget.enabledColor,
      alignment: Alignment.center,
      width: 30,
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: 20,
        icon: Icon(
          isAddButton ? this.widget.addIcon : this.widget.removeIcon,
          color: this.widget.iconColor,
          size: this.widget.iconSize,
        ),
        onPressed: onTap,
      ),
    );
  }
}

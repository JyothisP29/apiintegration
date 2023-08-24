import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Field extends StatefulWidget {
  const Field({
    Key? key,
    this.height = 35,
    this.width,
    this.showBorder = true,
    this.contentPadding,
    this.isEnabled = true,
    this.isNumberInput = false,
    this.autoFocus = false,
    this.style,
    this.hint,
    this.hintStyle,
    this.maxLines,
    this.borderSide,
    this.textAlign,
    this.controller,
    this.focusNode,
    this.formatters,
    this.suffix,
    this.color = Colors.white,
    this.onChanged,
    this.expands = false,
    this.suffixText,
    this.borderRadius,
    this.prefix,
    this.onTap,
    this.autoFillHints,
    this.onSubmitted,
    this.textAlignVertical,
  })  : eyeButton = false,
        super(key: key);
  const Field.obscure({
    Key? key,
    this.height = 45,
    this.width,
    this.showBorder = true,
    this.contentPadding,
    this.isEnabled = true,
    this.isNumberInput = false,
    this.autoFocus = false,
    this.style,
    this.hint,
    this.expands = false,
    this.hintStyle,
    this.maxLines,
    this.borderSide,
    this.textAlign,
    this.controller,
    this.focusNode,
    this.formatters,
    this.suffix,
    this.color = Colors.white,
    this.onChanged,
    this.suffixText,
    this.borderRadius,
    this.prefix,
    this.onTap,
    this.autoFillHints,
    this.onSubmitted, this.textAlignVertical,
  })  : eyeButton = true,
        super(key: key);
  final double? height;
  final bool showBorder;
  final BorderSide? borderSide;
  final bool isEnabled;
  final bool autoFocus;
  final bool expands;
  final bool isNumberInput;
  final double? width;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? formatters;
  final Color? color;
  final String? hint;
  final String? suffixText;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLines;
  final TextAlignVertical? textAlignVertical;
  final List<String>? autoFillHints;
  final TextStyle? style;
  final Function(String?)? onChanged;
  final EdgeInsets? contentPadding;
  final VoidCallback? onTap;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final BorderRadius? borderRadius;
  final bool? eyeButton;
  @override
  State<Field> createState() => _FieldState();
}
class _FieldState extends State<Field> {
  bool isObscure = false;
  @override
  void initState() {
    if (widget.eyeButton ?? false) {
      isObscure = true;
      setState(() {});
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextField(
        expands: widget.expands,
        onSubmitted: widget.onSubmitted,
        onTap: widget.onTap,
        controller: widget.controller,
        focusNode: widget.focusNode,
        autofocus: widget.autoFocus,
        onChanged: widget.onChanged,
        textAlignVertical: widget.textAlignVertical??TextAlignVertical.center,
        obscureText: isObscure,
        autofillHints: widget.autoFillHints ?? [],
        enabled: widget.isEnabled,
        style:
        widget.style ?? const TextStyle(fontSize: 12, color: Colors.black),
        maxLines: isObscure ? 1 : widget.maxLines,
        textAlign: widget.textAlign ?? TextAlign.start,
        keyboardType:
        widget.isNumberInput ? TextInputType.number : TextInputType.text,
        inputFormatters: widget.isNumberInput
            ? [
          FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
          TextInputFormatter.withFunction((oldValue, newValue) {
            try {
              final text = newValue.text;
              if (text.isNotEmpty) double.parse(text);
              return newValue;
            } catch (e) {
              return oldValue;
            }
          }),
          ...?widget.formatters
        ]
            : widget.formatters,
        decoration: InputDecoration(
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: widget.prefix,
          fillColor: widget.color,
          suffixIcon: widget.suffix == null
              ? ((widget.eyeButton ?? false)
              ? InkWell(
            onTap: () {
              isObscure = !isObscure;
              setState(() {});
            },
            child: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          )
              : null)
              : SizedBox(
            width: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 1000, child: widget.suffix!),
              ],
            ),
          ),
          suffixText: widget.suffixText,
          hintText: widget.hint,
          hintStyle: widget.hintStyle ??
              TextStyle(
                color: Colors.grey.shade500,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          disabledBorder: getOutlinedBorder(),
          border: getOutlinedBorder(),
          errorBorder: getOutlinedBorder(),
          enabledBorder: getOutlinedBorder(),
          focusedBorder: getOutlinedBorder(),
          focusedErrorBorder: getOutlinedBorder(),
        ),
      ),
    );
  }
  OutlineInputBorder getOutlinedBorder() {
    final borderRadius = widget.borderRadius ?? BorderRadius.circular(3);
    return OutlineInputBorder(
      borderSide: getBorder(),
      borderRadius: borderRadius,
    );
  }
  BorderSide getBorder() {
    return widget.borderSide != null
        ? widget.borderSide!
        : widget.showBorder
        ? BorderSide(color: Colors.grey.shade300, width: 0.5)
        : const BorderSide(color: Colors.transparent, width: 0);
  }
}
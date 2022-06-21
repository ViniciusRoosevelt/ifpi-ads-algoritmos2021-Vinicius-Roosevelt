import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/colors.dart';

class AppInputText extends StatefulWidget {
  final int? maxLines;
  final FocusNode? focusNode;
  final bool? enabled;
  final Function(dynamic)? onSelect;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool? enableInteractiveSelection;
  final String? prefixIcon;
  final bool? hasSuffixIcon;
  final String? suffixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final int? maxLength;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
  final TextCapitalization? textCapitalization;
  final String? prefixText;
  final List<TextInputFormatter>? formatters;

  const AppInputText({
    Key? key,
    this.enabled = true,
    this.enableInteractiveSelection = true,
    this.focusNode,
    this.prefixText,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction,
    this.keyboardType,
    this.obscureText = false,
    this.initialValue,
    this.onSaved,
    this.textCapitalization,
    this.prefixIcon,
    this.maxLength,
    this.suffixIcon,
    this.onSelect,
    this.hasSuffixIcon = false,
    this.maxLines = 1,
    this.formatters,
  }) : super(key: key);

  @override
  _AppInputTextState createState() => _AppInputTextState();
}

class _AppInputTextState extends State<AppInputText> {
  FocusNode? _focusNode;
  bool focused = false;
  bool hasError = false;
  bool showPassword = false;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode?.addListener(
        () => setState(() => focused = _focusNode?.hasFocus == true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color _errorColor = Theme.of(context).errorColor;
    final Color _currentColor = Theme.of(context).primaryColor;
    final EdgeInsets _iconPaddings = EdgeInsets.symmetric(vertical: 10.0);

    InputDecoration _inputDecoration = InputDecoration(
        prefixText: widget.prefixText,
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: _iconPaddings,
                child: SvgPicture.string(
                  widget.prefixIcon ?? '',
                  color: hasError
                      ? _errorColor
                      : focused
                          ? _currentColor
                          : Color.fromRGBO(0, 0, 0, 0.56),
                ),
              )
            : null,
        suffixIcon: widget.obscureText == true
            ? Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(
                      showPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: hasError ? _errorColor : _currentColor),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              )
            : hasError
                ? Padding(
                    padding: _iconPaddings,
                    child:
                        Icon(Icons.warning_amber_rounded, color: _errorColor),
                  )
                : widget.suffixIcon != null
                    ? Padding(
                        padding: _iconPaddings,
                        child: SvgPicture.string(
                          widget.suffixIcon ?? '',
                          color: hasError ? _errorColor : _currentColor,
                        ),
                      )
                    : widget.hasSuffixIcon == true
                        ? Padding(
                            padding: _iconPaddings,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 10.0,
                              color: hasError ? _errorColor : _currentColor,
                            ),
                          )
                        : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: _currentColor, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide:
              BorderSide(width: 1.0, color: Theme.of(context).errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide:
              BorderSide(width: 2.0, color: Theme.of(context).errorColor),
        ),
        filled: true,
        labelStyle: TextStyle(
          fontSize: 16,
          color: hasError
              ? Theme.of(context).errorColor
              : focused
                  ? _currentColor
                  : (Theme.of(context).brightness == Brightness.dark)
                      ? Color.fromRGBO(255, 255, 255, 0.56)
                      : Color.fromRGBO(0, 0, 0, 0.56),
        ),
        hintStyle: TextStyle(
          color: (Theme.of(context).brightness == Brightness.dark)
              ? Color.fromRGBO(255, 255, 255, 0.56)
              : null,
          fontSize: 16,
        ),
        fillColor: Colors.white,
        labelText: widget.labelText ?? null,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.16))),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.16))));

    return Theme(
        data: ThemeData(
          primaryColor: Color.fromRGBO(0, 0, 0, 0.88),
        ),
        child: Opacity(
            opacity: widget.enabled == true ? 1.0 : 0.4,
            child: TextFormField(
              cursorColor: _currentColor,
              maxLines: widget.maxLines,
              enabled: widget.enabled,
              maxLength: widget.maxLength,
              enableInteractiveSelection:
                  widget.enableInteractiveSelection == true,
              focusNode: _focusNode,
              inputFormatters: widget.formatters,
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, 0.88),
              ),
              validator: widget.validator != null
                  ? (value) {
                      String? error = widget.validator?.call(value);
                      setState(() {
                        hasError = error != null;
                      });
                      return error;
                    }
                  : null,
              controller: widget.controller,
              onChanged: widget.onChanged,
              textInputAction: widget.textInputAction,
              onFieldSubmitted: widget.onFieldSubmitted,
              decoration: _inputDecoration,
              onSaved: widget.onSaved,
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.none,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText == true ? !showPassword : false,
            )));
  }
}

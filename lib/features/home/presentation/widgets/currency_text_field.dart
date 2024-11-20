import 'package:currency_exchanger/core/theme/colors.dart';
import 'package:currency_exchanger/core/theme/text_styles.dart';
import 'package:currency_exchanger/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CurrencyTextField extends StatefulWidget {
  const CurrencyTextField({
    required this.currencyController,
    super.key,
  });

  final TextEditingController currencyController;

  @override
  State<CurrencyTextField> createState() => _CurrencyTextFieldState();
}

class _CurrencyTextFieldState extends State<CurrencyTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.neutralGrey03,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3),
          topRight: Radius.circular(3),
        ),
      ),
      child: TextField(
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        cursorColor: AppColors.branded,
        focusNode: _focusNode,
        controller: widget.currencyController,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.neutralGrey02),
          ),
          labelText: AppStrings.currencyCode,
          labelStyle: AppTextStyles.inputLabel.copyWith(
            color: _isFocused ? AppColors.branded : AppColors.neutralDark,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.branded, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        style: AppTextStyles.inputContent.copyWith(fontSize: 16),
      ),
    );
  }
}

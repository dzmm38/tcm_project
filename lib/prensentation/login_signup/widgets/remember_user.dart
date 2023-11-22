import 'package:flutter/material.dart';
import 'package:tcm_project/application/utility/bloc/utility_bloc.dart';


class RememberUserCheckbox extends StatelessWidget {
  final String checkboxText;
  final bool isChecked;
  final UtilityBloc rememberMeBloc;

  const RememberUserCheckbox({super.key, required this.checkboxText, required this.isChecked, required this.rememberMeBloc});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    
    return SizedBox(
      height: 20,
      width: 340,
      child: Row(
        children: [
          Checkbox(
            visualDensity: VisualDensity.compact,
            activeColor: Colors.green,
            value: isChecked, 
            onChanged: (isChecked) => rememberMeBloc.add(RememberMePressEvent(isChecked!)),
          ),
          Text(checkboxText, style: themeData.textTheme.bodyLarge!.copyWith(fontSize: 12, color: themeData.appBarTheme.backgroundColor, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
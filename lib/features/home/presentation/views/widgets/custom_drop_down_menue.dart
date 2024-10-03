import 'package:flutter/material.dart';

class CustomFromDropButtonMenue extends StatelessWidget {
  const CustomFromDropButtonMenue({super.key, this.onChanged, required this.currencyList, required this.value});
  final void Function(String?)? onChanged ;
  final List<String> currencyList ;
  final String value ;
  @override
  Widget build(BuildContext context) {
        return SizedBox(
      width: 100,
      child: DropdownButton(
        isExpanded: true,
        value: value,
        items:currencyList.map((e){    
          return DropdownMenuItem( value: e,child:Text("$e")  ,) ;
      }).toList(),
        onChanged: onChanged ,
      ),
    );
  }
}



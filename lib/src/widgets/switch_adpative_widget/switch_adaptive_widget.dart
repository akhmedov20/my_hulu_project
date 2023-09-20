import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../utils/utils.dart';

class SwitchAdaptiveWidget extends StatefulWidget {
  const SwitchAdaptiveWidget({Key? key}) : super(key: key);

  @override
  State<SwitchAdaptiveWidget> createState() => _SwitchAdaptiveWidgetState();
}

class _SwitchAdaptiveWidgetState extends State<SwitchAdaptiveWidget> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return SizedBox(
      width: 73 * w,
      height: 44 * h,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch.adaptive(
          activeColor: Color(0xff35C658),
            thumbColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
            inactiveThumbColor: Colors.grey,
            value: _value,
            onChanged: (value){
              setState(() {
                _value = value;
              });
            }),
      ),
    );
  }
}

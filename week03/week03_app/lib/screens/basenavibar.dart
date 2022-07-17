import 'package:flutter/material.dart';

class BaseNaviBar extends StatefulWidget {
  final List<bool> isSelected;

  const BaseNaviBar({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<BaseNaviBar> createState() => _BaseNaviBarState();
}

class _BaseNaviBarState extends State<BaseNaviBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
      child: ToggleButtons(
        disabledColor: Colors.white,
        renderBorder: false,
        borderRadius: BorderRadius.circular(10),
        borderWidth: 0,
        borderColor: Colors.white,
        selectedBorderColor: Colors.white,
        fillColor: Colors.white,
        color: Colors.grey,
        selectedColor: Colors.black,
        constraints: const BoxConstraints(minHeight: 36.0),
        isSelected: widget.isSelected,
        onPressed: (int newIndex) {
          setState(() {
            for (int i = 0; i < widget.isSelected.length; i++) {
              if (i == newIndex) {
                widget.isSelected[i] = true;
                Navigator.popAndPushNamed(context, '/$newIndex');
              } else {
                widget.isSelected[i] = false;
              }
            }
          });
        },
        children: const [
          ToggleButton(name: '기록'),
          ToggleButton(name: '조회'),
        ],
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String name;
  const ToggleButton({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.lightBlue.shade200,
          borderRadius: BorderRadius.circular(100)),
      padding: const EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.center,
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

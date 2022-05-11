import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:petroplus/service_locator.dart';
import 'package:petroplus/utils/date_handler.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({Key? key}) : super(key: key);

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {

  Widget _buildActionButton({
    required IconData? iconData, 
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Icon(iconData, size: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: Colors.grey, width: .4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          _buildActionButton(
            iconData: Icons.chevron_left,
            onTap: locator.get<DateHandler>().getDateBackward,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(Icons.calendar_today_rounded, size: 20, color: Colors.black87),
                SizedBox(width: 5),
                ValueListenableBuilder<String>(
                  valueListenable: locator.get<DateHandler>().dateInterval,
                  builder: (context, value, widget) {
                    return Text(value);
                  }
                )
              ],
            ),
          ),
          _buildActionButton(
            iconData: Icons.chevron_right,
            onTap: locator.get<DateHandler>().getDateBackward,
          ),
        ],
      ),
    );
  }
}
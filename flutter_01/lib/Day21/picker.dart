import 'package:flutter/material.dart';

class DateTimePickerPage extends StatefulWidget {
  const DateTimePickerPage({super.key});

  @override
  State<DateTimePickerPage> createState() => _DateTimePickerPageState();
}

/**
 *  日期选择器
 */
class _DateTimePickerPageState extends State<DateTimePickerPage> {
  var date = DateTime.now();
  var time = TimeOfDay.now();

  showPicker() {
    showDatePicker(
            context: context,
            initialDate: date, //默认选中的时间
            firstDate: DateTime(2000, 1, 1),
            lastDate: DateTime(2028, 12, 30))
        .then((value) {
      if (value != null) {
        setState(() {
          date = value;
        });
      }
    });
  }

  showTime() {
    showTimePicker(context: context, initialTime: time).then((value) {
      print(value);
      if (value != null) {
        setState(() {
          time = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: showPicker,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${date.year}年${date.month}月${date.day}日",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Icon(Icons.arrow_drop_down_rounded),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: showTime,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${time.hour}时${date.second}分${date.minute}秒",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Icon(Icons.arrow_drop_down_rounded),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

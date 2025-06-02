import 'package:flutter/material.dart';
import 'package:listr/components/authinputfield.dart';
import 'package:listr/components/authsubmitbtn.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class AddWidget extends StatefulWidget {
  const AddWidget({super.key});

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  final TextEditingController _taskTitleController = TextEditingController();
  DateTime? selectedDateTime;
  final List<String> _categoryItems = ['Work', 'Workout', 'Food', 'Others'];

  @override
  void dispose() {
    // TODO: implement dispose
    _taskTitleController.dispose();
    super.dispose();
  }

  @override
  SafeArea build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create\nNew Task",
                style: TextStyle(
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthInputField(
                      fieldController: _taskTitleController,
                      hintText: "Task Title",
                      isObscured: false,
                      type: "normal"),
                  const SizedBox(
                    height: 16,
                  ),
                  AuthInputField(
                      fieldController: _taskTitleController,
                      hintText: "Task Description",
                      isObscured: false,
                      type: "desc"),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Category",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[100],
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DropdownButtonHideUnderline(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[50]!.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16)),
                      child: DropdownButton(
                          value: _categoryItems[0],
                          isExpanded: true,
                          dropdownColor: Colors.black,
                          padding:
                              const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                          items: List.generate(_categoryItems.length, (index) {
                            return DropdownMenuItem(
                                value: _categoryItems[index],
                                child: Text(_categoryItems[index],
                                    style: TextStyle(color: Colors.grey[300])));
                          }),
                          onChanged: (value) => print('hello')),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Date and Time",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300],
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                      onPressed: () async {
                        picker.DatePicker.showDateTimePicker(
                          context,
                          minTime: DateTime.now(),
                          onConfirm: (time) {
                            print(time);
                            setState(() {
                              selectedDateTime = time;
                            });
                          },
                        );
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          backgroundColor: Colors.grey[50]!.withOpacity(0.2),
                          minimumSize: const Size(double.infinity, 32),
                          padding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 12)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          selectedDateTime == null
                              ? "Set Date and Time"
                              : "$selectedDateTime",
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 16,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 36,
                  ),
                  AuthSubmitBtn(
                      onpressed: () => print('hi'), label: "Create Task")
                ],
              ))
            ],
          )),
    );
  }
}

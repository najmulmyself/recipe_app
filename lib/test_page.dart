import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:radio_button_form_field/radio_button_form_field.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class TestFormPage extends StatefulWidget {
  TestFormPage({Key? key}) : super(key: key);

  @override
  State<TestFormPage> createState() => _TestFormPageState();
}

class _TestFormPageState extends State<TestFormPage> {
  final formKey = GlobalKey<FormState>();

  bool? checkboxIconFormFieldValue = false;
  String myRadioValue = 'Dummy Value';
  String myCheckValue = '';
  List<Map> gadget = [
    {
      'value': 'Phone',
      'name': 'Phone',
    },
    {
      'value': 'Desktop',
      'name': 'Desktop',
    },
    {
      'value': 'Laptop',
      'name': 'Laptop',
    },
  ];
  List<Map> language = [
    {
      'value': 'Dart',
      'name': 'Dart',
    },
    {
      'value': 'Python',
      'name': 'Python',
    },
    {
      'value': 'Javascript',
      'name': 'Javascript',
    },
  ];
  String? select;

  void onChanged(dynamic val) => print(val.toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Radio(
              //     value: person.length,
              //     groupValue: select,
              //     onChanged: (value) {
              //       setState(() {
              //         select = value.toString();
              //       });
              //     })
              Text('Select A gadget'),
              RadioButtonFormField(
                toggleable: true,
                data: gadget,
                value: 'value',
                display: 'name',
                context: context,
                validator: (value) {
                  if (value.toString() == 'null') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please Select a value'),
                      ),
                    );
                    return null;
                  } else {
                    setState(() {
                      myRadioValue = value;
                      print(myRadioValue);
                    });
                  }
                  return null;
                },
              ),
              Text('Select A Language'),
              RadioButtonFormField(
                toggleable: true,
                data: language,
                value: 'value',
                display: 'name',
                context: context,
                validator: (value) {
                  if (value.toString() == 'null') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please Select a value'),
                      ),
                    );
                    return null;
                  } else {
                    setState(() {
                      myRadioValue = value;
                      print(myRadioValue);
                    });
                  }
                  return null;
                },
              ),
              // CheckboxListTileFormField(
              //   title: Text('Laptop!'),
              //   onSaved: (bool? value) {
              //     print('This is : $value');
              //   },
              //   validator: (bool? value) {
              //     if (value!) {
              //       return null;
              //     } else {
              //       return 'False!';
              //     }
              //   },
              //   onChanged: (value) {
              //     if (value) {
              //       print("ListTile Checked :)");
              //     } else {
              //       print("ListTile Not Checked :(");
              //     }
              //   },
              // ),
              // CheckboxListTileFormField(
              //   title: Text('Desktop!'),
              // ),
              // CheckboxListTileFormField(
              //   title: Text('Phone!'),
              // ),
              // CheckboxIconFormField(
              //   context: context,
              //   initialValue: checkboxIconFormFieldValue!,
              //   enabled: true,
              //   iconSize: 32,

              //   // onSaved: (bool? value) {
              //   //   checkboxIconFormFieldValue = value;
              //   // },
              //   // onChanged: (value) {
              //   //   if (value) {
              //   //     print("Icon Checked :)");
              //   //   } else {
              //   //     print("Icon Not Checked :(");
              //   //   }
              //   // },
              // ),

              // MultiSelectFormField(
              //   // autovalidate: AutovalidateMode.disabled,
              //   dataSource: gadget,
              //   textField: 'display',
              //   valueField: 'value',
              //   hintWidget: Text('Please choose one or more'),
              //   // initialValue: myCheckValue,
              // ),
              Text('Select A gadget'),
              FormBuilderCheckboxGroup(
                name: 'Gadget',
                orientation: OptionsOrientation.vertical,
                options: const [
                  FormBuilderFieldOption(value: 'Phone'),
                  FormBuilderFieldOption(value: 'Desktop'),
                  FormBuilderFieldOption(value: 'Laptop'),
                  FormBuilderFieldOption(value: 'Tablet'),
                ],
                wrapDirection: Axis.horizontal,
                // wrapVerticalDirection: VerticalDirection.down,
                onSaved: onChanged,
                validator: (value) {
                  if (value.toString() == 'null') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please Select a value'),
                      ),
                    );
                    return null;
                  } else {
                    myCheckValue = value.toString();
                    print(myCheckValue);
                  }
                },
              ),
              Text('Select A Language'),

              FormBuilderCheckboxGroup(
                name: 'Language',
                orientation: OptionsOrientation.vertical,
                options: const [
                  FormBuilderFieldOption(value: 'C'),
                  FormBuilderFieldOption(value: 'Go'),
                  FormBuilderFieldOption(value: 'Python'),
                  FormBuilderFieldOption(value: 'Java'),
                ],
                wrapDirection: Axis.horizontal,
                // wrapVerticalDirection: VerticalDirection.down,
                onSaved: onChanged,
                validator: (value) {
                  if (value.toString() == 'null') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please Select a value'),
                      ),
                    );
                    return null;
                  } else {
                    myCheckValue = value.toString();
                    print(myCheckValue);
                  }
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                  // print(myCheckValue);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

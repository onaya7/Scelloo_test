import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scelloo_test/componenets/custom_button.dart';
import 'package:scelloo_test/componenets/custom_inputfield_label.dart';
import 'package:scelloo_test/componenets/custom_scaffold.dart';
import 'package:scelloo_test/utils/helpers/helpers.dart';

import '../../../../componenets/custom_inputfield.dart';
import '../../../../utils/constants/color_constants.dart';
import '../../../../utils/validators/validators.dart';

class PostEditView extends StatefulWidget {
  const PostEditView({super.key});

  @override
  State<PostEditView> createState() => _PostEditViewState();
}

class _PostEditViewState extends State<PostEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _bodyFocus = FocusNode();
  late bool _formCompleted;

  @override
  void initState() {
    super.initState();
    _formCompleted = false;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
    _titleFocus.dispose();
    _bodyFocus.dispose();
  }

  Future<void> checkValidity() async {
    if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
      setState(() {
        _formCompleted = true;
      });
    } else {
      setState(() {
        _formCompleted = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        title: const Text('Edit Post'),
        centerTitle: true,
        foregroundColor: ColorConstants.white,
        backgroundColor: ColorConstants.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Helpers.popPage(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const CustomInputFieldLabel(
                      label: 'Title',
                    ),
                    const Gap(5),
                    CustomInputField(
                      controller: _titleController,
                      currentFocus: _titleFocus,
                      nextFocus: _bodyFocus,
                      hintText: 'Enter title',
                      action: TextInputAction.next,
                      validator: (value) => Validators.validateTitle(value),
                      onChanged: (value) => checkValidity(),
                    ),
                    const Gap(20),
                    const CustomInputFieldLabel(
                      label: 'Body',
                    ),
                    const Gap(5),
                    CustomInputField(
                      controller: _bodyController,
                      maxlines: 5,
                      currentFocus: _bodyFocus,
                      hintText: 'Enter body',
                      action: TextInputAction.done,
                      validator: (value) => Validators.validateBody(value),
                      onChanged: (value) => checkValidity(),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        text: 'Save',
                        textColor: ColorConstants.white,
                        backgroundColor: ColorConstants.primary,
                        onPressed: () => onSave(context)),
                  ),
                  const Gap(10),
                  Expanded(
                    child: CustomButton(
                      text: 'Cancel',
                      textColor: ColorConstants.white,
                      backgroundColor: ColorConstants.primary,
                      onPressed: () => Helpers.popPage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSave(BuildContext context) {}
}

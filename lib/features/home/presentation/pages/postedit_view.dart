import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:scelloo_test/componenets/custom_button.dart';
import 'package:scelloo_test/componenets/custom_inputfield_label.dart';
import 'package:scelloo_test/componenets/custom_scaffold.dart';
import 'package:scelloo_test/core/instance/logger.dart';
import 'package:scelloo_test/utils/helpers/helpers.dart';

import '../../../../componenets/custom_inputfield.dart';
import '../../../../utils/constants/color_constants.dart';
import '../../../../utils/validators/validators.dart';
import '../bloc/home_bloc.dart';

class PostEditView extends StatefulWidget {
  final Map<String, dynamic> args;

  const PostEditView({
    super.key,
    required this.args,
  });

  @override
  State<PostEditView> createState() => _PostEditViewState();
}

class _PostEditViewState extends State<PostEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _bodyFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.args['title']);
    _bodyController = TextEditingController(text: widget.args['body']);
    logger.i('id: ${widget.args['id']}');
    logger.i('userId: ${widget.args['userId']}');
    logger.i('title: ${_titleController.text}');
    logger.i('body: ${_bodyController.text}');
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
    _titleFocus.dispose();
    _bodyFocus.dispose();
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
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is PostFetchingLoadedState) {
            Helpers.showToast(context, 'success', 'Post updated successfully');
            Helpers.popPage();
          } else if (state is PostUpdateErrorState) {
            final postErrorState = state;
            Helpers.showToast(context, 'error', postErrorState.error);
          }
        },
        child: SingleChildScrollView(
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
                        onPressed: () => onSave(context),
                        isLoading: context.watch<HomeBloc>().state
                                is PostUpdateLoadingState
                            ? true
                            : false,
                      ),
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
      ),
    );
  }

  onSave(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<HomeBloc>().add(
            PostUpdateEvent(
              post: {
                'id': widget.args['id'],
                'userId': widget.args['userId'],
                'title': _titleController.text,
                'body': _bodyController.text,
              },
            ),
          );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:scelloo_test/componenets/custom_button.dart';
import 'package:scelloo_test/componenets/custom_inputfield_label.dart';
import 'package:scelloo_test/componenets/custom_scaffold.dart';
import 'package:scelloo_test/utils/helpers/helpers.dart';

import '../../../../componenets/custom_inputfield.dart';
import '../../../../utils/constants/color_constants.dart';
import '../../../../utils/validators/validators.dart';
import '../bloc/home_bloc.dart';

class PostCreateView extends StatefulWidget {
  const PostCreateView({super.key});

  @override
  State<PostCreateView> createState() => _PostCreateViewState();
}

class _PostCreateViewState extends State<PostCreateView> {
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
        title: const Text('Create Post'),
        centerTitle: true,
        foregroundColor: ColorConstants.white,
        backgroundColor: ColorConstants.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Helpers.popPage(),
        ),
      ),
      body: BlocListener<HomeBloc, HomeState>(
        bloc: context.read<HomeBloc>(),
        listener: (context, state) {
          if (state is PostCreateErrorState) {
            final postErrorState = state;
            Helpers.showToast(context, 'error', postErrorState.error);
          } else if (state is PostFetchingLoadedState) {
            Helpers.showToast(context, 'success', 'Post created successfully');
            Helpers.popPage();
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
                        hintText: 'Please give a descriptive title',
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
                        hintText: 'Give detailed body of the post .........',
                        action: TextInputAction.done,
                        validator: (value) => Validators.validateBody(value),
                        onChanged: (value) => checkValidity(),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                CustomButton(
                  text: 'Save',
                  textColor: ColorConstants.white,
                  backgroundColor: _formCompleted
                      ? ColorConstants.primary
                      : ColorConstants.neutral300,
                  onPressed: _formCompleted ? () => onContinue(context) : null,
                  isLoading:
                      context.watch<HomeBloc>().state is PostCreateLoadingState
                          ? true
                          : false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onContinue(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<HomeBloc>().add(PostCreateEvent(
            post: {
              'title': _titleController.text,
              'body': _bodyController.text,
              'userId': 8,
            },
          ));
    }
  }
}

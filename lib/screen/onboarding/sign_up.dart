import 'package:blott/screen/onboarding/signup_complete.dart';
import 'package:blott/utils/app_colors.dart';
import 'package:blott/utils/app_widgets/text_field.dart';
import 'package:blott/utils/constants.dart';
import 'package:blott/utils/injector.dart';
import 'package:blott/utils/navigation.dart';
import 'package:blott/utils/padded.dart';
import 'package:blott/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpScreen extends StatefulHookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var firstName = useTextEditingController();
    var lastName = useTextEditingController();
    var isActive = useState(false);
    return Scaffold(
      body: SafeArea(
        child: Padded(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                yMargin(10),
                Text(
                  'Your legal name',
                  style: kTextStyleCustom(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                yMargin(10),
                Text(
                  'We need to know a bit about you so that we can create your account.',
                  style: kTextStyleCustom(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF737373),
                  ),
                ),
                yMargin(24),
                BlottTextField(
                  controller: firstName,
                  hintText: 'First name',
                  onChange: (p0) {
                    if ((Validator.validateText(p0 ?? '', 'first name') ?? '')
                            .isEmpty &&
                        (Validator.validateText(lastName.text, 'last name') ??
                                '')
                            .isEmpty) {
                      isActive.value = true;
                    }
                  },
                  validator: (p0) => Validator.validateText(p0 ?? '', 'Name'),
                ),
                yMargin(24),
                BlottTextField(
                  controller: lastName,
                  hintText: 'Last name',
                  onChange: (p0) {
                    if ((Validator.validateText(p0, 'first name') ?? '')
                            .isEmpty &&
                        (Validator.validateText(firstName.text, 'first name') ??
                                '')
                            .isEmpty) {
                      isActive.value = true;
                    }
                  },
                  validator: (p0) => Validator.validateText(p0 ?? '', 'Name'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isActive.value) {
            if (formKey.currentState!.validate()) {
              injector.localStorage.storeString(
                key: kFirstName,
                data: firstName.text,
              );
              injector.localStorage.storeString(
                key: kLastName,
                data: lastName.text,
              );
              RouteNavigators.route(
                context,
                const SignUpComplete(),
              );
            }
          }
        },
        backgroundColor:
            isActive.value ? kPRYCOLOUR : kPRYCOLOUR.withOpacity(0.4),
        disabledElevation: 0,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ), // Ensures the button is circular
      ),
    );
  }
}

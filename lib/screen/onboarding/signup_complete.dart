import 'package:blott/screen/dashboard/dashboard.dart';
import 'package:blott/utils/app_colors.dart';
import 'package:blott/utils/app_widgets/blott_button.dart';
import 'package:blott/utils/constants.dart';
import 'package:blott/utils/dimension.dart';
import 'package:blott/utils/injector.dart';
import 'package:blott/utils/navigation.dart';
import 'package:blott/utils/padded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpComplete extends StatefulHookConsumerWidget {
  const SignUpComplete({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpCompleteState();
}

class _SignUpCompleteState extends ConsumerState<SignUpComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padded(
        child: Column(
          children: [
            yMargin(234),
            Center(
              child: SizedBox(
                height: getScreenHeight(98),
                width: getScreenWidth(98),
                child: Image.asset(
                  'assets/images/message-notif.png',
                ),
              ),
            ),
            yMargin(24),
            Text(
              'Get the most out of Blott ✅',
              style: kTextStyleCustom(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            yMargin(14),
            Text(
              'Allow notifications to stay in the loop with your payments, requests and groups.',
              textAlign: TextAlign.center,
              style: kTextStyleCustom(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF737373),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlottMainButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (contextPopUp) {
                          return CupertinoAlertDialog(
                            content: Column(
                              children: [
                                Text(
                                  '“Blott” Would Like to Send You Notifications',
                                  style: kTextStyleCustom(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                yMargin(2),
                                Text(
                                  'Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.',
                                  style: kTextStyleCustom(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text(
                                  'Don’t Allow',
                                  style: kTextStyleCustom(
                                    fontSize: 17,
                                    color: kPRYCOLOUR,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(contextPopUp);
                                  injector.localStorage.storeString(
                                    key: kNotificationStatus,
                                    data: 'notAllowed',
                                  );
                                  RouteNavigators.routeNoWayHome(
                                    context,
                                    const DashboardScreen(),
                                  );
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text(
                                  'Allow',
                                  style: kTextStyleCustom(
                                    fontSize: 17,
                                    color: kPRYCOLOUR,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(contextPopUp);
                                  injector.localStorage.storeString(
                                    key: kNotificationStatus,
                                    data: 'allowed',
                                  );
                                  RouteNavigators.routeNoWayHome(
                                    context,
                                    const DashboardScreen(),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    text: 'Continue',
                  )
                ],
              ),
            ),
            yMargin(50),
          ],
        ),
      ),
    );
  }
}

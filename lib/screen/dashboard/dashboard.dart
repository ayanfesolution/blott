import 'package:blott/utils/constants.dart';
import 'package:blott/utils/dimension.dart';
import 'package:blott/utils/injector.dart';
import 'package:blott/utils/padded.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DashboardScreen extends StatefulHookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  String firstName = '';

  @override
  void initState() {
    firstAction();

    super.initState();
  }

  firstAction() async {
    String yourFirstName =
        await injector.localStorage.returnString(key: kFirstName);
    setState(() {
      firstName = yourFirstName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            yMargin(66),
            Text(
              'Hey $firstName',
              style: GoogleFonts.raleway(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: getScreenWidth(32),
              ),
            ),
            yMargin(22),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 25,
                itemBuilder: (context, index) {
                  return const SingleNewWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleNewWidget extends StatelessWidget {
  const SingleNewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getScreenHeight(16),
      ),
      child: Row(
        children: [
          SizedBox(
            width: getScreenWidth(100),
            height: getScreenHeight(100),
            child: CachedNetworkImage(
              imageUrl:
                  'https://static2.finnhub.io/file/publicdatany/finnhubimage/market_watch_logo.png', // Replace with your image URL
              placeholder: (context, url) =>
                  const CircularProgressIndicator(), // Shows while loading
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error), // Shows on error
              fit: BoxFit.cover, // Adjust image fit
            ),
          ),
          xMargin(
            16,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'The Economic Times',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: getScreenWidth(12),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    xMargin(10),
                    SizedBox(
                      width: getScreenWidth(80),
                      child: Text(
                        convertTimestamp(24887689000),
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: getScreenWidth(12),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                yMargin(8),
                Text(
                  'Markets FTSE slides almost 2pc as sterling sinks to \$1.38',
                  style: kTextStyleCustom(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

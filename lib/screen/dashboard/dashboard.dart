import 'package:blott/model/new_response_model.dart';
import 'package:blott/provider/news_provider.dart';
import 'package:blott/screen/dashboard/new_page.dart';
import 'package:blott/utils/constants.dart';
import 'package:blott/utils/dimension.dart';
import 'package:blott/utils/injector.dart';
import 'package:blott/utils/navigation.dart';
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
  bool networkFailed = false;
  bool isLoading = false;

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
      isLoading = ref.read(newsProvider).isEmpty;
    });

    bool result =
        await ref.read(newsProvider.notifier).getTheListOfAvailableNews();

    if (!result) {
      setState(() {
        networkFailed = true;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<NewsResponseModel> newsList = ref.watch(newsProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(newsProvider.notifier).getTheListOfAvailableNews(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              yMargin(50),
              Text(
                'Hey $firstName',
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: getScreenWidth(32),
                ),
              ),
              yMargin(22),
              networkFailed
                  ? Text(
                      'Something went wrong. Please try again later.',
                      style: kTextStyleCustom(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )
                  : Expanded(
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: newsList.length,
                              itemBuilder: (context, index) {
                                return SingleNewWidget(
                                  newsResponseModel: newsList[index],
                                );
                              },
                            ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleNewWidget extends StatelessWidget {
  const SingleNewWidget({
    super.key,
    required this.newsResponseModel,
  });
  final NewsResponseModel newsResponseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getScreenHeight(16),
      ),
      child: InkWell(
        onTap: () {
          RouteNavigators.route(
            context,
            NewsPage(pageUrl: newsResponseModel.url ?? ''),
          );
        },
        child: Row(
          children: [
            SizedBox(
              width: getScreenWidth(100),
              height: getScreenHeight(100),
              child: CachedNetworkImage(
                imageUrl: newsResponseModel.image ?? '',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(), // Shows while loading
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error), // Shows on error
                fit: BoxFit.contain, // Adjust image fit
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
                          newsResponseModel.source ?? '',
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
                          convertTimestamp(newsResponseModel.datetime ?? 0),
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
                    newsResponseModel.headline ?? '',
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
      ),
    );
  }
}

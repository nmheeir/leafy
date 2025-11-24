import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/router/routes.dart';
import 'package:leafy/ui/welcome/widgets/index.dart';
import 'package:leafy/ui/welcome/widgets/welcome_page_choices.dart';
import 'package:leafy/ui/welcome/widgets/welcome_page_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _pageController = PageController();

  void _moveToHomeScreen() {
    context.go(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Text(
                      LocaleKeys.welcome_1.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  WelcomePageText(
                    descriptions: [
                      LocaleKeys.welcome_1_description_1.tr(),
                      LocaleKeys.welcome_1_description_2.tr(),
                    ],
                    image: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: context.colorScheme.primaryContainer.withAlpha(
                          15,
                        ),
                      ),
                      child: Image.asset(
                        'assets/icons/icon_cropped.png',
                        width: context.deviceSize.width * 0.25,
                        height: context.deviceSize.height * 0.25,
                      ),
                    ),
                  ),
                  WelcomePageText(
                    descriptions: [
                      LocaleKeys.welcome_2_description_1.tr(),
                      LocaleKeys.welcome_2_description_2.tr(),
                    ],
                    image: Icon(
                      Icons.bar_chart,
                      size: 60,
                      color: context.colorScheme.primaryContainer,
                    ),
                  ),
                  WelcomePageText(
                    descriptions: [
                      LocaleKeys.welcome_3_description_1.tr(),
                      LocaleKeys.welcome_3_description_2.tr(),
                      LocaleKeys.welcome_3_description_3.tr(),
                    ],
                    image: Icon(
                      Icons.code,
                      size: 60,
                      color: context.colorScheme.primaryContainer,
                    ),
                  ),

                  WelcomePageChoices(
                    restoreBackup: () {},
                    importOpenreadsCsv: () {},
                    importGoodreadsCsv: () {},
                    importBookwyrmCsv: () {},
                    skipImportingBooks: _moveToHomeScreen,
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: ExpandingDotsEffect(
                activeDotColor: context.colorScheme.primaryContainer,
                dotColor: context.colorScheme.surfaceContainer,
                dotHeight: 12,
                dotWidth: 12,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            ),
            const SizedBox(height: 20),
            SizedBox(height: context.padding.bottom),
          ],
        ),
      ),
    );
  }
}

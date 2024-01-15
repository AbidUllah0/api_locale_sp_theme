import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Domain/theme_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/homeview.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/home_data_get_from_api_consumer.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/language_drop_down.dart';
import 'package:simple_flutter_project/Utils/app_router_constants.dart';
import 'package:simple_flutter_project/Utils/utils.dart';
import '../HomeNew/home_data_get_from_api_selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Color color = Utils(context).getColor;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// this is abid drop down for language localization
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  AppLocalizations.of(context)!.selectLanguage,
                  style: TextStyle(color: color),
                ),
                const LanguageDropDown(),
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              ),
              child: Text(AppLocalizations.of(context)!.counterText),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeAPIConsumer()),
              ),
              child: Text(AppLocalizations.of(context)!.consumerText),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeAPISelector()),
              ),
              child: Text(AppLocalizations.of(context)!.selectorText),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                context
                    .pushNamed(AppRouterConstants.navigationDrawerMainScreen);
              },
              child: Text(
                'Go to New Code',
                style: TextStyle(color: color),
              ),
            ),
            SwitchListTile(
                title: Text(
                  themeProvider.getDarkTheme ? 'Dark' : 'Light',
                ),
                secondary: Icon(
                  themeProvider.getDarkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                value: themeProvider.getDarkTheme,
                onChanged: (bool value) {
                  setState(() {
                    themeProvider.setDarkTheme = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

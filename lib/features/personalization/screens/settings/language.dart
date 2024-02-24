import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = '';
  }

  void selectLanguage(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PAppBar(showBackArrow: true, backArrowColor: dark ? Colors.white : Colors.black,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose language',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Text(
                'Select the Language That Best Suits Your Preferences',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Column(
                children: [
                  _buildLanguageRow(['English', 'Hindi']),
                  const SizedBox(height: TSizes.gridViewSpacing),
                  _buildLanguageRow(['Spanish', 'German']),
                  const SizedBox(height: TSizes.gridViewSpacing),
                  _buildLanguageRow(['French', 'Russian']),
                  const SizedBox(height: TSizes.gridViewSpacing),
                  _buildLanguageRow(['Portuguese', 'Arabic']),
                  const SizedBox(height: TSizes.gridViewSpacing),
                  _buildLanguageRow(['Korean', 'Japanese']),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace, vertical: TSizes.md),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Continue'),
        ),
      ),
    );
  }

  Widget _buildLanguageRow(List<String> languages) {
    return Row(
      children: languages
          .map(
            (language) => Expanded(
          child: GestureDetector(
            onTap: () {
              selectLanguage(language);
            },
            child: PLanguageTile(
              language: language,
              isSelected: selectedLanguage == language,
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}

class PLanguageTile extends StatelessWidget {
  const PLanguageTile({
    super.key,
    required this.language,
    required this.isSelected,
  });

  final String language;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return PRoundedContainer(
      height: 56,
      padding: const EdgeInsets.only(left: TSizes.md),
      showBorder: true,
      borderColor: isSelected ? TColors.rani : TColors.dimgrey,
      backgroundColor: isSelected ? TColors.rani.withOpacity(0.2) : Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            language,
            style: Theme.of(context).textTheme.titleLarge!.apply(
              color: isSelected ? TColors.rani : (dark ? Colors.white : Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
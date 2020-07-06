import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mntd_mobile/models/secret_model.dart';
import 'package:mntd_mobile/providers/SecretCardProvider.dart';
import 'package:mntd_mobile/screens/Secret/components/secret_card.dart';
import 'package:mntd_mobile/utils/constants.dart';
import 'package:provider/provider.dart';

class SecretCardsCarousel extends StatefulWidget {
  final bool darkMode;

  SecretCardsCarousel({
    Key key,
    this.darkMode,
  }) : super(key: key);

  @override
  _SecretCardsCarouselState createState() => _SecretCardsCarouselState();
}

class _SecretCardsCarouselState extends State<SecretCardsCarousel> {
  PageController _pageController;

  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Secret> secrets =
        Provider.of<SecretCardProvider>(context).secretsCards;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                initialPage = value;
              });
            },
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            itemCount: secrets.length,
            itemBuilder: (context, index) =>
                buildSecretCardSlide(secrets, index, widget.darkMode)),
      ),
    );
  }

  Widget buildSecretCardSlide(List<Secret> secrets, int index, bool darkMode) =>
      AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double value = 0;
            if (_pageController.position.haveDimensions) {
              value = index - _pageController.page;
              value = (value * 0.038).clamp(-1, 1);
            }
            return AnimatedOpacity(
              duration: Duration(microseconds: 350),
              opacity: initialPage == index ? 1 : 0.4,
              child: Transform.rotate(
                angle: pi * value,
                child: SecretCard(
                  secret: secrets[index],
                  darkMode: darkMode,
                ),
              ),
            );
          });
}

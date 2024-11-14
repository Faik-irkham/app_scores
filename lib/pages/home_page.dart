import 'package:app_scores/constant/theme.dart';
import 'package:app_scores/models/football_news_model.dart';
import 'package:app_scores/models/schedule_match_model.dart';
import 'package:app_scores/models/today_match_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: buildCustomAppBar(),
            ),
          ),
          const SizedBox(height: 15),
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: buildCardBannerScores(context),
            ),
          ),
          const SizedBox(height: 25),
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: buildMatchSchedule(),
            ),
          ),
          const SizedBox(height: 25),
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: buildFootballNews(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCustomAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/ic/category.png'),
          ),
          Image.asset('assets/logo.png'),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/ic/notification.png'),
              ),
              Positioned(
                top: 12,
                right: 16,
                child: Container(
                  height: 9,
                  width: 9,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: backgroundColor,
                      width: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCardBannerScores(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: listMatches
              .asMap()
              .map((index, match) {
                return MapEntry(
                  index,
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(right: 15),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: index == 1 ? secondaryColor : backgroundColor,
                      gradient: index != 1
                          ? const LinearGradient(
                              colors: [
                                Color(0XFF4568DC),
                                Color(0XFFB06AB3),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.2, 1],
                            )
                          : null,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${match.ballPositionTeam1} : ${match.ballPositionTeam2}',
                          style: whiteTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  match.flag1,
                                  height: 50,
                                ),
                              ],
                            ),
                            Text(
                              '${match.team1Score} - ${match.team2Score}',
                              style: whiteTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: bold,
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  match.flag2,
                                  height: 50,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: match.team1Goals!
                                  .map(
                                    (goal) => Text(
                                      goal,
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: medium,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            Column(
                              children: match.team2Goals!
                                  .map(
                                    (goal) => Text(
                                      goal,
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: medium,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })
              .values
              .toList(),
        ),
      ),
    );
  }

  Widget buildMatchSchedule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Match Schedule',
                style: whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                'See All',
                style: thirdTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...scheduleMatches.map((match) {
            return Container(
              margin: const EdgeInsets.only(bottom: 11),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        match.team1,
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        match.flag1,
                        height: 35,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        match.date,
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        match.time,
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        match.team2,
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        match.flag2,
                        height: 35,
                      ),
                    ],
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  Widget buildFootballNews() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Football News',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                'See All',
                style: thirdTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...newsList.map((news) {
            return Container(
              margin: const EdgeInsets.only(bottom: 11),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(news.urlToImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.title,
                          style: whiteTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

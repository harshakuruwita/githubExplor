import 'dart:math';

import 'package:flutter/material.dart';
import 'package:github_explore/model/color_constant.dart';
import 'package:github_explore/model/github_model.dart';
import 'package:github_explore/providers/github_provider.dart';
import 'package:github_explore/repositories/repository.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController? controller;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void lazyLoad() async {
    setState(() {
      isLoading = true;
    });
    var provider = Provider.of<GithubProvider>(context, listen: false);
    List<dynamic> repositoryList = await Repositery()
        .getUserRepository(page: provider.pageCount, per_page: 8);

    provider.setRepositoryList(repositoryList);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GithubProvider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.menu,
                        color: Colors.grey,
                        size: 28,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          'Explore',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: isLoading
                        ? const LoadingIndicator(
                            indicatorType: Indicator.ballScale,
                            colors: [Colors.black],
                          )
                        : const SizedBox(),
                  )
                ],
              ),
            ),
            Expanded(
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (notification) {
                  final before = notification.metrics.extentBefore;
                  final max = notification.metrics.maxScrollExtent;
                  if (before == max) {
                    lazyLoad();
                  }
                  return true;
                },
                child: ListView.builder(
                    itemCount: provider.repositoryList.length,
                    itemBuilder: (context, index) {
                      GithubModel githubModel =
                          GithubModel.fromJson(provider.repositoryList[index]);

                      // print(githubModel.id.toString());
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 8, top: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 26,
                                  backgroundColor: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  child: Text(
                                      (githubModel.name ?? 'Not Avialble')
                                          .substring(0, 2)
                                          .toUpperCase()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        githubModel.name ?? 'Not Avialable',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            letterSpacing: 1.4,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: SizedBox(
                                          width: 290,
                                          child: Text(
                                            githubModel.description ??
                                                'Not Avialable',
                                            style:
                                                const TextStyle(fontSize: 12),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                      Chip(
                                        label: Text(
                                          githubModel.language ??
                                              'Not avialable',
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app_using_getx/app/data/network/rest_api_base_domain.dart';
import 'package:app_using_getx/app/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServerErrorHandling extends StatelessWidget {
  final BaseDomain domain;

  const ServerErrorHandling(this.domain, {super.key});

  @override
  Widget build(BuildContext context) {
    if (domain is Loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (domain is NetworkError) {
      return Center(
        child: Text(
          networkErrorMsg.tr,
          style: context.textTheme.titleMedium,
        ),
      );
    } else if (domain is ServerError) {
      return Center(
        child: Text(
          serverErrorMsg.tr,
          style: context.textTheme.titleMedium,
        ),
      );
    } else {
      return Center(
        child: Text(
          serverErrorMsg.tr,
          style: context.textTheme.titleMedium,
        ),
      );
    }
  }
}

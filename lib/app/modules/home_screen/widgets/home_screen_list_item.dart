import 'package:app_using_getx/app/data/models/user_profile_entity.dart';
import 'package:app_using_getx/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:app_using_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenListItem extends StatefulWidget {
  final UserProfileData user;
  final int index;

  const HomeScreenListItem({super.key, required this.user, required this.index});

  @override
  State<HomeScreenListItem> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreenListItem> {
  bool _isReached = false;
  DismissDirection _dismissDirection = DismissDirection.none;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = _isReached
        ? Theme.of(context).colorScheme.error.withOpacity(0.5)
        : Colors.green.withOpacity(0.5);
    return Dismissible(
      key: ValueKey(widget.user.id),
      onDismissed: (dir) => Get.find<HomeScreenController>().removeItem(widget.user),
      onUpdate: (detail) => {
        setState(() {
          _dismissDirection = detail.direction;
          _isReached = detail.reached;
        })
      },
      background: Container(
        alignment: (_dismissDirection == DismissDirection.startToEnd
            ? Alignment.centerLeft
            : Alignment.centerRight),
        margin: Theme.of(context).cardTheme.margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Icon(
              _isReached ? Icons.delete_outline : Icons.save_alt_outlined,
              key: ValueKey(_isReached),
            ),
          ),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.onPrimaryContainer),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Get.toNamed(Routes.homeDetailScreen, arguments: [
              {"index": widget.index}
            ]);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.firstName ?? "",
                        style: context.textTheme.titleLarge,
                      ),
                      Text(
                        widget.user.lastName ?? "",
                        style: context.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: widget.user.id ?? "",
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    radius: 40,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 38,
                          backgroundImage: NetworkImage(widget.user.avatar ?? ""),
                          backgroundColor: Colors.transparent,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 3,
                          child: Icon(
                            widget.user.isFavorite ? Icons.star : Icons.star_outline,
                            size: 28,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

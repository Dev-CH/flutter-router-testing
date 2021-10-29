import 'package:flutter/material.dart';

/// Reusable Widget to display a navigation bar at the bottom of the screen.
///
/// {@category Widgets}
class NavigationBar extends StatelessWidget {
  final String activeRoute;

  const NavigationBar({
    Key? key,
    this.activeRoute = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.lightGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _NavigationBarButton(
            label: 'Home',
            icon: Icons.home,
            onPressed: () {
              // navigateTo(context, '/');
            },
            notifications: 0,
          ),
          _NavigationBarButton(
            label: 'Explore',
            icon: Icons.explore,
            onPressed: () {
              // navigateTo(context, '/explore');
            },
          ),
        ],
      ),
    );
  }
}

class _NavigationBarButton extends StatelessWidget {
  /// The icon to display in the button.
  final IconData icon;

  /// Whether to show an active state on the button.
  final bool isActive;

  /// Toggle the larger size of a navigation button.
  final bool isLarge;

  /// A label for accessibility.
  final String label;

  /// How many notifications to show on the button. 0 will hide the bubble.
  final int notifications;

  /// Action to perform when the button is tapped/pressed.
  final VoidCallback? onPressed;

  const _NavigationBarButton({
    this.icon = Icons.home_outlined,
    this.isActive = false,
    this.isLarge = false,
    this.label = '',
    this.notifications = 0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 26),
        height: 56,
        width: 56,
        padding: const EdgeInsets.only(top: 10),
        clipBehavior: Clip.none,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: isLarge ? -16 : 0,
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: isLarge ? 56 : 24,
                        width: isLarge ? 56 : 24,
                        decoration: isLarge ? BoxDecoration(
                          borderRadius: BorderRadius.circular(56),
                        ) : null,
                        child: Icon(
                          icon,
                          size: 24,
                          color: isLarge ? Theme.of(context).backgroundColor : null,
                          semanticLabel: label,
                        ),
                      ),
                      Positioned(
                        top: -5,
                        right: -16,
                        child: notifications > 0 ? Container(
                          height: 18,
                          width: 18,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              notifications.toString(), // 9/14
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 9,
                                height: 1.6,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ) : Container(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                    width: 6,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          child: isActive ? Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(18)),
                              color: Theme.of(context).primaryColor,
                            ),
                          ) : Container(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

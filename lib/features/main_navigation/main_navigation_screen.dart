import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_android/constants/gaps.dart';
import 'package:tiktok_clone_android/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone_android/features/main_navigation/widgets/post_video.button.dart';
import 'package:tiktok_clone_android/features/videos/vudei_timline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndexInt = 0;

  void _onTap(int indexInt) {
    setState(() {
      _selectedIndexInt = indexInt;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Container(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndexInt != 0,
            child: const VideoTimeLineScreen(),
          ),
          Offstage(
            offstage: _selectedIndexInt != 1,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndexInt != 3,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndexInt != 4,
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                textStr: 'Home',
                isSelected: _selectedIndexInt == 0,
                deselectIcon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                textStr: 'Discover',
                isSelected: _selectedIndexInt == 1,
                deselectIcon: FontAwesomeIcons.magnifyingGlass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                textStr: 'Inbox',
                isSelected: _selectedIndexInt == 3,
                deselectIcon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                onTap: () => _onTap(3),
              ),
              NavTab(
                textStr: 'Profile',
                isSelected: _selectedIndexInt == 4,
                deselectIcon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

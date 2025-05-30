import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ilearn/features/home/presentation/widgets/groups_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Static data for the home screen
  final Map<String, dynamic> _staticData = {
    'statistics': {
      'totalBooks': 42,
      'completed': 15,
      'inProgress': 10,
      'notStarted': 17,
    },
    'groups': [
      {'name': 'Mathematics', 'progress': 0.65},
      {'name': 'Science', 'progress': 0.42},
      {'name': 'Literature', 'progress': 0.78},
    ],
    'folders': [
      {'name': 'Study Materials', 'count': 8},
      {'name': 'Research Papers', 'count': 12},
      {'name': 'Personal Notes', 'count': 5},
    ],
    'books': [
      {'title': 'Advanced Calculus', 'author': 'James Stewart'},
      {'title': 'Molecular Biology', 'author': 'Robert Weaver'},
      {'title': 'Modern Poetry', 'author': 'Helen Vendler'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75.h,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: MediaQuery.of(context).size.height * 0.10.h,
            ),
            child: Column(
              children: [
                // Statistics Section
                StatisticsSlide(
                  data: _staticData['statistics'],
                ),

                // Groups Section
                const ActiveGroups(),

                // Folders Section
                FolderSlide(
                  folders: _staticData['folders'],
                ),

                const SizedBox(height: 15),

                // Books Section
                BookSlide(
                  books: _staticData['books'],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
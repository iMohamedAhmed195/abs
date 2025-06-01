

import 'package:new_ilearn/features/folders/presentation/widgets/folders_grid.dart';
import 'package:new_ilearn/features/folders/presentation/widgets/folders_header.dart';

import '../../../exports.dart';

class FoldersScreen extends StatefulWidget {
  const FoldersScreen({super.key});

  @override
  State<FoldersScreen> createState() => _FoldersScreenState();
}

class _FoldersScreenState extends State<FoldersScreen> {
  final ScrollController _scrollController = ScrollController();
  double shrinkPercent = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      if (maxScroll > 0) {
        setState(() {
          shrinkPercent = (currentScroll / (maxScroll * 0.2)).clamp(0.0, 1.0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        children: [
          FoldersHeader(shrinkPercent: shrinkPercent),

          Flexible(
            child: ListView(shrinkWrap: true,
              controller: _scrollController,
              children: [
                10.vs,

                  FoldersGrid( ), // يمكنك استبداله بـ EmptyFoldersView()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

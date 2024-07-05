import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/features/common/model/thread_model.dart';
import 'package:tread_clone_assignment/features/common/view/widgets/custom_animated_tab_bar.dart';
import 'package:tread_clone_assignment/features/common/view/widgets/default_padding.dart';
import 'package:tread_clone_assignment/features/common/view/widgets/pinned_delegate.dart';
import 'package:tread_clone_assignment/features/main_home/view/widgets/cards/thread.dart';
import 'package:tread_clone_assignment/features/search/view/widgets/animated_cupertino_search_textfield.dart';
import 'package:tread_clone_assignment/features/search/vm/search_vm.dart';

class SearchThreadScreen extends ConsumerStatefulWidget {
  final String initialText;
  final List<ThreadModel> results;
  const SearchThreadScreen({
    super.key,
    required this.initialText,
    required this.results,
  });

  @override
  SearchThreadScreenState createState() => SearchThreadScreenState();
}

class SearchThreadScreenState extends ConsumerState<SearchThreadScreen>
    with TickerProviderStateMixin {
  late TextEditingController _textEditingController;
  late TabController _tabController;
  late FocusNode _focusNode;
  late List<ThreadModel> _searchResults;

  final GlobalKey pinKey = GlobalKey();
  final List<String> _options = [
    'Popular',
    'Recent',
    'Profile',
  ];

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initialText);
    _tabController = TabController(length: _options.length, vsync: this);
    _focusNode = FocusNode();
    _searchResults = widget.results;
    _textEditingController.addListener(
      () => _performSearch(
        _textEditingController.text,
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _performSearch(String query) async {
    if (query == '') return;
    final results = await ref.read(searchProvider.notifier).searchThread(query);
    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: DefaultTabController(
          length: _options.length,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: PinnedBar(
                    ref: ref,
                    height: 100,
                    isTabBar: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gaps.v10,
                        DefaultPadding(
                          child: CustomCupertinoSearchTextField(
                            focusNode: _focusNode,
                            textEditingController: _textEditingController,
                          ),
                        ),
                        Gaps.v10,
                        CustomAnimatedTabBar(
                          ref: ref,
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size8,
                          ),
                          tabController: _tabController,
                          options: _options,
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: _searchResults.isEmpty
                ? const Center(
                    child: Text(
                      'There is no such thread ㅠㅠ',
                    ),
                  )
                : TabBarView(
                    controller: _tabController,
                    children: _options.map((option) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          height: 30,
                          color: Theme.of(context).dividerColor.withOpacity(
                                0.5,
                              ),
                        ),
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final threadData = _searchResults[index];
                          return Thread(index: index, threadData: threadData);
                        },
                      );
                    }).toList(),
                  ),
          ),
        ),
      ),
    );
  }
}

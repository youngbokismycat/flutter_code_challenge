import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/features/common/widgets/default_padding.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/features/search/widgets/animated_cupertino_search_textfield.dart';
import 'package:tread_clone_assignment/features/search/widgets/list_tile_profile.dart';
import 'package:tread_clone_assignment/features/common/widgets/pinned_delegate.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();
  bool _isFocused = false;

  void _onFocused() async {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
    await Future.delayed(
      const Duration(milliseconds: 50),
    );
    if (_isFocused) {
      if (_scrollController.offset < 60.0) {
        _scrollController.animateTo(
          _scrollController.offset + 55,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    } else {
      if (_scrollController.offset < 60.0) {
        _scrollController.animateTo(
          _scrollController.offset - 55,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocused);
    _textEditingController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocused);
    _focusNode.dispose();
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  bool _isSearchImpossible() {
    if (_isFocused == false) {
      if (_textEditingController.text.isEmpty) {
        return true;
      }
    } else if (_textEditingController.text.isNotEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                systemNavigationBarContrastEnforced: false,
                systemStatusBarContrastEnforced: false,
              ),
              centerTitle: false,
              surfaceTintColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                stretchModes: const [
                  StretchMode.fadeTitle,
                ],
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _isFocused ? 0 : 1,
                  child: const DefaultPadding(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Search",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: PinnedBar(
                ref: ref,
                isTabBar: false,
                child: CustomCupertinoSearchTextField(
                  textEditingController: _textEditingController,
                  focusNode: _focusNode,
                ),
              ),
            ),
          ];
        },
        body: Stack(
          children: [
            Positioned(
              child: Opacity(
                opacity: 0.6,
                child: DefaultPadding(
                  child: Offstage(
                    offstage: _isSearchImpossible(),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size7,
                      ),
                      leading: const FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: Sizes.size18,
                        color: Colors.grey,
                      ),
                      title: Text(
                        "Search for '${_textEditingController.text}'",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: const FaIcon(
                        FontAwesomeIcons.chevronRight,
                        color: Colors.grey,
                        size: Sizes.size20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isFocused ? 0 : 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: Sizes.size24,
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 100,
                  separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).dividerColor.withOpacity(
                          0.5,
                        ),
                  ),
                  itemBuilder: (context, index) => const ListTileProfile(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

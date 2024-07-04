import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tread_clone_assignment/core/consts/informations.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/main_home/view/widgets/cards/thread.dart';
import 'package:tread_clone_assignment/features/main_home/view_model/thread_timeline_vm.dart';

class MainHomeScreen extends ConsumerWidget {
  const MainHomeScreen({super.key});

  Future<void> _onRefresh(
    WidgetRef ref,
  ) {
    return ref.watch(timelineProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final threadList = ref.watch(timelineProvider);

    return RefreshIndicator(
      onRefresh: () async => _onRefresh(ref),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarContrastEnforced: false,
              systemStatusBarContrastEnforced: false,
            ),
            surfaceTintColor: Colors.white,
            centerTitle: true,
            title: Align(
              child: SvgPicture.asset(
                Informations.threadsLogoPath,
                width: 40,
                height: 40,
                color: isDarkMode(ref) ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
        body: threadList.when(
          data: (threads) => threads.isEmpty
              ? const Center(
                  child: Text(
                    'There is no thread ㅠㅠ',
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () async => _onRefresh(ref),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      height: 30,
                      color: Theme.of(context).dividerColor.withOpacity(
                            0.5,
                          ),
                    ),
                    itemCount: threads.length,
                    itemBuilder: (context, index) {
                      final threadData = threads[index];

                      return Thread(
                        index: index,
                        threadData: threadData,
                      );
                    },
                  ),
                ),
          error: (error, stack) => Center(child: Text('Error: $error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

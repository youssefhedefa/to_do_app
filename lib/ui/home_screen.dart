import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/helper/color_helper.dart';
import 'package:to_do_app/helper/text_style_helper.dart';
import 'package:to_do_app/providers/add_note_provider.dart';
import 'package:to_do_app/providers/get_notes_provider.dart';
import 'package:to_do_app/repo/note_repo.dart';
import 'package:to_do_app/ui/widgets/custom_bottom_sheet.dart';
import 'package:to_do_app/ui/widgets/note_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
     await context.read<GetNotesProvider>().getNotes();
     setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Notes',
          style: AppTextStyleHelper.font32WhiteBold,
        ),
        backgroundColor: AppColorHelper.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildFAB(),
      body: Consumer<GetNotesProvider>(
        builder: (context, provider, child) {
          print(context.watch<GetNotesProvider>().notes);
          if (provider.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (provider.error.isNotEmpty) {
            return Center(
              child: Text(
                provider.error,
                style: AppTextStyleHelper.font28WhiteBold,
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => NoteItem(
              note: context.watch<GetNotesProvider>().notes[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
            itemCount: context.watch<GetNotesProvider>().notes.length,
          );
        },
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => NoteItem(
            note: context.watch<GetNotesProvider>().notes[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 12,
          ),
          itemCount: context.watch<GetNotesProvider>().notes.length,
        ),
      ),
    );
  }

  Widget buildFAB() {
    return Builder(
      builder: (newContext) {
        return FloatingActionButton(
          onPressed: () {
            showBottomSheet(
              context: newContext,
              builder: (context) {
                return MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (context) => AddNoteProvider(
                        repo: NoteRepo(),
                      ),
                    ),
                    ChangeNotifierProvider(
                      create: (context) => GetNotesProvider(
                        repo: NoteRepo(),
                      ),
                    ),
                  ],
                  child: const CustomBottomSheet(),
                );
              },
            );
          },
          backgroundColor: AppColorHelper.greenColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        );
      },
    );
  }
}

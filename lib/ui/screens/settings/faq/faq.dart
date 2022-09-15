import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/ui/screens/components/loading.dart';
import 'package:login/ui/screens/settings/faq/faq_cubit.dart';
import 'package:login/ui/screens/settings/faq/faq_state.dart';
import 'package:simple_html_css/simple_html_css.dart';

class FaQ extends StatelessWidget {
  const FaQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        centerTitle: true,
        title: const Text('FAQ',
            style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),

      body: Scaffold(
        body: BlocConsumer<FaqCubit, FaqState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            FaqCubit faqCubit = FaqCubit();
            return (state is FaqGotData && faqCubit.faqModel != null)? Row(
              children: [
                Container(
                  child: HTML.toRichText(context, faqCubit.faqModel!.data!.first.question!),
                )
              ],
            ):loading(context);
          },
        ),
      ),
    );
  }
}

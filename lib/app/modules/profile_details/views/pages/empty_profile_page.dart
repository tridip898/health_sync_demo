import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class EmptyProfilePage extends StatelessWidget {
  const EmptyProfilePage({super.key});

  static const Color primary = Color(0xFF13ECA4);
  static const Color primaryDark = Color(0xFF0BB57D);
  static const Color background = Color(0xFFF6F8F7);
  static const Color textMain = Color(0xFF0D1B17);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: padAll24,
        child: Center(
          child: Column(
            children: [
              Text("Your profile is empty", style: textStyle.semiBold.s24),
              gapH8,
              Padding(
                padding: padSym(horizontal: 48),
                child: Text(
                  "It loos like you haven't set up your profile yet. Create one to manage your medical history, appointments and doctors easily.",
                  style: textStyle.regular.s14.copyWith(color: Colors.black38),
                  textAlign: TextAlign.center,
                ),
              ),
              gapH(48),
              Container(
                padding: padAll20,
                decoration: _cardDecoration(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: .1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: padAll8,
                          child: Icon(Icons.history, color: Colors.green),
                        ),
                        gapW12,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Medical History",
                                style: textStyle.semiBold.s16,
                              ),
                              Text(
                                "Track your health records",
                                style: textStyle.regular.s14.copyWith(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: .5,
                      color: Colors.grey.withValues(alpha: .2),
                      height: 40,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withValues(alpha: .1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: padAll8,
                          child: Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.blueAccent,
                          ),
                        ),
                        gapW12,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Appointments",
                                style: textStyle.semiBold.s16,
                              ),
                              Text(
                                "Manage upcoming visits",
                                style: textStyle.regular.s14.copyWith(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.grey.shade200),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withValues(alpha: .1),
        blurRadius: 6,
        offset: Offset(0, 2),
      ),
    ],
  );
}

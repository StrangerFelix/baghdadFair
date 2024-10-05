import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/presentation/views/components/aboutUsContext.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SectionTitle(title: S.of(context).fair_history,),
        const AboutUsContext(
          description: 'ان اول معرض اقيم في بغداد كان عام 1957 في الموقع الحالي مر انذاك للمعرض الذي كان يسمى المعرض الصناعي والزراعي وعرضت فيه العديد من المنتجات الوطنية وفي عام 1964 انعقدت الدورة الاولى لمعرض بغداد الدولي وكانت المشاركة مقتصرة على خمس دول فقط ليصبح اسمه رسميا معرض بغداد الدولي وتواصلت مسيرة انعقاد المعارض الدولية بتطور المعروضات وعدد المشاركين في عام 1971 انضم المعرض الى عضوية اتحاد المعارض الدولية UFI ومقره باريس وفي عام 1997 انضم الى الاتحاد العربي للمعارض والمؤتمرات الدولية.',
        )
      ],
    );
  }
}
part of core.styles;

extension TypographyContext on BuildContext {
  /// Returns same as Theme.of(context).textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns headline1 >> fontSize: 93
  TextStyle? get h1 => textTheme.headline1?.copyWith(fontFamily: 'Poppins');

  /// Returns headline2 >> fontSize: 58
  TextStyle? get h2 => textTheme.headline2?.copyWith(fontFamily: 'Poppins');

  /// Returns headline3 >> fontSize: 46
  TextStyle? get h3 => textTheme.headline3?.copyWith(fontFamily: 'Poppins');

  /// Returns headline4 >> fontSize: 33
  TextStyle? get h4 => textTheme.headline4?.copyWith(fontFamily: 'Poppins');

  /// Returns headline5 >> fontSize: 23
  TextStyle? get h5 => textTheme.headline5?.copyWith(fontFamily: 'Poppins');

  /// Returns headline6 >> fontSize: 19
  TextStyle? get h6 =>
      textTheme.headline6?.copyWith(fontFamily: 'Poppins', fontSize: 18);

  /// Returns subtitle1 >> fontSize: 15
  TextStyle? get subH1 => textTheme.subtitle1;

  /// Returns subtitle2 >> fontSize: 13
  TextStyle? get subH2 => textTheme.subtitle2;

  /// Returns body1 >> fontSize: 16
  TextStyle? get p1 => textTheme.bodyText1;

  /// Returns body2 >> fontSize: 14
  TextStyle? get p2 => textTheme.bodyText2;

  /// Returns caption >> fontSize: 12
  TextStyle? get caption => textTheme.caption;

  /// Returns overline >> fontSize: 10
  TextStyle? get overline => textTheme.overline;

  /// Returns body2 with num style >> fontSize: 14
  TextStyle? get numInterStyle =>
      p2?.copyWith(fontFamily: 'Inter', fontWeight: FontWeight.w500);

  /// Returns body2 with fontFamily Popins >> fontSize: 14
  TextStyle? get numPoppinsStyle =>
      p2?.copyWith(fontFamily: 'Poppins', fontWeight: FontWeight.w500);

  /// Returns a num style copy starting from a previous TextStyle
  TextStyle? getNumStyle(TextStyle style) =>
      style.copyWith(fontFamily: 'Inter', fontWeight: FontWeight.w500);
}

/// Style for shadowed texts
TextStyle shadowText = interBold.copyWith(
  fontWeight: FontWeight.w600,
  fontSize: 14,
  shadows: <Shadow>[
    Shadow(
      offset: const Offset(0, 2),
      blurRadius: 2,
      color: textShadowColor.withOpacity(0.25),
    ),
  ],
);

/// [Headline group]
/// Poppins family
TextStyle poppinsMedium = const TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
  letterSpacing: 0,
  color: black,
);

TextStyle poppinsRegular = const TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w300,
  letterSpacing: 0,
  color: black,
);

TextStyle poppinsSemi = poppinsMedium.copyWith(fontWeight: FontWeight.w600);

/// Inter family
TextStyle interRegular = const TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  letterSpacing: 0,
  color: lightTxt,
);
TextStyle interMedium = interRegular.copyWith(fontWeight: FontWeight.w500);
TextStyle interSemi =
    interRegular.copyWith(fontWeight: FontWeight.w600, color: boldBlackTxt);
TextStyle interBold = interRegular.copyWith(fontWeight: FontWeight.w700);

/// Headline/Poppins/Medium/32
TextStyle hpm32 = poppinsMedium.copyWith(fontSize: 32);

/// Headline/Poppins/Medium/24
TextStyle hpm24 = poppinsMedium.copyWith(fontSize: 24);

/// Headline/Poppins/Semibold/18
TextStyle hps18 = poppinsSemi.copyWith(fontSize: 18);

/// Headline/Poppins/Medium/18
TextStyle hpm18 = poppinsMedium.copyWith(fontSize: 18);

/// Headline/Poppins/Medium/20
TextStyle hpm20 = poppinsMedium.copyWith(fontSize: 20);

/// Headline/Poppins/Semibold/16
TextStyle hps16 = poppinsSemi.copyWith(fontSize: 16);

/// Headline/Poppins/Medium/16
TextStyle hpm16 = poppinsMedium.copyWith(fontSize: 16);

/// Headline/Poppins/Regular/12
TextStyle hpr12 = poppinsRegular.copyWith(fontSize: 12);

/// Headline/Poppins/Regular/16
TextStyle hpr16 = poppinsRegular.copyWith(fontSize: 16);

/// Headline/Inter/Semibold/28
TextStyle his28 = interSemi.copyWith(fontSize: 28);

/// Headline/Inter/Semibold/16
TextStyle his16 = interSemi.copyWith(fontSize: 16);

/// Headline/Inter/Semibold/18
TextStyle his18 = interSemi.copyWith(fontSize: 18);

/// Headline/Inter/Semibold/18
TextStyle his20 = interSemi.copyWith(fontSize: 20);

/// Headline/Inter/Semibold/24
TextStyle his24 = interSemi.copyWith(fontSize: 24);

/// Headline/Inter/Medium/20
TextStyle him20 = interMedium.copyWith(fontSize: 20);

/// Headline/Inter/Medium/18
TextStyle him18 = interMedium.copyWith(fontSize: 18);

/// Headline/Inter/Medium/16
TextStyle him16 = interMedium.copyWith(fontSize: 16);

/// Subheading/Poppins/Semibold/14
TextStyle sps14 = poppinsSemi.copyWith(fontSize: 14);

/// Subheading/Poppins/Medium/14
TextStyle spm14 = poppinsMedium.copyWith(fontSize: 14);

/// Headline/Inter/Semibold/14
TextStyle his14 = interSemi.copyWith(fontSize: 14);

/// Subheading/Inter/Medium/14
TextStyle sim14 = interMedium.copyWith(fontSize: 14);

/// Subheading/Inter/Medium/12
TextStyle sim12 = interMedium.copyWith(fontSize: 12);

/// Subheading/Inter/Medium/11
TextStyle sim11 = interMedium.copyWith(fontSize: 11);

/// Subheading/Inter/Medium/10
TextStyle sim10 = interMedium.copyWith(fontSize: 10);

/// Body/Inter/Regular/17
TextStyle bir17 = interRegular.copyWith(fontSize: 17);

/// Body/Inter/Regular/17
TextStyle bir16 = interRegular.copyWith(fontSize: 16);

/// caption/Inter/Medium/17
TextStyle cim17 = interMedium.copyWith(fontSize: 17);

/// Body/Inter/Regular/14
TextStyle bir14 = interRegular.copyWith(fontSize: 14);

/// caption/Inter/Medium/14
TextStyle cim14 = interMedium.copyWith(fontSize: 14);

/// Body/Inter/Regular/13
TextStyle bir13 = interRegular.copyWith(fontSize: 13);

/// Body/Inter/Regular/13
TextStyle bir12 = interRegular.copyWith(fontSize: 12);

/// Headline/Inter/Semibold/12
TextStyle his12 = interSemi.copyWith(fontSize: 12);

/// Headline/Inter/Semibold/11
TextStyle his11 = interSemi.copyWith(fontSize: 11);

/// Headline/Inter/Semibold/48
TextStyle his48 = interSemi.copyWith(fontSize: 48);

/// caption/Inter/Medium/13
TextStyle cim13 = interMedium.copyWith(fontSize: 13);

/// caption/Inter/Medium/12
TextStyle cim12 = interMedium.copyWith(fontSize: 12);

/// caption/Inter/Medium/11
TextStyle cim11 = interMedium.copyWith(fontSize: 11);

///Balance column fontSize
TextStyle balanceColumnTextStyle = his14.copyWith(color: titleTxt);

///Balance column fontSize
TextStyle valueColumnTextStyle = his14.copyWith(color: boldBlackTxt);

///borrow column fontSize
TextStyle valueRedColumnTextStyle = his14.copyWith(color: redText);

///HeadLIne/inter/bold
TextStyle hib12 = interBold.copyWith(fontSize: 12);

///HeadLIne/inter/bold
TextStyle hib14 = interBold.copyWith(fontSize: 14);

///HeadLIne/inter/bold
TextStyle hib16 = interBold.copyWith(fontSize: 16);

///HeadLIne/inter/bold
TextStyle hib18 = interBold.copyWith(fontSize: 18);

///HeadLIne/inter/bold
TextStyle hib22 = interBold.copyWith(fontSize: 22);

///HeadLIne/inter/bold
TextStyle hib24 = interBold.copyWith(fontSize: 24);

///HeadLIne/inter/bold
TextStyle hib36 = interBold.copyWith(fontSize: 36);

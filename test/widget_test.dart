
import 'integration/unsuccessful_login.dart';

import 'unit/separate_words.dart';
import 'widgets/animation_page.dart';
import 'widgets/p_clip_path.dart';
import 'widgets/p_elevated_button.dart';

void main() {
  //Unit test
  separateWordsUnitTest();

  //Widget Test
  animationPageWidgetTest();
  pClipPath();
  pElevatedButtonTest();

  //Integration Test
  unsuccessfulLogin();

}

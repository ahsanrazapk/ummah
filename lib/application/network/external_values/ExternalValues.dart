
import 'package:ummah/application/network/external_values/iExternalValue.dart';

class ExternalValues implements IExternalValues{
  @override
  String getBaseUrl() {
    return 'https://ummahportal.pixelpk.com';

  }

}
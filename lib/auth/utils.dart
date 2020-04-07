import 'package:provider/provider.dart';
import 'package:sats/auth/auth.dart';

String getUserToken(context){
  return Provider.of<Auth>(context, listen: false).token;
}
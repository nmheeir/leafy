import 'package:easy_localization/easy_localization.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/generated/locale_keys.g.dart';

class ErrorMessageMapper {
  static String mapFailureToMessage(Failure failure) {
    return failure.when(
      server: (_) => LocaleKeys.error_server_error.tr(),
      connection: (_) => LocaleKeys.error_no_internet.tr(),
      cache: (_) => LocaleKeys.error_cache_error.tr(),
      unexpected: (_) => LocaleKeys.error_unexpected.tr(),
      database: (message) => LocaleKeys.error_database.tr(),
      notFound: (message) => LocaleKeys.error_not_found.tr(),
      parse: (message) => LocaleKeys.error.tr(),
      permission: (_) => LocaleKeys.error_permission.tr(),
      rateLimit: (_) => LocaleKeys.error_rate_limit.tr(),
    );
  }
}

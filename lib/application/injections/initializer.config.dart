// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_porfolio/data/data_source/projet.datasource.dart' as _i3;
import 'package:e_porfolio/data/repositories/projet.repository.dart' as _i5;
import 'package:e_porfolio/foundation/client/dio.client.dart' as _i4;
import 'package:e_porfolio/foundation/client/interceptors/header.interceptor.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ProjetDataSource>(() => _i3.ProjetDataSource());
    gh.singleton<_i4.DioClient>(() => _i4.DioClient());
    gh.singleton<_i5.ProjetRepository>(() =>
        _i5.ProjetRepository(projetDataSource: gh<_i3.ProjetDataSource>()));
    gh.singleton<_i6.HeaderInterceptor>(
        () => _i6.HeaderInterceptor(dioClient: gh<_i4.DioClient>()));
    return this;
  }
}

/// Try to cast, in case of failure returns null
T? castOrNull<T>(x) => x is T ? x : null;

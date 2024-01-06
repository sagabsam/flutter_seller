class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.started() = _Started;
  const factory ProductsEvent.getAll() = _GetAll;
  const factory ProductsEvent.getByCategory(int categoryId) = _GetByCategory;
}
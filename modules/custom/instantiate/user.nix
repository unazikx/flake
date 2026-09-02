{
  zen,
  ...
}:

{
  den.schema.user.imports = [
    (
      {
        user,
        ...
      }:
      {
        aspect = zen.users.${user.userName};
      }
    )
  ];
}

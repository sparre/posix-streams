with
  POSIX.IO;
with
  POSIX_Stream;
with
  Some_Tagged_Records.Derived,
  Some_Tagged_Records.Root;

procedure Send is
   Stream : aliased POSIX_Stream.Instance;
begin
   POSIX_Stream.Connect (Stream, POSIX.IO.Standard_Output);

   declare
      use Some_Tagged_Records;
      A : constant Root.Class := Root.Create;
      B : constant Root.Class := Derived.Create ("Two");
      C : constant Root.Class := Derived.Create ("Three");
      D : constant Root.Class := Root.Create;
   begin
      Root.Class'Output (Stream'Access, A);
      Root.Class'Output (Stream'Access, B);
      Root.Class'Output (Stream'Access, C);
      Root.Class'Output (Stream'Access, D);
   end;
end Send;

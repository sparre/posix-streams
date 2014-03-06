with
  Ada.Text_IO;
with
  POSIX.IO;
with
  POSIX_Stream;
with
  Some_Tagged_Records.Derived,
  Some_Tagged_Records.Root;

pragma Unreferenced (Some_Tagged_Records.Derived);
--  If we want to be able to receive a type, we have to include its declaration
--  in the program, even if we don't reference it explicitly.

procedure Receive is
   Stream : aliased POSIX_Stream.Instance;
begin
   POSIX_Stream.Connect (Stream, POSIX.IO.Standard_Input);

   declare
      use Some_Tagged_Records;
   begin
      loop
         declare
            Object : constant Root.Class := Root.Class'Input (Stream'Access);
         begin
            Ada.Text_IO.Put_Line (Root.Image (Object));
         end;
      end loop;
   end;
exception
   when Ada.Text_IO.End_Error =>
      Ada.Text_IO.Put_Line ("<end of transmission>");
end Receive;

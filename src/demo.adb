with
  Ada.Text_IO;
with
  POSIX.IO;
with
  POSIX_Stream;

procedure Demo is
   Stream : aliased POSIX_Stream.Instance;
begin
   POSIX_Stream.Connect (Stream, POSIX.IO.Standard_Input);

   loop
      Ada.Text_IO.Put (Character'Input (Stream'Access));
   end loop;
exception
   when Ada.Text_IO.End_Error =>
      Ada.Text_IO.Put_Line ("<EOF>");
end Demo;

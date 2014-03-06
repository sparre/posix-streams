package body POSIX_Stream is
   procedure Connect (Stream :    out Instance;
                      File   : in     POSIX.IO.File_Descriptor) is
   begin
      Stream.File := File;
   end Connect;

   procedure Read (Stream : in out Instance;
                   Item   :    out Ada.Streams.Stream_Element_Array;
                   Last   :    out Ada.Streams.Stream_Element_Offset) is
   begin
      POSIX.IO.Read (File   => Stream.File,
                     Buffer => Item,
                     Last   => Last);
   end Read;

   procedure Write (Stream : in out Instance;
                    Item   : in     Ada.Streams.Stream_Element_Array) is
      use type Ada.Streams.Stream_Element_Offset;
      Last : Ada.Streams.Stream_Element_Offset := Item'First - 1;
   begin
      while Last < Item'Last loop
         POSIX.IO.Write (File   => Stream.File,
                         Buffer => Item (Last + 1 .. Item'Last),
                         Last   => Last);
      end loop;
   end Write;
end POSIX_Stream;

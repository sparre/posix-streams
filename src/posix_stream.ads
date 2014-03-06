with
  Ada.Streams;
with
  POSIX.IO;

package POSIX_Stream is
   type Instance is new Ada.Streams.Root_Stream_Type with private;

   procedure Connect (Stream :    out Instance;
                      File   : in     POSIX.IO.File_Descriptor);

   procedure Read (Stream : in out Instance;
                   Item   :    out Ada.Streams.Stream_Element_Array;
                   Last   :    out Ada.Streams.Stream_Element_Offset);

   procedure Write (Stream : in out Instance;
                    Item   : in     Ada.Streams.Stream_Element_Array);
private
   type Instance is new Ada.Streams.Root_Stream_Type with
      record
         File : POSIX.IO.File_Descriptor;
      end record;
end POSIX_Stream;

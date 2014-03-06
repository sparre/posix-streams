package Some_Tagged_Records.Root is
   type Instance is tagged private;
   subtype Class is Instance'Class;

   function Image (Item : in Instance) return String;

   function Create return Instance'Class;
private
   type Instance is tagged
      record
         ID : Natural := 0;
      end record;
end Some_Tagged_Records.Root;

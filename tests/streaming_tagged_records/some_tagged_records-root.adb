with
  Some_Tagged_Records.Counter;

package body Some_Tagged_Records.Root is
   function Create return Instance'Class is
   begin
      return Instance'(ID => Counter.Next);
   end Create;

   function Image (Item : in Instance) return String is
   begin
      return "Root'(ID =>" & Natural'Image (Item.ID) & ")";
   end Image;
end Some_Tagged_Records.Root;

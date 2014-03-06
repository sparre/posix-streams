with
  Some_Tagged_Records.Root;

package Some_Tagged_Records.Derived is
   type Instance (<>) is new Root.Instance with private;

   function Image (Item : in Instance) return String;

   function Create (Text : in String) return Instance'Class;
private
   type Instance (Length : Natural) is new Root.Instance with
      record
         Data : String (1 .. Length);
      end record;
end Some_Tagged_Records.Derived;

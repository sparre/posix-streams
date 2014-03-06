package body Some_Tagged_Records.Derived is
   function Create (Text : in String) return Instance'Class is
   begin
      return Instance'(Root.Instance (Root.Create)
                         with
                       Length => Text'Length,
                       Data   => Text);
   end Create;

   function Image (Item : in Instance) return String is
   begin
      return Root.Image (Root.Instance (Item)) &
        " & (Text => """ & Item.Data & """)";
   end Image;
end Some_Tagged_Records.Derived;

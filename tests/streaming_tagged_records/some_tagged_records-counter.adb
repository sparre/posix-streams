package body Some_Tagged_Records.Counter is
   Index : Natural := 0;

   function Next return Positive is
   begin
      Index := Index + 1;
      return Index;
   end Next;
end Some_Tagged_Records.Counter;

entity invert_keys is
    port(   x0, x1 : in  bit;
            y0, y1 : out bit);
end;

architecture synth of invert_keys is
begin

    y0 <= not x0;
    y1 <= not x1;
    
end;
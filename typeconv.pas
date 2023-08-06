module typeconv;

export
  function str_to_int(var s: string) : integer;

implement

function str_to_int(var s: string) : integer;
var
  total : integer;
  place : integer;
  i     : integer;
begin
  total := 0;
  place := 1;
  i := strlen(s);
  while i > 0 do begin
    total := total + ((ord(s[i]) - ord('0')) * place);
    i := i - 1;
    place := place * 10;
  end;
  str_to_int := total;
end;
end.

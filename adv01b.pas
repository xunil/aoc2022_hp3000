program adv01(input, output);

$SEARCH 'TYPECONV.OBJ.ADVENT'$
import
  typeconv;

var
  infostring : string[80];
  infolength : shortint;
  parm : shortint;
  result : shortint;
  infile : text;
  l : string[16];
  n : integer;
  i : integer;
  subtotal : longint;
  total    : longint;
  maxcalories : array [1..3] of longint;


function GETINFO(VAR infostring: string;
                 VAR infolength: shortint;
                 VAR parm: shortint) : shortint; INTRINSIC;
begin
  parm := 0;
  infostring := strrpt(' ', 80);
  infolength := 80;
  result := GETINFO(infostring, infolength, parm);
  setstrlen(infostring, infolength);

  reset(infile, infostring);

  maxcalories[1] := 0;
  maxcalories[2] := 0;
  maxcalories[3] := 0;

  subtotal := 0;
  total := 0;
  while not(eof(infile)) do begin
    readln(infile, l);
    l := strrtrim(l);
    if strlen(l) > 0 then
      begin
        n := str_to_int(l);
        subtotal := subtotal + n;
      end
    else
      begin
        writeln('subtotal=', subtotal,
                ', maxcalories[]=', maxcalories[1], ',',
                maxcalories[2], ',', maxcalories[3]);
        if subtotal > maxcalories[1] then
          begin
            writeln('*** subtotal > maxcalories[1]');
            maxcalories[3] := maxcalories[2];
            maxcalories[2] := maxcalories[1];
            maxcalories[1] := subtotal;
          end
        else if i > maxcalories[2] then
          begin
            writeln('*** subtotal > maxcalories[2]');
            maxcalories[3] := maxcalories[2];
            maxcalories[2] := subtotal;
          end
        else if subtotal > maxcalories[3] then
          begin
            writeln('*** subtotal > maxcalories[3]');
            maxcalories[3] := subtotal;
          end;

        subtotal := 0;
      end;
  end;
  for i := 1 to 3 do
    begin
      writeln('*** TOP ', i, ' = ', maxcalories[i]);
      total := total + maxcalories[i];
    end;
  writeln('END: total = ', total);
end.

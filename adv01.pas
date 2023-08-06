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
  subtotal : longint;
  maxcalories : longint;


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

  maxcalories := 0;
  subtotal := 0;
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
                ', maxcalories=', maxcalories);
        if subtotal > maxcalories then
          begin
            writeln('*** we have a new winner, maxcalories := ', subtotal);
            maxcalories := subtotal;
          end;
        subtotal := 0;
      end;
  end;
  writeln('END: maxcalories = ', maxcalories);
end.

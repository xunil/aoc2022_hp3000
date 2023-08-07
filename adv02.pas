program adv02(input, output);

type
  game_outcome = (win, loss, tie);

var
  infostring : string[80];
  infolength : shortint;
  parm : shortint;
  result : shortint;
  infile : text;
  l : string[3];
  outcome : game_outcome;
  score : integer;
  final_score: integer;


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

  score := 0;
  final_score := 0;

  while not(eof(infile)) do begin
    readln(infile, l);
    l := strrtrim(l);

    { Determine win/tie/loss and score from outcome }
    case l[1] of
      'A':  { Rock }
        begin
          case l[3] of
            'X': outcome := tie;
            'Y': outcome := win;
            'Z': outcome := loss;
          end;
        end;
      'B':  { Paper }
        begin
          case l[3] of
            'X': outcome := loss;
            'Y': outcome := tie;
            'Z': outcome := win;
          end;
        end;
      'C':  { Scissors }
        begin
          case l[3] of
            'X': outcome := win;
            'Y': outcome := loss;
            'Z': outcome := tie;
          end;
        end;
    end;

    { Score the outcome }
    case outcome of
      win:  score := 6;
      tie:  score := 3;
      loss: score := 0;
    end;

    { Add score from choice to outcome score }
    case l[3] of
      'X': score := score + 1;
      'Y': score := score + 2;
      'Z': score := score + 3;
    end;
    final_score := final_score + score;
  end;
  writeln('END: final score = ', final_score);
end.

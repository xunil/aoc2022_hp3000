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
  choice : char;


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
    case l[3] of
      'X':
        begin
          outcome := loss;
          score := 0;
        end;
      'Y':
        begin
          outcome := tie;
          score := 3;
        end;
      'Z':
        begin
          outcome := win;
          score := 6;
        end;
    end;

    { Add our choice to the score based on the strategized outcome }
    case l[1] of
      'A':  { Rock }
        begin
          case outcome of
            win:  score := score + 2;  { Paper beats rock }
            tie:  score := score + 1;  { Rock and rock tie }
            loss: score := score + 3;  { Scissors lose to rock }
          end;
        end;
      'B':  { Paper }
        begin
          case outcome of
            win:  score := score + 3;  { Scissors beats paper }
            tie:  score := score + 2;  { Paper and paper tie }
            loss: score := score + 1;  { Rock loses to paper }
          end;
        end;
      'C':  { Scissors }
        begin
          case outcome of
            win:  score := score + 1;  { Rock beats scissors }
            tie:  score := score + 3;  { Scissors and scissors tie }
            loss: score := score + 2;  { Paper loses to scissors }
          end;
        end;
    end;

    { Add score from choice to outcome score }
    final_score := final_score + score;
  end;
  writeln('END: final score = ', final_score);
end.

unit chunit;

interface
uses crt,dooz,race;
var
choice2:integer;
procedure choiceun;

implementation

var
i,j:integer;
echoice:char;
choicemat:array [1..25,1..80] of word absolute $b800:0000;
procedure choiceun;
procedure choicedooz(x,y:integer);
begin
  textcolor(15);
    gotoxy(x,y);   write(' ');
    gotoxy(x,y+1); write('  |   |   |   |   |   ');
    gotoxy(x,y+2); write('-- --- --- --- --- -- ');
    gotoxy(x,y+3); write('  |   |   |   |   |   ');
    gotoxy(x,y+4); write('-- --- --- --- --- -- ');
    gotoxy(x,y+5); write('  |   |   |   |   |   ');
    gotoxy(x,y+6); write('-- --- --- --- ------ ');
    gotoxy(x,y+7); write('  |   |   |   |   |   ');
    gotoxy(x,y+8); write('-- --- --- --- --- -- ');
    gotoxy(x,y+9); write('  |   |   |   |   |   ');
    textcolor(red+128);
    gotoxy(x+4,y+3); write('X');
    gotoxy(x+8,y+5); write('X');
    gotoxy(x+12,y+7); write('X');
    gotoxy(x+16,y+9); write('X');
    textcolor(BLUE);
    gotoxy(x,y+5); write('O');
    gotoxy(x+8,y+3); write('O');
    gotoxy(x+16,y+7); write('O');
    gotoxy(x+8,y+7); write('O');
    gotoxy(x+8,y+9); write('O');
  end;




procedure choicerace(x,y:integer);
begin
textcolor(15);
    gotoxy(x,y);   write('oOOo.');
    gotoxy(x,y+1); write('O   O');
    gotoxy(x,y+2); write('OOO0,   oOo');
    gotoxy(x,y+3); write('O   O  O   O');
    gotoxy(x,y+4); write('       OOOOO   OOOo');
    gotoxy(x,y+5); write('       O   O  O');
    gotoxy(x,y+6); write('              O    .  OOOOO');
    gotoxy(x,y+7); write('               OOOO   Ooooo');
    gotoxy(x,y+8); write('                      O');
    gotoxy(x,y+9); write('                      OOOOO');

end;
procedure choicechoice(x,y:integer);
begin
textcolor(red);
    gotoxy(x,y  ); write('');
    gotoxy(x,y+1); write('        ##');
    gotoxy(x,y+2); write('      ######');
    gotoxy(x,y+3); write('    ##########');
    gotoxy(x,y+4); write('  ##############');
    gotoxy(x,y+5); write('##################')

end;
begin
clrscr;
choice2:=1;
choicedooz(5,3);
choicerace(40,4);
choicechoice(7,15);
textcolor(15);
gotoxy(20,25);writeln('     choose game...[use arrow () keys]');
gotoxy(1,23);writeln('*It''s recomanded to choose Race as your elected game CUZ you won''t get any point in Dooz ...! ');
readkey;
echoice:=readkey;

while ord(echoice)<>13 do
begin
readkey;
echoice:=readkey;
if ord(echoice)=75 then
 begin
 choice2:=1;
 for i:=15 to 21 do
  for j:=47 to 64 do
   choicemat[i,j]:=0;
 choicechoice(7,15);
  end;
if ord(echoice)=77 then
 begin
 choice2:=2;
 for i:=15 to 21 do
  for j:=7 to 25 do
   choicemat[i,j]:=0;
   choicechoice(47,15);
  end;
end;
if choice2=1 then doozunit;
if choice2=2 then raceunit;
end;
end.
unit ques;

interface
uses crt;
procedure quesunit;
var
 iftrue:boolean;

implementation
type
 aquestion=record
  aque:string;
  aans1:string;
  aans2:string;
  aans3:string;
  aans4:string;
  aans:integer;
  aqno:integer;
 end;


var
afil:file of aquestion;
i:integer;
javab:char;
quest:array[1..20] of aquestion;



procedure quesunit;


begin
assign(afil,'c:\questions.txt');
reset(afil);
 for i:=1 to 20 do
 read(afil,quest[i]);
 {for i:=1 to 3 do}
 randomize;
 i:=random(20)+1;
 begin
 clrscr;
 writeln;writeln;writeln;writeln;writeln;writeln;
 writeln('         -',quest[i].aque);
 WRITELN;
 writeln('            1 : ',quest[i].aans1);
 writeln('            2 : ', quest[i].aans2);
 writeln('            3 : ',quest[i].aans3);
 writeln('            4 : ',quest[i].aans4);
 gotoxy(2,25);writeln('* Select suitable answer and press keyboard [1],[2],[3],[4].');
 javab:=readkey;

 if ord(javab)-48=quest[i].aans then
 begin
  gotoxy(1,18);writeln('                                  C o n g r a t u l a t i o n ');
  iftrue:=true;
 end;
 if ord(javab)-48<>quest[i].aans then
  begin
  gotoxy(1,18);writeln ('                                    T h a t ` s  W r o n g ! ');
  iftrue:=false;
  end;

  textcolor(red);
  gotoxy(11,ord(javab)-41);writeln(chr(88));
  textcolor(green);
  gotoxy(11,quest[i].aans+7);writeln(chr(251));
 readln;
 end;
 end;
 end.

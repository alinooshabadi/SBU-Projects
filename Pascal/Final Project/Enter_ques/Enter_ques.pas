program Enter_ques;

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
 quest:array[1..20] of aquestion;
 i,j:integer;
 k:string;


begin

 assign(afil,'c:\questions.txt');
 rewrite(afil);
 for i:=1 to 20 do
  begin
  writeln('Question ',i,' :');
  readln(k);
  quest[i].aque:=k;
  writeln('ENTER GOZINEYE 1 :');
  readln(k);
  quest[i].aans1:=k;
  writeln('ENTER GOZINEYE 2 :');
  readln(k);
  quest[i].aans2:=k;
  writeln('ENTER GOZINEYE 3 :');
  readln(k);
  quest[i].aans3:=k;
  writeln('ENTER GOZINEYE 4 :');
  readln(k);
  quest[i].aans4:=k;
  quest[i].aqno:=i;
  writeln('ENTER GOZINEYE SAHIH :');
  readln(j);
  quest[i].aans:=j;
 end;
 for i:=1 to 20 do
   write(afil,quest[i]);
 close(afil);
 end.















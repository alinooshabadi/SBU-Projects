{This program has been written in Turbo Pascal 7.0 . if it doesn't work
properly in your PC maybe delay value is not fit to your Pascal version or
your PC . replace "delayconst" ( located in Constant declarations ) with
suitable value of delay . do this modification in "dooz.pas" and "race.pas"
too.}

Program P_R_O_J_E_C_T;

uses
 crt,
 chunit,
 ques,
 dooz,
 race;

const
 delayconst=6000;


var
 mainframe :array[1..25,1..80] of word absolute $b800:000;
 mainhelp  :array[1..25,1..80] of word;
 mainjadval:array[1..18]       of integer;
 choice                  :char;
 mainscore               :longint;
 reward,emtiaz,ent       :integer;
 marhaleh,handplace,f,i,j:integer;
 tel,name,famil,address  :string;

procedure typei(x:string);
 begin
  for i:=1 to length(x) do
   begin
   write(x[i]);
   delay(delayconst);
  end;
 end;

procedure copy;
 begin
  for i:=1 to 25 do
   for j:=1 to 80 do
    mainhelp[i,j]:=mainframe[i,j];
 end;

procedure paste;
 begin
  for i:=1 to 25 do
   for j:=1 to 80 do
    mainframe[i,j]:=mainhelp[i,j];
 end;

procedure drawX(x,y:integer);
 begin
  textcolor(red+128);
    gotoxy(x,y);   write('Ü   Ü');
    gotoxy(x,y+1); write('฿ฒ ฒ฿');
    gotoxy(x,y+2); write(' ÞฒÝ ');
    gotoxy(x,y+3); write('Üฒ ฒÜ');
    gotoxy(x,y+4); write('฿   ฿');
 end;

procedure game(x,y:integer);
 begin
  textcolor(lightblue);
    gotoxy(x,y);   write(' __|___|__ ');
    gotoxy(x,y+1); write('   |   | ');
    gotoxy(x,y+2); write(' __|___|__ ');
    gotoxy(x,y+3); write('   | O |  ');
    TEXTCOLOR(blue);
    gotoxy(x,y+4); write('  G A M E');
 end;

procedure hand(x,y:integer);
 begin
  textcolor(white);
    gotoxy(x,y);   write('    ');
    gotoxy(x,y+1); write('  ');
    gotoxy(x,y+2); write('    ');
 end;

procedure blackhand(x,y:integer);
 begin
  textcolor(white+128);
    gotoxy(x,y);   write('     ');
    gotoxy(x,y+1); write('      ');
    gotoxy(x,y+2); write('       ');
    gotoxy(x,y+3); write('     ');
    gotoxy(x,y+4); write('      ');
  end;


procedure drawreward(x,y:integer);
 begin
  textcolor(RED);
    gotoxy(x,y);   write('   oOOOo.');
    gotoxy(x,y+1); write('  OO      ');
    gotoxy(x,y+2); write('  OO  ``O');
    gotoxy(x,y+3); write('   `OOOO''');
    gotoxy(x,y+4); write('  G I F T ');
  end;

procedure next(x,y:integer);
 begin
   textcolor(green);
    gotoxy(x,y);   write('     |, ');
    gotoxy(x,y+1); write(':||||||;.');
    gotoxy(x,y+2); write(':||||||;`');
    gotoxy(x,y+3); write('     |''');
    gotoxy(x,y+4); write(' N E X T');
  end;

procedure soal(x,y:integer);
 begin
  textcolor(white);
    gotoxy(x,y);   write(' .::::.');
    gotoxy(x,y+1); write(':;   ::;');
    gotoxy(x,y+2); write('    ::;');
    gotoxy(x,y+3); write('   ::;');
    gotoxy(x,y+4); write('   .,');
  end;

label 1,2,3,4,5,6,7,8,9,10;

begin
 clrscr;
 textcolor(white);
 name:='                                           ';
 famil:='                                          ';
 address:='                                        ';

 gotoxy(4,3);write('User profile');
 gotoxy(10,10);write('First name : ');readln(name);
 gotoxy(10,11);write('Last name  : ');readln(famil);
 gotoxy(10,12);write('Tel NO.    : ');readln(tel);
 gotoxy(10,13);write('Address    : ');readln(address);
 gotoxy(48,19);typei('Good luck ');
 gotoxy(58,19);typei(name);

 for i:=1 to 18 do
  mainjadval[i]:=0;

      {game}
 i:=4;
 while i<>0 do
  begin
   randomize;
   f:=random(18)+1;
   if mainjadval[f]=0 then
    begin
     mainjadval[f]:=1;
     i:=i-1;
    end;
  end;

      {next}
 i:=4;
 while i<>0 do
  begin
   randomize;
   f:=random(18)+1;
   if mainjadval[f]=0 then
    begin
     mainjadval[f]:=2;
     i:=i-1;
    end;
  end;

      {reward}
 i:=4;
 while i<>0 do
  begin
   randomize;
   f:=random(18)+1;
   if mainjadval[f]=0 then
    begin
    mainjadval[f]:=3;
    i:=i-1;
   end;
  end;

      {pooooooooooooch}
 i:=3;
 while i<>0 do
  begin
   randomize;
   f:=random(18)+1;
   if mainjadval[f]=0 then
    begin
     mainjadval[f]:=4;
     i:=i-1;
    end;
  end;

      {soal}
 i:=3;
 while i<>0 do
  begin
   randomize;
   f:=random(18)+1;
   if mainjadval[f]=0 then
    begin
     mainjadval[f]:=5;
     i:=i-1;
    end;
  end;

 clrscr;
 handplace:=-5;
 marhaleh:=0;
 textcolor(15);

 gotoxy(5,2);write('.:: ',name,' ',famil,' ::.');
 gotoxy(65,2);write('Score :',mainscore);
 gotoxy(4,4 );writeln('ษอออออออออออหอออออออออออหอออออออออออหอออออออออออหอออออออออออหอออออออออออป');
 gotoxy(4,5 );writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,6 );writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,7 );writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,8 );writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,9 );writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,10);writeln('ฬ','อออออออออออ', chr(206),'อออออออออออ',chr(206),'อออออออออออ',chr(206),'อออออออออออ',chr(206),
   'อออออออออออ',chr(206),'อออออออออออน');
 gotoxy(4,11);writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,12);writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,13);writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,14);writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,15);writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,16);writeln('ฬ','อออออออออออ', chr(206),'อออออออออออ',chr(206),'อออออออออออ',chr(206),'อออออออออออ',chr(206),
   'อออออออออออ',chr(206),'อออออออออออน');
 gotoxy(4,17);writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,18);writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,19);writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,20);writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,21);writeln('บ           บ           บ           บ           บ           บ           บ');
 gotoxy(4,22);writeln('ศอออออออออออสอออออออออออสอออออออออออสอออออออออออสอออออออออออสอออออออออออผ');
 copy;

 5:
  paste;
  textcolor(white);
  gotoxy(65,2);write('Score :',mainscore);
  if marhaleh=18 then goto 6;
   marhaleh:=marhaleh+3;
  handplace:=handplace+12;
  blackhand(handplace-12,23);
  hand(handplace,23);

 8:
  choice:='c';
  choice:=readkey;
  ent:=ord(choice);
  if (ord(choice)>48) and (ord(choice)<52) then goto 7;
   goto 8;

 7:
  if ent=49 then
  begin
   if mainjadval[marhaleh-2]=1 then goto 1;
   if mainjadval[marhaleh-2]=2 then goto 2;
   if mainjadval[marhaleh-2]=3 then goto 3;
   if mainjadval[marhaleh-2]=4 then goto 4;
   if mainjadval[marhaleh-2]=5 then goto 9;
  end;

 if ord(choice)=50 then
  begin
   if mainjadval[marhaleh-1]=1 then goto 1;
   if mainjadval[marhaleh-1]=2 then goto 2;
   if mainjadval[marhaleh-1]=3 then goto 3;
   if mainjadval[marhaleh-1]=4 then goto 4;
   if mainjadval[marhaleh-1]=5 then goto 9;
  end;

 if ord(choice)=51 then
  begin
   if mainjadval[marhaleh]=1 then goto 1;
   if mainjadval[marhaleh]=2 then goto 2;
   if mainjadval[marhaleh]=3 then goto 3;
   if mainjadval[marhaleh]=4 then goto 4;
   if mainjadval[marhaleh]=5 then goto 9;
  end;

 4:
  drawx(handplace+1,(ent-48)*6-1);
  mainscore:=0;
  textcolor(15);
  gotoxy(65,2);write('Score :0      ');
  copy;
  readkey;
  textcolor(white);
  gotoxy (10,6 );write(' ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออป ');
  gotoxy (10,7 );write(' บ                                                       บ ');
  gotoxy (10,8 );write(' บ                                                       บ ');
  gotoxy (10,9 );write(' บ                                                       บ ');
  gotoxy (10,15);write(' บ                                                       บ ');
  gotoxy (10,10);write(' บ                                                       บ ');
  gotoxy (10,11);write(' บ                                                       บ ');
  gotoxy (10,12);write(' บ                                                       บ ');
  gotoxy (10,13);write(' บ                                                       บ ');
  gotoxy (10,14);write(' บ                      PRESS <ENTER>                    บ ');
  gotoxy (10,15);write(' ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออผ ');
  gotoxy (29,7 );typei(' You''re out of luck !');
  gotoxy (16,8 );write('First name: ');typei(name);
  gotoxy (16,9 );write('Last name : ');typei(famil);
  gotoxy (16,10);write('TEL NO.   : ');typei(tel);
  gotoxy (16,11);write('Address   : ');typei(address);
  gotoxy (18,13);write('   Score  : ');write(mainscore);
  gotoxy (1,25);
  readln;
  exit;
  goto 5;

 3:
  drawreward(handplace-2,(ent-48)*6-1);
  copy;
  randomize;
  reward:=(random(6)+1)*5000;
  delay(delayconst);
  gotoxy (13,10);writeln(' ษออออออออออออออออออออออออออออออออออออออออออออออออออป ');
  gotoxy (13,11);writeln(' บ   V E R Y  W E L L . . .                         บ ');
  gotoxy (13,12);writeln(' บ    Your prize :                                  บ ');
  gotoxy (13,13);writeln(' บ                                                  บ ');
  gotoxy (13,14);writeln(' บ                  Press any button                บ ');
  gotoxy (13,15);writeln(' ศออออออออออออออออออออออออออออออออออออออออออออออออออผ ');
  gotoxy (32,12);write(reward);
  mainscore:=mainscore+reward;
  gotoxy(65,2);write('Score :',mainscore);
  readkey;
  goto 5;

 2:
  next(handplace-1,(ent-48)*6-1);
  copy;
  goto 5;

 9:
  soal(handplace,(ent-48)*6-1);
  copy;
  delay(delayconst*2);
  quesunit;
  if iftrue=true then mainscore:=mainscore+10000;
  if iftrue=false then
  if mainscore<5000 then mainscore:=0;
  if mainscore>=5000 then mainscore:=mainscore-5000;
  gotoxy(65,2);write('Score :',mainscore);
  goto 5;

 1:
  GAME(handplace-2,(ent-48)*6-1);
  delay(delayconst*2);
  copy;
  choiceun;
  textbackground(black);
  if choice2=1 then mainscore:=mainscore+doozscore;
  if choice2=2 then mainscore:=mainscore+racescore;
  gotoxy(65,2);write('Score :',mainscore);
  goto 5;

 6:
  textcolor(white);
  gotoxy (10,6 );write(' ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออป ');
  gotoxy (10,7 );write(' บ                                                       บ ');
  gotoxy (10,8 );write(' บ                                                       บ ');
  gotoxy (10,9 );write(' บ                                                       บ ');
  gotoxy (10,15);write(' บ                                                       บ ');
  gotoxy (10,10);write(' บ                                                       บ ');
  gotoxy (10,11);write(' บ                                                       บ ');
  gotoxy (10,12);write(' บ                                                       บ ');
  gotoxy (10,13);write(' บ                                                       บ ');
  gotoxy (10,14);write(' บ                                                       บ ');
  gotoxy (10,15);write(' บ                      PRESS <ENTER>                    บ ');
  gotoxy (10,16);write(' ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออผ ');
  gotoxy (16,8 );write('First name: ');typei(name);
  gotoxy (16,9 );write('Last name : ');typei(famil);
  gotoxy (16,10);write('TEL NO.   : ');typei(tel);
  gotoxy (16,11);write('Address   : ');typei(address);
  gotoxy (18,13);write('   Score  : ');write(mainscore);
  textcolor(black);
  gotoxy (1,25);
  readln;
  exit;
end.
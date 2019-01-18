uses crt;

var
bg          :array[1..25,1..80] of word absolute $b800:0000;
mycar       :array[1..4 , 1..5] of word ;
HELP,my_help:array[1..25,1..80] of integer;
rival,rival2:array[1..3 , 1..5] of word;
truck       :array[1..7 , 1..7] of word;
jadval1,jadval2,line1,line2:array [1..25] of word;
tim,a,b,c,d,e,f,i,j,colour,jadcheck      :integer;
damage,ki,kj,ci1,cj1,ci2,cj2,ei1,ej1,ei2,ej2 :integer;
had,speed,slide,gear,sorat,racescore         :integer;
k:char;

{-----------------------------PROCEDURES-------------------------------------}
{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}

procedure my_place(c,d:integer);
begin
   for a:=1 to 4 do
    for b:=1 to 5 do
   bg[a+c-1,b+d-1]:=mycar[a,b];
   end;

procedure helpp(c,d:integer);
begin
for a:=1 to 3 do
 for b:=1 to 5 do
   HELP[a+c-1,b+d-1]:=1;
   end;

procedure my_helpp(c,d:integer);
begin
for a:=20 to 25 do
  for b:=1 to 65 do
   my_help[a,b]:=0;
 for a:=1 to 4 do
  for b:=1 to 5 do
   my_HELP[a+c-1,b+d-1]:=1;
   {my_help[a+c-1,b+d-1]:=0;
    my_help[a+c-1,b+d+3]:=0;
    my_help[a+c+2,b+d-1]:=0;
    my_help[a+c+2,b+d+3]:=0;}
    end;


procedure matristo2;
begin
for a:=1 to 25 do
 for b:=1 to 80 do
 help[a,b]:=2;
end;

procedure place(c,d:integer);
  begin
   for a:=1 to 3 do
    for b:=1 to 5do
   bg[a+c-1,b+d-1]:=rival[a,b];
   for a:=1 to 3 do
    for b:=1 to 5 do
   HELP[a+c-1,b+d-1]:=1;
   end;


procedure place2(c,d:integer);
  begin
   for a:=1 to 3 do
    for b:=1 to 5do
   bg[a+c-1,b+d-1]:=rival2[a,b];
   end;

procedure placeK(c,d:integer);
  begin
   for a:=1 to 7 do
    for b:=1 to 7 do
   bg[a+c-1,b+d-1]:=truck[a,b];
   end;


procedure cjadval1;
 begin
 for colour:=1 to 25 do
 begin
  bg[colour,18]:=jadval1[colour];
  bg[colour,69]:=jadval1[colour];
  bg[colour,44]:=line1[colour];
  end;
  end;



procedure cjadval2;
 begin
 for colour:=1 to 25 do
 begin
  bg[colour,18]:=jadval2[colour];
  bg[colour,69]:=jadval2[colour];
  bg[colour,44]:=line2[colour];
  end;
  end;



{===========================================================================}
{===========================================================================}
begin
clrscr;
racescore:=0;
textcolor(white);
gotoxy(3,3);writeln('Controllers');
gotoxy(5,5);writeln('Keyboard ',chr(25),'     : brake');
gotoxy(5,6);writeln('Keyboard space : hand brake');
gotoxy(5,7);writeln('Keyboard ',chr(27),'     : steer left');
gotoxy(5,8);writeln('Keyboard ',chr(26),'     : steer right');
gotoxy(5,9);writeln('Keyboard H     : horn');
gotoxy(5,10);writeln('Keyboard 1     : shift gear to 1');
gotoxy(5,11);writeln('Keyboard 2     : shift gear to 2');
gotoxy(5,12);writeln('Keyboard 3     : shift gear to 3');
gotoxy(5,13);writeln('Keyboard 4     : shift gear to 4');
gotoxy(5,14);writeln('ESC            : EXIT');
readkey;






for i:=1 to 25 do
  for j:=1 to 80 do
 bg[i,j]:=219+7*256;

 for i:=1 to 25 do
  for j:=16 to 70 do
   bg[i,j]:=0;

  j:=1;
  while j<26 do
   begin
    jadval1[J]:=178+15*256;
    j:=j+2;
   end;
  j:=2;
  while j<25 do
   begin
    jadval1[j]:=178+0;
    j:=j+2;
   end;

   j:=1;
  while j<26 do
   begin
    jadval2[J]:=178+0;
    j:=j+2;
   end;
  j:=2;
  while j<25 do
   begin
    jadval2[j]:=178+15*256;
    j:=j+2;
   end;

   j:=1;
  while j<26 do
   begin
    line1[J]:=176+0;
    j:=j+1;
    line1[j]:=176+0;
    j:=j+3;
   end;
  j:=3;
  while j<25 do
   begin
    line1[j]:=176+7*256;
    j:=j+1;
    line1[j]:=176+7*256;
    j:=j+3;
   end;

   j:=1;
  while j<26 do
   begin
    line2[J]:=176+7*256;
    j:=j+1;
    line2[j]:=176+7*256;
    j:=j+3;
   end;
  j:=3;
  while j<25 do
   begin
    line2[j]:=176+0;
    j:=j+1;
    line2[j]:=176+0;
    j:=j+3;
   end;







   cJadval2;

textcolor(red);
textbackground(white);
  gotoxy(1,20);writeln('ษออออออออออออป');
  gotoxy(1,21);writeln('บ            บ');
  gotoxy(1,22);writeln('บ            บ');
  gotoxy(1,23);writeln('บ            บ');
  gotoxy(1,24);writeln('ศออออออออออออผ');
  gotoxy(2,22);writeln('0',' ',' km/h ');
  gotoxy(2,23);writeln('Gear :','N');
  gotoxy(2,22);writeln('Damage :','0');
  gotoxy(2,3);writeln('Score : ',racescore);

{---------------------------------MY CAR------------------------------------}
for i:=2 to 3 do
  for j:=2 to 4 do
  mycar[i,j]:=219+20*256;
  mycar[2,1]:=40+7*256;
  mycar[3,1]:=40+7*256;
  mycar[2,5]:=41+7*256;
  mycar[3,5]:=41+7*256;
  mycar[1,2]:=31+4*256;
  mycar[1,4]:=31+4*256;
  mycar[4,2]:=250+7*256;
  mycar[4,4]:=250+7*256;

{-----------------------------------rival-----------------------------------}

for i:=1 to 2 do
  for j:=2 to 4 do
  rival[i,j]:=219+15*256;
  rival[1,1]:=40+5*256;
  rival[2,1]:=40+5*256;
  rival[1,5]:=41+5*256;
  rival[2,5]:=41+5*256;
  rival[3,4]:=30+5*256;
  rival[3,2]:=30+5*256;

{-----------------------------------rival2-----------------------------------}

for i:=2 to 3 do
  for j:=2 to 4 do
  rival2[i,j]:=219+15*256;
  rival2[2,1]:=40+5*256;
  rival2[3,1]:=40+5*256;
  rival2[2,5]:=41+5*256;
  rival2[3,5]:=41+5*256;
  rival2[1,4]:=31+5*256;
  rival2[1,2]:=31+5*256;

{---------------------------------------truck-------------------------------}

FOR i:=3 to 6 do
  for j:=2 to 6 do
  truck[i,j]:=178+118*256;
FOR i:=1 to 2 do
  for j:=2 to 6 do
  truck[i,j]:=219+7*256;
FOR i:=2 to 6 do
  truck[3,I]:=176+118*256;
  truck[1,4]:=219+0*256;
  truck[1,2]:=9+7*256;
  truck[1,6]:=9+7*256;
  truck[1,3]:=9+7*256;
  truck[1,5]:=9+7*256;
  truck[2,3]:=1+112*256;
  truck[2,5]:=2+112*256;
  truck[2,1]:=40+7*256;
  truck[5,1]:=40+7*256;
  truck[6,1]:=40+7*256;
  truck[3,1]:=40+7*256;
  truck[2,7]:=41+7*256;
  truck[5,7]:=41+7*256;
  truck[6,7]:=41+7*256;
  truck[3,7]:=41+7*256;
  truck[7,6]:=232+136*256;
  truck[7,2]:=232+136*256;






{----------------------------------------------------------------------------}
i:=21;
j:=48;
{ri:=21;
rj:=29; }
ci1:=-3;
randomize;
cj1:=random(15)+20;
ci2:=-15;
cj2:=random(15)+20;
my_place(i,j);
my_helpp(i,j);
place(ci1,cj1);
place(ci2,cj2);
{placerafigh(ri,rj);}
speed:=10000;
sorat:=0;
k:=readkey;
gear:=1;
had:=5;
jadcheck:=1;
ei1:=1;
ej1:=56;
ei2:=12;
ej2:=63;
place2(ei2,ej2);
place2(ei1,ej1);
tim:=0;
ki:=-115;
kj:=45;
{harekat:=0;
ia4:=1;
ja4:=28;
bg[ia4,ja4]:=230+7*256;}







                 {===============HALGHEH===================}


damage:=0;
matristo2;
while ord(k)<>49 do
begin
 tim:=tim+1;
 k:=readkey;
  if tim=10 then
  begin
  textcolor(white);
  textbackground(black);
  gotoxy(37,25);write('Press 1 to Start');
  end;
 end;
while ord(k)<>27 do
 begin
   textcolor(red);
  textbackground(white);

{=================================G A M E  O V E R===========================}
for a:= 19 to 25 do
   for b:=1 to 80 do
   if help[a,b]=my_help[a,b] then
    if damage<100 then
    begin
     damage:=damage+1;
     sound(19000);
     delay(100);
     nosound;
    end;


if damage=100 then
   BEGIN
    gotoxy(2,22);writeln('Damage:',damage, ' %');
    textcolor(15);
    textbackground(0);
    gotoxy(35,15);writeln('G.A.M.E  O.V.E.R');
    readln;
    exit;
    end;
 {if (help[i,j]=3) or (help[i,j+1]=3) or (help[i,j+2]=3) or (help[i,j+3]=3) or
       (help[i,j+4]=3 ) then
       begin
       ia4:=26;
       if damage>10 then
       damage:=damage-10;
       end;   }

{---------------------------------------------------------------------------}


   if keypressed then k:=readkey;
   if (ord(k)=75) then
    if j>19 then
   begin
     my_place(i,j-1);
     my_helpp(i,j-1);
     j:=j-1;
     bg[22,j+5]:=0;
     bg[23,j+5]:=0;
     my_help[21,j+5]:=0;
     my_help[22,j+5]:=0;
     my_help[23,j+5]:=0;
     my_help[24,j+5]:=0;
     k:='0';
   end;
   if (ord(k)=77) then
    if j<64 then
   begin
     my_place(i,j+1);
      my_helpp(i,j+1);
     j:=j+1;
     bg[22,j-1]:=0;
     bg[23,j-1]:=0;
     my_help[21,j-1]:=0;
     my_help[22,j-1]:=0;
     my_help[23,j-1]:=0;
     my_help[24,j-1]:=0;
     k:='0';
   end;
   {T O R M O Z}
   if ord(k)=80 then
    if speed<10000 then
     if sorat>20 then
    begin
     speed:=speed+2000;
     sorat:=sorat-40;
     k:='0';
    end;
   if (ord(k)=49) then
    if gear<>1 then
     begin
      speed:=8000;
      sorat:=40;
      k:='0';
      gear:=1;
     end;
   if (ord(k)=50) then
   begin
    if gear>2 then
    begin
     speed:=6000;
     sorat:=80;
    end;
    if gear<2 then
    begin
     speed:=speed+200;
     sorat:=sorat+4;
    end;
    k:='0';
    gear:=2;
   end;
   if (ord(k)=51) then
   begin
   if gear=4 then
    begin
    speed:=4000;
    sorat:=120;
    end;
   if gear<3 then
   begin
    speed:=speed+200;
    sorat:=sorat+4;
   end;
    k:='0';
    gear:=3;
   end;
   if (ord(k)=52) then
    if gear<>4 then
    begin
    speed:=speed+200;
    sorat:=sorat+4;
    k:='0';
    gear:=4;
   end;
   if ci1>25 then
     begin
      randomize;
      cj1:=random(15)+20;
      ci1:=1;
     end;
   if ci2>25 then
     begin
      randomize;
      cj2:=random(15)+20;
      ci2:=1;
     end;
   if ei1>25 then
    begin
      racescore:=racescore+100;
      randomize;
      ej1:=random(15)+48;
      ei1:=1;
     end;
    if ei2>28 then
    begin
      racescore:=racescore+100;
      randomize;
      ej2:=random(15)+48;
      ei2:=1;
     end;
     if ki>300 then
    begin
      randomize;
      kj:=random(15)+44;
      ki:=-8;
     end;


 {=================================THE OTHERS===============================}
   if (ord(k)=104) then
   begin
   sound(130);
   delay(5000);
   nosound;
   k:='0';
      end;


   if (ord(k)=32) then
    begin
    speed:=10000;
    sorat:=0;
    bg[25,j]:=177+7*256;
    bg[25,j+4]:=177+7*256;
    bg[24,j]:=177+7*256;
    bg[24,j+4]:=177+7*256;
    gear:=1;
    k:='0';
    end;


   if (ord(k)=119) then
    begin
     bg[24,j+2]:=250+135*256;
     bg[24,j+4]:=250+7*256;
    end;
   if (ord(k)=101) then
    begin
     bg[24,j+4]:=250+135*256;
     bg[24,j+2]:=250+7*256;
     end;
   if (ord(k)=116) then
    begin
     bg[24,j+2]:=250+135*256;
     bg[24,j+4]:=250+135*256;
     end;

{===========================================================================}

     if had mod 6=0 then
      begin
      {khte tormoz pak kon}
       if had mod 30=0 then
       begin
       for e:=16 to 68 do
       bg[25,e]:=177+0;
       end;
      {--------------------}
       if jadcheck mod 2=0 then
        begin
        cjadval2;
        end;
       if jadcheck mod 2<>0 then
        begin
        cjadval1;
        end;
       matristo2;
       MY_place(I,J);
       my_helpp(i,j);
       {bg[ia4,ja4]:=230+7*256;
       help[ia4,ja4]:=3;
       ia4:=ia4+1;
       bg[ia4-2,ja4]:=0;
       HELP[ia4-2,ja4]:=2;}

       if had mod 6=0 then
       begin
       place(ci1,cj1);
       helpp(ci1,cj1);
       ci1:=ci1+1;
       bg[ci1-2,cj1+1]:=0;
       bg[ci1-2,cj1+2]:=0;
       bg[ci1-2,cj1+3]:=0;
       bg[ci1-2,cj1+4]:=0;
       bg[ci1-2,cj1]:=0;
       end;
       place(ci2,cj2);
       helpp(ci2,cj2);
       ci2:=ci2+1;
       bg[ci2-2,cj2+1]:=0;
       bg[ci2-2,cj2+2]:=0;
       bg[ci2-2,cj2+3]:=0;
       bg[ci2-2,cj2+4]:=0;
       bg[ci2-2,cj2]:=0;

       if had mod 12=0 then
       begin
       place2(ei1,ej1);
       helpp(ei1,ej1);
       ei1:=ei1+1;
       bg[ei1-2,ej1+1]:=0;
       bg[ei1-2,ej1+3]:=0;

       place2(ei2,ej2);
       helpp(ei2,ej2);
       ei2:=ei2+1;
       bg[ei2-2,ej2+1]:=0;
       bg[ei2-2,ej2+3]:=0;

       placek(ki,kj);
       ki:=ki+1;
       bg[ki-2,kj+1]:=0;
       bg[ki-2,kj+2]:=0;
       bg[ki-2,kj+5]:=0;
       bg[ki-2,kj+4]:=0;


       end;
       gotoxy(2,21);writeln(sorat,' ',' km/h ');
       gotoxy(2,23);writeln('Gear :',gear);
       gotoxy(2,22);writeln('Damage:',damage, ' % ');
       gotoxy(2,3);writeln('Score : ',racescore);


       if speed>2000 then
    if (gear=1) then
     if speed>8000 then
      begin
       speed:=speed-50;
       sorat:=sorat+1;
      end;
    if (gear=2) then
     if speed>6000 then
      begin
       speed:=speed-50;
       sorat:=sorat+1;
      end;
    if (gear=3) then
     if speed>4000 then
      begin
       speed:=speed-50;
       sorat:=sorat+1;
      end;
    if (gear=4) then
     if speed>2000 then
      begin
       speed:=speed-50;
       sorat:=sorat+1;
      end;
       jadcheck:=jadcheck+1;
       if jadcheck=200 then jadcheck:=2;
       delay(speed);
      end;
    had:=had+1;
    if had=500 then had:=5;
   END;


  textcolor(white);
  textbackground(black);
  gotoxy(32,14);write('Are you sure ? (Y/N)');
   REadkey;

end.

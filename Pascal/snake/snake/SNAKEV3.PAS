program snakev3;

uses crt;

var
toposnakei,toposnakej:integer;
p:boolean;
k:char;
cntr:longint;
max,k1,i,j:integer;
w1,w2,w3,w4,w5,w6,w7,w8,w9,w0:integer;
snake:array [1..50,1..80] of integer absolute $B800:0000;
snake2:array [1..50,1..80] of integer;
emtiaz,randx,randy:integer;

function sokhtan(x,y:integer):boolean;
begin
sokhtan:=false;
p:=false;
if (snake2[x,y]=1) or  (snake2[x,y]=2) or (snake2[x,y]=3) or (snake2[x,y]=3) or (snake2[x,y]=4) or (snake2[x,y]=5) or
(snake2[x,y]=6) or (snake2[x,y]=7) or (snake2[x,y]=8) or (snake2[x,y]=9) or (snake2[x,y]=10) or (snake2[x,y]=-1)
then sokhtan:=true;
if snake2[x,y]=-2  then
begin
max:=max+1;
p:=true;
emtiaz:=emtiaz+1;
gotoxy(3,48);
write ('    ');
gotoxy(3,48);
write (emtiaz);
end;
end;


procedure pakkon(x,y:integer);
var
wp1,wp2:integer;
begin
  for wp1:=2 to 49 do for wp2:=2 to 79 do
  begin
    if (snake2[wp1,wp2]=1)  then
    begin
      snake2[wp1,wp2]:=0;
      snake[wp1,wp2]:=0;
    end;
    if (snake2[wp1,wp2]<>0) and (snake2[wp1,wp2]<>1)and (snake2[wp1,wp2]<>-2) and (snake2[wp1,wp2]<>-1){ and
    ((wp1<>toposnakei) or (wp2<>toposnakej))}  then snake2[wp1,wp2]:=snake2[wp1,wp2]-1 ;
    if (wp1=toposnakei) and (wp2=toposnakej) then snake[wp1,wp2]:=1499;
  end;
snake2[toposnakei,toposnakej]:=snake2[toposnakei,toposnakej]+1;
snake[toposnakei,toposnakej]:=1499;
end;


label 1;

begin
textcolor(green);

randomize;
for i:=1 to 50 do for j:=1 to 80 do  begin snake[i,j]:=0; snake2[i,j]:=0; end;


randx:=random(47);
randy:=random(77);
snake2[randx+2,randy+2]:=-2;
snake[randx+2,randy+2]:=42+3*256;


randx:=random(47);
randy:=random(77);
snake2[randx+2,randy+2]:=-2;
snake[randx+2,randy+2]:=42+3*256;


randx:=random(47);
randy:=random(77);
snake2[randx+2,randy+2]:=-2;
snake[randx+2,randy+2]:=42+3*256;

randx:=random(47);
randy:=random(77);
snake2[randx+2,randy+2]:=-2;
snake[randx+2,randy+2]:=42+3*256;

randx:=random(47);
randy:=random(77);
snake2[randx+2,randy+2]:=-2;
snake[randx+2,randy+2]:=42+3*256;


randx:=random(47);
randy:=random(77);
snake2[randx+2,randy+2]:=-2;
snake[randx+2,randy+2]:=42+3*256;


randx:=random(47);
randy:=random(77);
snake2[randx+2,randy+2]:=-2;
snake[randx+2,randy+2]:=42+3*256;

randx:=random(47);
randy:=random(77);
snake2[randx+2,randy+2]:=-2;
snake[randx+2,randy+2]:=42+3*256;


1:
max:=10;
toposnakei:=2;
toposnakej:=11;
i:=2;
j:=11;
{meghdar dehi avali ye}
snake2[2,2]:=1;snake[2,2]:=1499;snake2[2,3]:=2;snake[2,3]:=1499;
snake2[2,4]:=3;snake[2,4]:=1499;snake2[2,5]:=4;snake[2,5]:=1499;
snake2[2,6]:=5;snake[2,6]:=1499;snake2[2,7]:=6;snake[2,7]:=1499;
snake2[2,8]:=7;snake[2,8]:=1499;snake2[2,9]:=8;snake[2,9]:=1499;
snake2[2,10]:=9;snake[2,10]:=1499;snake2[2,11]:=10;snake[2,11]:=1499;
{snake2[2,12]:=10;snake[2,12]:=1499;}

{pakkon(2,11);}
cntr:=11;


for w1:=1 to 49 do
begin
  snake2[w1,1]:=-1;
  snake2[w1,79]:=-1;
  snake[w1,1]:=2011;
  snake[w1,79]:=2011;
end;
for w1:=1 to 79 do
begin
  snake2[1,w1]:=-1;
  snake2[49,w1]:=-1;
  snake[1,w1]:=2011;
  snake[49,w1]:=2011;
end;


while ord(k)<>27 do

begin

  k1:=ord(k);
  k:=readkey;
 if ord(k)=0  then k:=readkey;

  if (ord(k)=80) and (k1<>72)then
    while (keypressed=false)  do
    begin
      if cntr<max+2 then cntr:=cntr+1;
      i:=i+1;
      toposnakei:=i;
      if sokhtan(toposnakei,toposnakej) then
      begin
        for w3:=2 to 50 do for w4:=2 to  79 do if (snake2[w3,w4]<>0) and (snake2[w3,w4]<>-2) then
        begin
          snake2[w3,w4]:=-1;
          snake[w3,w4]:=219+7*256;
        end;
        emtiaz:=emtiaz-1;
        gotoxy(3,48);
        write ('    ');
        gotoxy(3,48);
        write(emtiaz);
        goto 1;
      end;
      snake2[toposnakei,toposnakej]:=max;
      if  not(p)then if cntr>max then pakkon(toposnakei,toposnakej) {else p:=false};
      if p=true then
      begin
        randx:=random(47);
        randy:=random(77);
        snake2[randx+2,randy+2]:=-2;
        snake[randx+2,randy+2]:=42+3*256;
      end;
      delay(50);
    end;

  if (ord(k)=77) and (k1<>75) then
    while (keypressed=false)  do
    begin
      if cntr<max+2 then cntr:=cntr+1;
      j:=j+1;
      toposnakej:=j;
      if sokhtan(toposnakei,toposnakej) then
      begin
        for w3:=2 to 50 do for w4:=2 to  79 do if (snake2[w3,w4]<>0) and (snake2[w3,w4]<>-2)  then
        begin
          snake2[w3,w4]:=-1;
          snake[w3,w4]:=219+7*256;
        end;
        emtiaz:=emtiaz-1;
        gotoxy(3,48);
        write ('    ');
        gotoxy(3,48);
        write(emtiaz);
        goto 1;
      end;
      snake2[toposnakei,toposnakej]:=max;
      if  not(p) then if cntr>max then pakkon (toposnakei,toposnakej) {else  p:=false};
      if p=true then
      begin
        randx:=random(47);
        randy:=random(77);
        snake2[randx+2,randy+2]:=-2;
        snake[randx+2,randy+2]:=42+3*256;
      end;

      delay(50);
    end;

  if (ord(k)=75)  and (k1<>77)then
    while (keypressed=false)  do
    begin
      if cntr<max+2 then cntr:=cntr+1;
      j:=j-1;
      toposnakej:=j;
      if sokhtan(toposnakei,toposnakej) then
      begin
        for w3:=2 to 50 do for w4:=2 to  79 do if (snake2[w3,w4]<>0) and (snake2[w3,w4]<>-2)  then
        begin
          snake2[w3,w4]:=-1;
          snake[w3,w4]:=219+7*256;
        end;
        emtiaz:=emtiaz-1;
        gotoxy(3,48);
        write ('    ');
        gotoxy(3,48);
        write (emtiaz);
        goto 1;
      end;
      snake2[toposnakei,toposnakej]:=max;
      if  not(p)then if cntr>max then pakkon(toposnakei,toposnakej) {else p:=false};
      if p=true then
      begin
        randx:=random(47);
        randy:=random(77);
        snake2[randx+2,randy+2]:=-2;
        snake[randx+2,randy+2]:=42+3*256;
      end;
      delay(50);
    end;

  if (ord(k)=72) and (k1<>80) then
     while (keypressed=false)  do
     begin
       if cntr<max+2 then cntr:=cntr+1;
       i:=i-1;
       toposnakei:=i;
       if sokhtan(toposnakei,toposnakej) then
       begin
         for w3:=2 to 50 do for w4:=2 to  79 do if (snake2[w3,w4]<>0)  and (snake2[w3,w4]<>-2)  then
         begin
           snake2[w3,w4]:=-1;
           snake[w3,w4]:=219+7*256;
         end;
         emtiaz:=emtiaz-1;
         gotoxy(3,48);
         write ('    ');
         gotoxy(3,48);
         write (emtiaz);
         goto 1;
       end;
       snake2[toposnakei,toposnakej]:=max;
       if  not(p)then if cntr>max then pakkon(toposnakei,toposnakej){else  p:=false};
       if p=true then
      begin
        randx:=random(47);
        randy:=random(77);
        snake2[randx+2,randy+2]:=-2;
        snake[randx+2,randy+2]:=42+3*256;
      end;

       delay(50);
     end;

end;

end.




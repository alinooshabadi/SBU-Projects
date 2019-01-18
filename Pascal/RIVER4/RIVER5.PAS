{ 1 :  aplane          a
  2 : divar
  3 :enemyplane
  4 : tir
  5 : tank}
program river_ride;

uses crt;

var
scr:array[1..50,1..80] of word absolute $b800:000;
scrhelp:array[1..50,1..80] of integer;
w1,w2,w3,w4,w5,w6,w7,w8,w9,w0:integer;
petrol,highttank:integer;
x,y:integer;
k:char;


{---------------------------------------------------------------------------}
procedure zadan(locatx,locaty:integer);

begin

scr[locatx,locaty]:=0;
scr[locatx,locaty-1]:=0;
scr[locatx,locaty+1]:=0;

scr[locatx-1,locaty]:=0;
scr[locatx-1,locaty-1]:=0;
scr[locatx-1,locaty+1]:=0;

scr[locatx-2,locaty]:=0;
scr[locatx-2,locaty-1]:=0;
scr[locatx-2,locaty+1]:=0;

scr[locatx-3,locaty]:=0;
scr[locatx-3,locaty-1]:=0;
scr[locatx-3,locaty+1]:=0;

end;

{---------------------------------------------------------------------------}
procedure dotabalae;
begin
scr[2,15]:=2011;
scr[2,65]:=2011;
scrhelp[2,15]:=2;
scrhelp[2,65]:=2;
end;

{---------------------------------------------------------------------------}
procedure dotarafejade;
var w1:integer;
begin
for w1:=15 to 65 do
begin
  scr[1,w4]:=0;
  scr[50,w4]:=0;
  scrhelp[1,w4]:=0;
  scrhelp[50,w4]:=0;
end;
end;

{---------------------------------------------------------------------------}
procedure siyahkon(locatx,locaty:integer);
var
w1,w2:integer;
begin
scr[locatx,locaty+1]:=0;
scr[locatx,locaty+2]:=0;
scr[locatx,locaty+3]:=0;

scr[locatx-1,locaty+2]:=0;

scr[locatx-2,locaty]:=0;
scr[locatx-2,locaty+1]:=0;
scr[locatx-2,locaty+2]:=0;
scr[locatx-2,locaty+3]:=0;
scr[locatx-2,locaty+4]:=0;

scr[locatx-3,locaty+2]:=0;

scrhelp[locatx,locaty+1]:=0;
scrhelp[locatx,locaty+2]:=0;
scrhelp[locatx,locaty+3]:=0;

scrhelp[locatx-1,locaty+2]:=0;

scrhelp[locatx-2,locaty]:=0;
scrhelp[locatx-2,locaty+1]:=0;
scrhelp[locatx-2,locaty+2]:=0;
scrhelp[locatx-2,locaty+3]:=0;
scrhelp[locatx-2,locaty+4]:=0;

scrhelp[locatx-3,locaty+2]:=0;


end;

{---------------------------------------------------------------------------}

procedure zadaneplane(locatx,locaty:integer);
begin

if scrhelp[locatx,locaty-1]=3 then locaty:=locaty-1;
if scrhelp[locatx,locaty-1]=3 then locaty:=locaty-1;
if scrhelp[locatx,locaty-1]=3 then locaty:=locaty-1;

if scrhelp[locatx-1,locaty]=3 then locatx:=locatx-1;
if scrhelp[locatx-1,locaty]=3 then locatx:=locatx-1;

if scrhelp[locatx,locaty-1]=3 then locaty:=locaty-1;
if scrhelp[locatx,locaty-1]=3 then locaty:=locaty-1;
if scrhelp[locatx,locaty-1]=3 then locaty:=locaty-1;
if scrhelp[locatx,locaty-1]=3 then locaty:=locaty-1;

locatx:=locatx+1;

if scrhelp[locatx+1,locaty]=3 then locatx:=locatx+1;

scr[locatx,locaty]:=178+7*256;
scr[locatx,locaty+1]:=178+7*256;
scr[locatx,locaty+2]:=178+7*256;
scr[locatx,locaty+3]:=178+7*256;
scr[locatx,locaty+4]:=178+7*256;

scr[locatx-1,locaty]:=178+7*256;
scr[locatx-1,locaty+1]:=178+7*256;
scr[locatx-1,locaty+2]:=178+7*256;
scr[locatx-1,locaty+3]:=178+7*256;
scr[locatx-1,locaty+4]:=178+7*256;

scr[locatx-2,locaty+2]:=178+7*256;

scr[locatx-3,locaty+1]:=178+7*256;
scr[locatx-3,locaty+2]:=178+7*256;
scr[locatx-3,locaty+3]:=178+7*256;
delay(10);
scr[locatx,locaty]:=177+7*256;
scr[locatx,locaty+1]:=177+7*256;
scr[locatx,locaty+2]:=177+7*256;
scr[locatx,locaty+3]:=177+7*256;
scr[locatx,locaty+4]:=177+7*256;

scr[locatx-1,locaty]:=177+7*256;
scr[locatx-1,locaty+1]:=177+7*256;
scr[locatx-1,locaty+2]:=177+7*256;
scr[locatx-1,locaty+3]:=177+7*256;
scr[locatx-1,locaty+4]:=177+7*256;

scr[locatx-2,locaty+2]:=177+7*256;

scr[locatx-3,locaty+1]:=177+7*256;
scr[locatx-3,locaty+2]:=177+7*256;
scr[locatx-3,locaty+3]:=177+7*256;
delay(10);
scr[locatx,locaty]:=176+7*256;
scr[locatx,locaty+1]:=176+7*256;
scr[locatx,locaty+2]:=176+7*256;
scr[locatx,locaty+3]:=176+7*256;
scr[locatx,locaty+4]:=176+7*256;

scr[locatx-1,locaty]:=176+7*256;
scr[locatx-1,locaty+1]:=176+7*256;
scr[locatx-1,locaty+2]:=176+7*256;
scr[locatx-1,locaty+3]:=176+7*256;
scr[locatx-1,locaty+4]:=176+7*256;

scr[locatx-2,locaty+2]:=176+7*256;

scr[locatx-3,locaty+1]:=176+7*256;
scr[locatx-3,locaty+2]:=176+7*256;
scr[locatx-3,locaty+3]:=176+7*256;
delay(10);
scr[locatx,locaty]:=0;
scr[locatx,locaty+1]:=0;
scr[locatx,locaty+2]:=0;
scr[locatx,locaty+3]:=0;
scr[locatx,locaty+4]:=0;

scr[locatx-1,locaty]:=0;
scr[locatx-1,locaty+1]:=0;
scr[locatx-1,locaty+2]:=0;
scr[locatx-1,locaty+3]:=0;
scr[locatx-1,locaty+4]:=0;

scr[locatx-2,locaty+2]:=0;

scr[locatx-3,locaty+1]:=0;
scr[locatx-3,locaty+2]:=0;
scr[locatx-3,locaty+3]:=0;
scrhelp[locatx,locaty]:=0;
scrhelp[locatx,locaty+1]:=0;
scrhelp[locatx,locaty+3]:=0;
scrhelp[locatx,locaty+2]:=0;
scrhelp[locatx,locaty+4]:=0;

scrhelp[locatx-1,locaty]:=0;
scrhelp[locatx-1,locaty+1]:=0;
scrhelp[locatx-1,locaty+2]:=0;
scrhelp[locatx-1,locaty+3]:=0;
scrhelp[locatx-1,locaty+4]:=0;

scrhelp[locatx-2,locaty+2]:=0;

scrhelp[locatx-3,locaty+1]:=0;
scrhelp[locatx-3,locaty+2]:=0;
scrhelp[locatx-3,locaty+3]:=0;

end;

{---------------------------------------------------------------------------}
procedure zadantank(locatx,locaty:integer);

begin
if scrhelp[locatx-1,locaty]=5 then locatx:=locatx-1;
if scrhelp[locatx-1,locaty]=5 then locatx:=locatx-1;
if scrhelp[locatx-1,locaty]=5 then locatx:=locatx-1;
if scrhelp[locatx,locaty-1]=5 then locaty:=locaty-1;
if scrhelp[locatx,locaty-1]=5 then locaty:=locaty-1;

scr[locatx,locaty]:=178+136+256;
scr[locatx,locaty+1]:=178+136+256;
scr[locatx,locaty+2]:=178+136+256;

scr[locatx+1,locaty]:=178+136+256;
scr[locatx+1,locaty+1]:=178+136+256;
scr[locatx+1,locaty+2]:=178+136+256;

scr[locatx+2,locaty]:=178+136+256;
scr[locatx+2,locaty+1]:=178+136+256;
scr[locatx+2,locaty+2]:=178+136+256;

scr[locatx+3,locaty+1]:=178+136+256;


delay(10);
scr[locatx,locaty]:=177+136+256;
scr[locatx,locaty+1]:=177+136+256;
scr[locatx,locaty+2]:=177+136+256;

scr[locatx+1,locaty]:=177+136+256;
scr[locatx+1,locaty+1]:=177+136+256;
scr[locatx+1,locaty+2]:=177+136+256;

scr[locatx+2,locaty]:=177+136+256;
scr[locatx+2,locaty+1]:=177+136+256;
scr[locatx+2,locaty+2]:=177+136+256;

scr[locatx+3,locaty+1]:=177+136+256;


delay(10);
scr[locatx,locaty]:=176+136+256;
scr[locatx,locaty+1]:=176+136+256;
scr[locatx,locaty+2]:=176+136+256;

scr[locatx+1,locaty]:=176+136+256;
scr[locatx+1,locaty+1]:=176+136+256;
scr[locatx+1,locaty+2]:=176+136+256;

scr[locatx+2,locaty]:=176+136+256;
scr[locatx+2,locaty+1]:=176+136+256;
scr[locatx+2,locaty+2]:=176+136+256;

scr[locatx+3,locaty+1]:=176+136+256;

delay(10);
scr[locatx,locaty]:=0;
scr[locatx,locaty+1]:=0;
scr[locatx,locaty+2]:=0;

scr[locatx+1,locaty]:=0;
scr[locatx+1,locaty+1]:=0;
scr[locatx+1,locaty+2]:=0;

scr[locatx+2,locaty]:=0;
scr[locatx+2,locaty+1]:=0;
scr[locatx+2,locaty+2]:=0;

scr[locatx+3,locaty+1]:=0;

scrhelp[locatx,locaty]:=0;
scrhelp[locatx,locaty+1]:=0;
scrhelp[locatx,locaty+2]:=0;

scrhelp[locatx+1,locaty]:=0;
scrhelp[locatx+1,locaty+1]:=0;
scrhelp[locatx+1,locaty+2]:=0;

scrhelp[locatx+2,locaty]:=0;
scrhelp[locatx+2,locaty+1]:=0;
scrhelp[locatx+2,locaty+2]:=0;

scrhelp[locatx+3,locaty+1]:=0;


end;
{---------------------------------------------------------------------------}
procedure eplane(locatx,locaty:integer);

begin
scr[locatx,locaty]:=2011;
scr[locatx,locaty-2]:=1796-256;
scr[locatx,locaty+2]:=1796-256;

scr[locatx-1,locaty-2]:=2011;
scr[locatx-1,locaty-1]:=2011;
scr[locatx-1,locaty]:=2011;
scr[locatx-1,locaty+1]:=2011;
scr[locatx-1,locaty+2]:=2011;

scr[locatx-2,locaty]:=2011;

scr[locatx-3,locaty-1]:=2011;
scr[locatx-3,locaty]:=2011;
scr[locatx-3,locaty+1]:=2011;


scrhelp[locatx,locaty-1]:=3;
scrhelp[locatx,locaty-2]:=3;
scrhelp[locatx,locaty]:=3;
scrhelp[locatx,locaty+1]:=3;
scrhelp[locatx,locaty+2]:=3;

scrhelp[locatx-1,locaty-2]:=3;
scrhelp[locatx-1,locaty-1]:=3;
scrhelp[locatx-1,locaty]:=3;
scrhelp[locatx-1,locaty+1]:=3;
scrhelp[locatx-1,locaty+2]:=3;

scrhelp[locatx-2,locaty]:=3;

scrhelp[locatx-3,locaty-1]:=3;
scrhelp[locatx-3,locaty]:=3;
scrhelp[locatx-3,locaty+1]:=3;


end;

{---------------------------------------------------------------------------}
procedure plane(locatx,locaty:integer);

begin

scr[locatx,locaty+1]:=1499;
scr[locatx,locaty+2]:=1499;
scr[locatx,locaty+3]:=1499;

scr[locatx-1,locaty+2]:=1499;

scr[locatx-2,locaty]:=1499;
scr[locatx-2,locaty+1]:=1499;
scr[locatx-2,locaty+2]:=1499;
scr[locatx-2,locaty+3]:=1499;
scr[locatx-2,locaty+4]:=1499;

scr[locatx-3,locaty+2]:=1499;

scrhelp[locatx,locaty+1]:=1;
scrhelp[locatx,locaty+2]:=1;
scrhelp[locatx,locaty+3]:=1;

scrhelp[locatx-1,locaty+2]:=1;

scrhelp[locatx-2,locaty]:=1;
scrhelp[locatx-2,locaty+1]:=1;
scrhelp[locatx-2,locaty+2]:=1;
scrhelp[locatx-2,locaty+3]:=1;
scrhelp[locatx-2,locaty+4]:=1;

scrhelp[locatx-3,locaty+2]:=1;

end;

{----------------------------------------------------------------------------}

procedure tank(locatx,locaty:integer);
var w1,w2:integer;

begin

scr[locatx,locaty+1]:=219+2*256;

scr[locatx-1,locaty]:=219+4*256;
scr[locatx-1,locaty+1]:=219+2*256;
scr[locatx-1,locaty+2]:=219+4*256;

scr[locatx-2,locaty]:=219+4*256;
scr[locatx-2,locaty+1]:=8+2*256;
scr[locatx-2,locaty+2]:=219+4*256;

scr[locatx-3,locaty]:=219+4*256;
scr[locatx-3,locaty+1]:=219+4*256;
scr[locatx-3,locaty+2]:=219+4*256;

scrhelp[locatx,locaty+1]:=5;

scrhelp[locatx-1,locaty]:=5;
scrhelp[locatx-1,locaty+1]:=5;
scrhelp[locatx-1,locaty+2]:=5;

scrhelp[locatx-2,locaty]:=5;
scrhelp[locatx-2,locaty+1]:=5;
scrhelp[locatx-2,locaty+2]:=5;

scrhelp[locatx-3,locaty]:=5;
scrhelp[locatx-3,locaty+1]:=5;
scrhelp[locatx-3,locaty+2]:=5;

end;

{---------------------------------------------------------------------------}
var lpetrol:integer;

procedure ppetrol(order:integer);
var w1,w2:integer;
begin
petrol:=petrol+order;
if petrol>999 then petrol:=999;
if order<0 then
scr[50-lpetrol,2]:=0 else
for w1:=0 to (order div 20)-1 do
scr[50-lpetrol-w1,2]:=219+2*256;

lpetrol:=petrol div 20;
scr[50-lpetrol,2]:=219+4*256;


end;

{---------------------------------------------------------------------------}
procedure zadanpetrol(i,j:integer);
begin
if  scrhelp[x+i,y+j]=6  then
begin
  scr[x+i,y+j]:=0;
  scrhelp[x+i,y+j]:=0;
end;
end;

var

ordereplane,orderspeed:integer;
pospetrol,orderpetrol,help,tir,speed,poseplane:integer;
dakhel,flag2,flag:boolean;


label 1,2;{,3,4,5,6,7,8,9;}
begin
textcolor(green);
orderpetrol:=1;
petrol:=1000;
tir:=45;
speed:=25;
randomize;
clrscr;





{textcolor(7);
gotoxy(10,40);
while  ord(k)<>27 do
begin
k:=readkey;
scr[25,40]:=w1+3*256;
write(w1,' ');
w1:=w1+1;
end;}

for w1:=2 to 49  do
begin
scr[w1,15]:=219+7*256;
scr[w1,65]:=219+7*256;
scrhelp[w1,15]:=2;
scrhelp[w1,65]:=2;
scr[w1,2]:=219+2*256;
end;
scr[50,2]:=219+2*256;

eplane(33,33);


plane(49,40);

y:=40;
x:=49;

dotarafejade;


while ord(k)<>13 do
begin
k:=readkey;
if ord(k)=72 then k:=' ';
if ord(k)=0 then k:=readkey;



while (not keypressed) or dakhel do
begin
  if petrol<1 then goto 1;
  orderspeed:=orderspeed+1;
  if orderspeed=1000 then orderspeed:=0;
  delay(speed);
  dotabalae;

  if (ord(k)=65+32)or(ord(k)=65) then
  begin
  flag:=true;
  k:=' ';
  end  else flag:=false;

  if flag then
  begin
    scrhelp[x-4,y+2]:=4;
    scr[x-4,y+2]:=23+6*256;
  end;

  if (ord(k)=75) and (y>16) then                   {harekat be chap va check kardane zadan}
  begin                                            {------------------~-------------------}
  if (scrhelp[x-2,y-1]=6) or                       {------------------~-------------------}
  (scrhelp[x-1,y+1]=6) or (scrhelp[x,y]=6) then
  begin
    ppetrol(100);
    zadanpetrol(-2,-1);zadanpetrol(-1,1);zadanpetrol(0,0);
  end else
  if (scrhelp[x-2,y-1]=0) and                      {------------------~-------------------}
  (scrhelp[x-1,y+1]=0) and (scrhelp[x,y]=0) then   {------------------~-------------------}
  begin                                            {------------------~-------------------}
    ppetrol(-1);
    siyahkon(x,y);                                 {------------------~-------------------}
    y:=y-1;                                        {------------------~-------------------}
    plane(x,y);                                    {------------------~-------------------}
    k:=' ';                                        {------------------~-------------------}
  end else goto 1;                                 {------------------~-------------------}
  end;                                             {------------------~-------------------}

  if (ord(k)=77) and (y<60) then                   {harekat be rast va check kardane zadan}
  begin                                            {------------------~-------------------}
  if (scrhelp[x-2,y+5]=6) or                       {------------------~-------------------}
  (scrhelp[x-1,y+3]=6) or(scrhelp[x,y+4]=6)then
  begin
    ppetrol(100);
    zadanpetrol(-2,5);zadanpetrol(-1,3);zadanpetrol(0,4);
  end else
  if (scrhelp[x-2,y+5]=0) and                      {------------------~-------------------}
  (scrhelp[x-1,y+3]=0) and(scrhelp[x,y+4]=0)then   {------------------~-------------------}
  begin                                            {------------------~-------------------}
    ppetrol(-1);
    siyahkon(x,y);                                 {------------------~-------------------}
    y:=y+1;                                        {------------------~-------------------}
    plane(x,y);                                    {------------------~-------------------}
    k:=' ';                                        {------------------~-------------------}
  end else goto 1;                                 {------------------~-------------------}
  end;                                             {------------------~-------------------}


 if (ord(k)=72) and (x>5) then                     {harekat be bala va check kardane zadan}
  begin                                            {------------------~-------------------}
  if (scrhelp[x-3,y]=6) or                         {------------------~-------------------}
  (scrhelp[x-3,y+1]=6) or (scrhelp[x-4,y+2]=6) or  {------------------~-------------------}
  (scrhelp[x-3,y+3]=6) or (scrhelp[x-3,y+4]=6)then
  begin
    ppetrol(100);
    zadanpetrol(-3,0);zadanpetrol(-3,1);zadanpetrol(-4,2);
    zadanpetrol(-3,3);zadanpetrol(-3,4);
  end else
  if (scrhelp[x-3,y]=0) and                        {------------------~-------------------}
  (scrhelp[x-3,y+1]=0) and(scrhelp[x-4,y+2]=0) and {------------------~-------------------}
  (scrhelp[x-3,y+3]=0) and(scrhelp[x-3,y+4]=0)then
  begin                                            {------------------~-------------------}
    ppetrol(-1);
    siyahkon(x,y);                                 {------------------~-------------------}
    x:=x-1;                                        {------------------~-------------------}
    plane(x,y);                                    {------------------~-------------------}
    k:=' ';                                        {------------------~-------------------}
  end else goto 1;                                 {------------------~-------------------}
  end;


 if (ord(k)=80) and (x<49) then                    {harekat be paen va check kardane zadan}
  begin                                            {------------------~-------------------}
  if (scrhelp[x+1,y+1]=6) or                       {------------------~-------------------}
  (scrhelp[x+1,y+2]=6) or (scrhelp[x+1,y+3]=6) or  {------------------~-------------------}
  (scrhelp[x-1,y]=6) or  (scrhelp[x-1,y+4]=6)then
  begin
    ppetrol(100);
    zadanpetrol(1,1);zadanpetrol(1,2);zadanpetrol(1,3);
    zadanpetrol(-1,0);zadanpetrol(-1,4);
  end else
  if (scrhelp[x+1,y+1]=0) and                      {------------------~-------------------}
  (scrhelp[x+1,y+2]=0) and(scrhelp[x+1,y+3]=0) and {------------------~-------------------}
  (scrhelp[x-1,y]=0) and(scrhelp[x-1,y+4]=0)then   {------------------~-------------------}
  begin                                            {------------------~-------------------}
    ppetrol(-1);
    siyahkon(x,y);                                 {------------------~-------------------}
    x:=x+1;                                        {------------------~-------------------}
    plane(x,y);                                    {------------------~-------------------}
    k:=' ';                                        {------------------~-------------------}
  end else goto 1;                                 {------------------~-------------------}
  end;




   if ord(k)=96 then
   begin
     speed:=speed*2 div 5;
     if speed<5 then speed:=5;
   end else if  ord(k)=9 then speed:=25;

   {if ord(k)=80 then
   begin
     speed:=speed*10 div 3;
     if speed>200 then speed:=200;
     k:=' ';
   end;}

  if orderspeed mod 6=0 then                                {chek kardan baraye bishtar boodane speed}
  begin                                               {-------------------~--------------------}
    ppetrol(-1);
    if ordereplane mod 10=0 then
    begin
      poseplane:=random(45)+18;
      eplane(5,poseplane);
      ordereplane:=ordereplane+1;
    end;
    ordereplane:=ordereplane+1;


    if orderpetrol mod 77=0 then
    begin
      pospetrol:=random(45)+16;
      scr[4,pospetrol]:=80+4*256;
      scrhelp[4,pospetrol]:=6;
      orderpetrol:=1+orderpetrol;
    end;
    orderpetrol:=1+orderpetrol;

    dakhel:=false;
    for w1:=2 to 49 do for w2:=15 to 65 do
    begin
    dakhel:=true;
    if (scrhelp[w1,w2]=4) and (scrhelp[w1-1,w2]=1) then goto 1;
    if (scrhelp[w1,w2]=4) then
    if (scrhelp[w1-1,w2]<>3) then
      begin
        scrhelp[w1-1,w2]:=4;
        scr[w1-1,w2]:=23+6*256;
        scrhelp[w1,w2]:=0;
        scr[w1,w2]:=0;
      end
      else
        begin
        scrhelp[w1,w2]:=0;
        scr[w1,w2]:=0;
        zadaneplane(w1,w2);
        goto 2;
     end;
     end;
2:
    dakhel:=false;
    for w1:=49 downto 2 do                            {     paen ovordane    }
    for w2:=15 to 65 do                               {----------~-----------}
    begin                                             {----------~-----------}

      if (scrhelp[w1,w2]=3)or(scrhelp[w1,w2]=6)then   {chek karane paen ovorane ghayr az plane}
      begin                                           {------------------~--------------------}
        if (scrhelp[w1+1,w2]<>4) then
        if (scrhelp[w1+1,w2]<>1) then                 {chek kardane  inke  mitone biyare ya na}
        begin                                         {------------------~--------------------}
          if scrhelp[w1,w2]=2 then                    {   chek kardane  inke chi paen miyare  }
          begin                                       {               paen ovordan            }
            scr[w1+1,w2]:=scr[w1,w2];                 {------------------~--------------------}
            scrhelp[w1+1,w2]:=2;                      {------------------~--------------------}
          end;                                        {------------------~--------------------}
          if scrhelp[w1,w2]=3 then                    {   chek kardane  inke chi paen miyare  }
          begin                                       {               paen ovordan            }
            scr[w1+1,w2]:=scr[w1,w2];                 {------------------~--------------------}
            scrhelp[w1+1,w2]:=3;                      {------------------~--------------------}
          end;                                        {------------------~--------------------}
          if scrhelp[w1,w2]=6 then
          begin
            scr[w1+1,w2]:=scr[w1,w2];
            scrhelp[w1+1,w2]:=6;
          end;
          scr[w1,w2]:=0;                              {siyah kardane balaye oni ke paen ovorde}
          scrhelp[w1,w2]:=0;                          {------------------~--------------------}
        end                                           {------------------~--------------------}
        else if(scrhelp[w1,w2]=3)or(scrhelp[w1,w2]=2) {agar zire on jaee ke hast plane bashe exit mishe}
        then {if scrhelp[w1+1,w2]<>4 then} goto 1;
      end;                                            {---------------------------------------}
    end;                                              {---------------------------------------}
  {orderspeed:=orderspeed+1;}                         {ezafe kardane baraye speede bishtare plane}
  end                                                 {ezafe kardane baraye speede bishtare plane}
 end;                                                 {---------------------------------------}
end;                                                  {---------------------------------------}

1:
{clrscr;}
gotoxy (40,25);
writeln ('you lose');
readkey;

end.
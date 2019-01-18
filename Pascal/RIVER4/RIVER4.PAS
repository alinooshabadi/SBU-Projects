{ 1 : plane
  2 : divar
  3 : tank
  4 : tir}

program river_ride;

uses crt;

var
scr:array[1..50,1..80] of word absolute $b800:000;
scrhelp:array[1..50,1..80] of integer;
w1,w2,w3,w4,w5,w6,w7,w8,w9,w0:integer;
highttank:integer;
k:char;

function zadanchecker(y:integer):boolean;
var w1:integer;flag:boolean;
begin
  highttank:=0;
  w1:=46;flag:=false;
  while (not flag) and (w1>1) do
  begin
    if scrhelp[w1,y]=3 then flag:=true;
    w1:=w1-1;
  end;
  zadanchecker:=flag;
  {if w1>2 then} highttank:=w1+1;
end;

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

procedure dotabalae;
begin
scr[2,15]:=2011;
scr[2,65]:=2011;
scrhelp[2,15]:=2;
scrhelp[2,65]:=2;
end;

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


procedure zadantank(locatx,locaty:integer);
var
w1,w2:integer;

begin
if scrhelp[locatx-1,locaty]=3 then locatx:=locatx-1;
if scrhelp[locatx-1,locaty]=3 then locatx:=locatx-1;
if scrhelp[locatx-1,locaty]=3 then locatx:=locatx-1;
if scrhelp[locatx,locaty-1]=3 then locaty:=locaty-1;
if scrhelp[locatx,locaty-1]=3 then locaty:=locaty-1;

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


procedure plane(locatx,locaty:integer);
var
w1,w2:integer;
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

scrhelp[locatx,locaty+1]:=3;

scrhelp[locatx-1,locaty]:=3;
scrhelp[locatx-1,locaty+1]:=3;
scrhelp[locatx-1,locaty+2]:=3;

scrhelp[locatx-2,locaty]:=3;
scrhelp[locatx-2,locaty+1]:=3;
scrhelp[locatx-2,locaty+2]:=3;

scrhelp[locatx-3,locaty]:=3;
scrhelp[locatx-3,locaty+1]:=3;
scrhelp[locatx-3,locaty+2]:=3;

end;



var
x,y:integer;
ordertank,orderspeed:integer;
help,tir,speed,postank:integer;
dakhel,flag2,flag:boolean;


label 1,2;{,3,4,5,6,7,8,9;}
begin
tir:=45;
speed:=25;
randomize;
clrscr;
tank (23,44);

{while  ord(k)<>27 do
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
end;



plane(49,40);

y:=40;
x:=49;

dotarafejade;

while ord(k)<>13 do
begin
k:=readkey;
if ord(k)=72 then k:=' ';
if ord(k)=0 then k:=readkey;

if (ord(k)=82) then flag:=true else flag:=false;
  if flag then
  begin
    scrhelp[x-4,y+2]:=4;
    scr[x-4,y+2]:=23+6*256;
  end;
while (not keypressed) or dakhel do
begin
  orderspeed:=orderspeed+1;
  if orderspeed=1000 then orderspeed:=0;
  delay(speed);
  dotabalae;

  if (ord(k)=75) and (y>16) then                   {harekat be chap va check kardane zadan}
  begin                                            {------------------~-------------------}
  if (scrhelp[x-2,y-1]=0) and                       {------------------~-------------------}
  (scrhelp[x-1,y+1]=0) and (scrhelp[x,y]=0) then   {------------------~-------------------}
  begin                                            {------------------~-------------------}
    siyahkon(x,y);                                {------------------~-------------------}
    y:=y-1;                                        {------------------~-------------------}
    plane(x,y);                                   {------------------~-------------------}
    k:=' ';                                        {------------------~-------------------}
  end else goto 1;                                 {------------------~-------------------}
  end;                                             {------------------~-------------------}

  if (ord(k)=77) and (y<60) then                   {harekat be rast va check kardane zadan}
  begin                                            {------------------~-------------------}
  if (scrhelp[x-2,y+5]=0) and                       {------------------~-------------------}
  (scrhelp[x-1,y+3]=0) and(scrhelp[x,y+4]=0)then   {------------------~-------------------}
  begin                                            {------------------~-------------------}
    siyahkon(x,y);                                {------------------~-------------------}
    y:=y+1;                                        {------------------~-------------------}
    plane(x,y);                                   {------------------~-------------------}
    k:=' ';                                        {------------------~-------------------}
  end else goto 1;                                 {------------------~-------------------}
  end;                                             {------------------~-------------------}


 if (ord(k)=72) and (x>5) then                     {harekat be bala va check kardane zadan}
  begin                                            {------------------~-------------------}
  if (scrhelp[x-3,y]=0) and                        {------------------~-------------------}
  (scrhelp[x-3,y+1]=0) and(scrhelp[x-4,y+2]=0) and {------------------~-------------------}
  (scrhelp[x-3,y+3]=0) and(scrhelp[x-3,y+4]=0)then
  begin                                            {------------------~-------------------}
    siyahkon(x,y);                                 {------------------~-------------------}
    x:=x-1;                                        {------------------~-------------------}
    plane(x,y);                                    {------------------~-------------------}
    k:=' ';                                        {------------------~-------------------}
  end else goto 1;                                 {------------------~-------------------}
  end;


 if (ord(k)=80) and (x<49) then                    {harekat be paen va check kardane zadan}
  begin                                            {------------------~-------------------}
  if (scrhelp[x+1,y+1]=0) and                      {------------------~-------------------}
  (scrhelp[x+1,y+2]=0) and(scrhelp[x+1,y+3]=0) and {------------------~-------------------}
  (scrhelp[x-1,y]=0) and(scrhelp[x-1,y+4]=0)then   {------------------~-------------------}
  begin                                            {------------------~-------------------}
    siyahkon(x,y);                                 {------------------~-------------------}
    x:=x+1;                                        {------------------~-------------------}
    plane(x,y);                                    {------------------~-------------------}
    k:=' ';                                        {------------------~-------------------}
  end else goto 1;                                 {------------------~-------------------}
  end;



  {zadanchecker(help);
  if (ord(k)=82) then
  begin
    k:=' ';
    if not flag2 then
    begin
      flag:=true;
      zadanchecker(y+2);
      flag2:=true;
      help:=y+2;

    end else
        begin
          scr[tir,help]:=0;
          if scrhelp[tir-1,help]=3 then zadantank(tir-1,help);
          if scrhelp[tir+1,help]=3 then zadantank(tir+1,help);
          if scrhelp[tir,help-1]=3 then zadantank(tir,help-1);
          if scrhelp[tir,help+1]=3 then zadantank(tir,help+1);
          tir:=45;
          flag2:=false;
        end;
  end else flag:=false;


  {if orderspeed mod 3=0 then}
  {if flag2 then
  begin
    tir:=tir-1;
    scr[tir,help]:=23+6*256;
    scr[tir+1,help]:=0;
    if (tir=highttank) and (tir>2) then
    begin
      scr[tir+1,help]:=0;
      zadantank(tir,help);
      tir:=45;
      flag2:=false;
    end; {else scr[tir,help]:=0;}

    {if tir<2 then
    begin
      tir:=45;
      flag2:=false;
    end;
  end;
  if tir<2 then
  begin
    tir:=45;
    flag2:=false;
  end;}

   if ord(k)=96 then
   begin
     speed:=speed*2 div 5;
     if speed<5 then speed:=5;
   end else if  ord(k)=9 then speed:=50;

   {if ord(k)=80 then
   begin
     speed:=speed*10 div 3;
     if speed>200 then speed:=200;
     k:=' ';
   end;}

  if orderspeed mod 6=0 then                                {chek kardan baraye bishtar boodane speed}
  begin                                               {-------------------~--------------------}

    if ordertank mod 10=0 then
    begin
      postank:=random(47)+16;
      tank(5,postank);
      ordertank:=ordertank+1;
    end;
    ordertank:=ordertank+1;

    dakhel:=false;
    for w1:=2 to 49 do for w2:=15 to 65 do
    begin
    dakhel:=true;
    if (scrhelp[w1,w2]=4) and (scrhelp[w1-1,w2]=1) then goto 1;
    if (scrhelp[w1,w2]=4) then
    if (scrhelp[w1-1,w2]<>3) then
      begin
        scrhelp[w1-1,w2]:=4;
        scrhelp[w1,w2]:=0;
        scr[w1-1,w2]:=23+6*256;
        scr[w1,w2]:=0;
      end
      else
        begin
        zadantank(w1-1,w2);
        scrhelp[w1,w2]:=0;
        scr[w1,w2]:=0;
        goto 2;
     end;
     end;
2:
    dakhel:=false;
    for w1:=49 downto 2 do                            {     paen ovordane    }
    for w2:=15 to 65 do                               {----------~-----------}
    begin                                             {----------~-----------}

      if(scrhelp[w1,w2]<>1)and(scrhelp[w1,w2]<>0)and(scrhelp[w1,w2]<>4)then {chek karane paen ovorane ghayr az plane}
      begin                                           {------------------~--------------------}
        if (scrhelp[w1+1,w2]<>4)  then
        if (scrhelp[w1+1,w2]<>1)  then                {chek kardane  inke  mitone biyare ya na}
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
          scr[w1,w2]:=0;                              {siyah kardane balaye oni ke paen ovorde}
          scrhelp[w1,w2]:=0;                          {------------------~--------------------}
        end                                           {------------------~--------------------}
        else if(scrhelp[w1,w2]=3)or(scrhelp[w1,w2]=2) {agar zire on jaee ke hast plane bashe exit mishe}
        then if scrhelp[w1+1,w2]<>4 then goto 1;
      end;                                            {---------------------------------------}
    end;                                              {---------------------------------------}
  {orderspeed:=orderspeed+1;}                           {ezafe kardane baraye speede bishtare plane}
  end                                                 {ezafe kardane baraye speede bishtare plane}
 end;                                                 {---------------------------------------}
end;                                                  {---------------------------------------}

1:
clrscr;
gotoxy (40,25);
writeln ('you lose');
readln;

end.
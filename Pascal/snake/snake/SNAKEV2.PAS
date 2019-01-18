program snakev2;

uses crt;

var
endosnakei,endosnakej,toposnakei,toposnakej:integer;
p:boolean;
k:char;
w4:longint;
w7,w8,w5,w6,k1,w3,i,j,w1,w2:integer;
snake:array [1..50,1..80] of word absolute $B800:0000;
snake2:array [1..50,1..80] of word;

procedure  rangecheck(x,y:integer);
begin
if  x<=1 then  exit;
if  y<=1 then  exit;
if  x>49 then  exit;
if  y>79 then  exit;
end;

procedure pakkon(x,y:integer);
var
t:boolean;
w10,w9:integer;
begin
while (snake2[x,y]=1499) and (t) do
for w9:=1 to 4 do
begin
if snake2[x-1,y]=1499then
begin
if w9=1 then
begin
snake2[x,y]:=1;
x:=x-1;
end;
end
else
if snake2[x,y+1]=1499 then
begin
if w9=2 then
begin
snake2[x,y]:=1;
y:=y+1;
end;
end
else
if snake2[x+1,y]=1499 then
begin
if w9=3 then
begin
snake2[x,y]:=1;
x:=x+1;
end;
end
else
if snake2[x,y-1]=1499 then
begin
if w9=4 then
begin
snake2[x,y]:=1;
y:=y-1;
end;
end
else
t:=false
end;
snake[x,y]:=0;
snake2[x,y]:=0;

for w9:=1 to 50 do for w10:=1 to 80 do if snake2[w9,w10]=1 then snake2[w9,w10]:=1499;
end;




begin

for i:=1 to 50 do for j:=1 to 80 do
begin
snake[i,j]:=0;
snake2[i,j]:=0;
end;
toposnakei:=25;
toposnakej:=40;
w2:=25;
w3:=40;

w4:=w4+1;


while ord(k)<>27 do
begin
rangecheck(toposnakei,toposnakej);
k1:=ord(k);
k:=readkey;
if ord(k)=0  then k:=readkey;


if (ord(k)=80) and (k1<>72)then
while (keypressed=false) and (snake2[toposnakei+1,toposnakej]<>1499) do
begin
rangecheck(toposnakei,toposnakej);
if w4>20 then pakkon(toposnakei,toposnakej);
w4:=w4+1;
w2:=w2+1;
toposnakei:=+w2;
snake[toposnakei,toposnakej]:=219+5*256;
snake2[toposnakei,toposnakej]:=snake[toposnakei,toposnakej];
delay(100);
{if snake2[toposnakei+1,toposnakej]=1499 then exit;}
end;

if (ord(k)=77) and (k1<>75) then
while (keypressed=false) and (snake2[toposnakei,toposnakej+1]<>1499)  do
begin
rangecheck(toposnakei,toposnakej);
if w4>20 then pakkon(toposnakei,toposnakej);
w4:=w4+1;
w3:=w3+1;
toposnakej:=+w3;
snake[toposnakei,toposnakej]:=219+5*256;
snake2[toposnakei,toposnakej]:=snake[toposnakei,toposnakej];
delay(100);
{if snake2[toposnakei,toposnakej+1]=1499 then exit;}
end;

if (ord(k)=75)  and (k1<>77)then
while (keypressed=false) and (snake2[toposnakei,toposnakej-1]<>1499) do
begin
rangecheck(toposnakei,toposnakej);
if w4>20 then pakkon(toposnakei,toposnakej);
w4:=w4+1;
w3:=w3-1;
toposnakej:=w3;
snake[toposnakei,toposnakej]:=219+5*256;
snake2[toposnakei,toposnakej]:=snake[toposnakei,toposnakej];
delay(100);
{if snake2[toposnakei,toposnakej-1]=1499 then exit;}
end;

if (ord(k)=72) and (k1<>80) then
while (keypressed=false) and  (snake2[toposnakei-1,toposnakej]<>1499) do
begin
rangecheck(toposnakei,toposnakej);
if w4>20 then pakkon(toposnakei,toposnakej);
w4:=w4+1;
w2:=w2-1;
toposnakei:=w2;
snake[toposnakei,toposnakej]:=219+5*256;
snake2[toposnakei,toposnakej]:=snake[toposnakei,toposnakej];
delay(100);
{if snake2[toposnakei-1,toposnakej]<>1499 then exit;}
end;

end;
end.
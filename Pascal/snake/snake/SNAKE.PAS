uses crt,graph;
var a,b,bb,x,y,i,jx,jy:integer;
    xx,yy:array[1..1000] of integer;
    c:char;
    n:boolean;
begin
     initgraph(a,b,'');
     randomize;
     a:=1;
     i:=1;
     n:=false;
     x:=100;
     y:=240;
     rectangle(0,0,639,479);
     repeat
     jx:=random(640);
     jy:=random(480);
     if getpixel(jx,jy)=0 then begin
     for i:=-3 to 3 do begin
     putpixel(jx+i, jy, 14);
     putpixel(jx,jy+i,14);
     end;
     a:=1; end else a:=0;
     until a=1;
     i:=1;
     repeat
     a:=a+1;
     if a=150*i+1 then a:=1;
     if n=false then x:=x+1;
     if ord(c)=72 then y:=y-1;
     if ord(c)=75 then x:=x-1;
     if ord(c)=77 then x:=x+1;
     if ord(c)=80 then y:=y+1;
     if getpixel(x,y)=15 then c:='x';
     if getpixel(x,y)=14 then begin
     for b:=y-10 to y+10 do begin
     for bb:=x-10 to x+10 do
     if getpixel(bb,b)=14 then putpixel(bb,b,0);
     end;
     repeat
     jx:=random(640);
     jy:=random(480);
     if getpixel(jx,jy)=0 then begin
     for b:=-3 to 3 do begin
     putpixel(jx+b, jy, 14);
     putpixel(jx,jy+b,14);
     end;
     b:=1; end else b:=0;
     until b=1;
     i:=i+1;
     end;
     putpixel(x,y,15);
     delay(15);
     putpixel(xx[a],yy[a],0);
     xx[a]:=x;
     yy[a]:=y;
     if keypressed then n:=true;
     if keypressed then c:=readkey;
     until (c='x') or (i=10);
     if c='x' then begin
     settextstyle(1,0,8);
     setcolor(9);
     outtextxy(150,200,'THE END...');
     end;
     if i=10 then begin
     setcolor(10);
     settextstyle(3,0,8);
     outtextxy(150,200,'CONGRATS!');
     end;
     delay(500);
     readkey;

     closegraph;
end.
                                                                
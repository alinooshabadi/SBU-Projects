{ ∞∞∞∞∞∞‹  ∞∞∞∞∞∞‹  ∞∞∞∞∞∞‹
    ∞∞€ﬂﬂ    ∞∞€ﬂﬂ  ∞∞€ﬂﬂﬂﬂ
    ∞∞€      ∞∞€    ∞∞€
    ∞∞€      ∞∞€    ∞∞€
    ∞∞€    ∞∞∞∞∞∞‹  ∞∞∞∞∞∞‹
     ﬂﬂ     ﬂﬂﬂﬂﬂﬂ   ﬂﬂﬂﬂﬂﬂ

           ∞∞∞∞∞∞‹  ∞∞∞∞∞∞‹  ∞∞∞∞∞∞‹
             ∞∞€ﬂﬂ  ∞∞€ﬂ∞∞€  ∞∞€ﬂﬂﬂﬂ
             ∞∞€    ∞∞∞∞∞∞€  ∞∞€
             ∞∞€    ∞∞€ﬂ∞∞€  ∞∞€
             ∞∞€    ∞∞€ ∞∞€  ∞∞∞∞∞∞‹
              ﬂﬂ     ﬂﬂ  ﬂﬂ   ﬂﬂﬂﬂﬂﬂ

                    ∞∞∞∞∞∞‹  ∞∞∞∞∞∞‹  ∞∞∞∞∞∞‹
                      ∞∞€ﬂﬂ  ∞∞€ﬂ∞∞€  ∞∞€ﬂﬂﬂﬂ
                      ∞∞€    ∞∞€ ∞∞€  ∞∞∞∞‹
                      ∞∞€    ∞∞€ ∞∞€  ∞∞€ﬂﬂ
                      ∞∞€    ∞∞∞∞∞∞€  ∞∞∞∞∞∞‹
                       ﬂﬂ     ﬂﬂﬂﬂﬂﬂ   ﬂﬂﬂﬂﬂﬂ
                                                 -by Alan Lobo
                                                 alanlobo@goatelecom.com  }
program tictactoe;
uses dos,crt,graph;

type fill=(_,x,o);
     nametype=string[10];

var                      mode:(easy,tough);
                         grid:array[1..3,1..3]of fill;
                        slots:set of 1..9;
             player1,computer:boolean;
                p1name,p2name:nametype;
        max,games,p1win,p2win,
          move1,lastmove,move:integer;

function checker:fill;forward;

function join(a,b:integer):integer;
var num:integer;
begin
case b of
     1:num:=0;
     2:num:=3;
     3:num:=6;
     end;
inc(num,a);
join:=num;
end;

procedure split(num:integer;var x,y:integer);
begin
case num of
     1..3:begin y:=1;x:=num  ;end;
     4..6:begin y:=2;x:=num-3;end;
     7..9:begin y:=3;x:=num-6;end;
     end;
end;

procedure introduction;
const pos:array[1..3,1..3,1..2]of integer=
          (((159,089),(159,199),(159,339)),
           ((279,089),(279,199),(279,339)),
           ((419,089),(419,199),(419,339)));
      gname:array[1..3,1..3]of char =('tic','tac','toe');
      mname:array[1..9]     of char ='alan lobo';
       size:array[0..10]    of word =(3,6,20,6,6,5,6,6,6,4,4);

var style:array[1..3,1..3,1..2]of integer ;
    ct,i,j:integer;
    p:pointer;

begin
for i:=1 to 3 do
    for j:=1 to 3 do
        begin
        style[i,j,1]:=0;
        style[i,j,2]:=0
        end;
ct:=0;
setcolor(white);settextstyle(1,0,3);
outtextxy(380,430,'-by ');
repeat
inc(ct);
for i:=1 to 3 do  begin
    for j:=1 to 3 do
        begin
        {the game}
        setcolor(black);
        settextstyle(style[i,j,1],0,size[style[i,j,1]]);
        moveto(pos[j,i,1],pos[j,i,2]);
        if style[i,j,2]=1 then outtext(upcase(gname[i,j]))
                          else outtext(gname[i,j]);
        style[i,j,1]:=random(11);
        style[i,j,2]:=random(2);
        repeat setcolor(1+random(15)) until getcolor<>8;
        settextstyle(style[i,j,1],0,size[style[i,j,1]]);
        moveto(pos[j,i,1],pos[j,i,2]);
        if style[i,j,2]=1 then outtext(upcase(gname[i,j]))
                          else outtext(gname[i,j]);
        {the game}
        {the author}
        setcolor(1+random(15));settextstyle(1,0,3);
        outtextxy(join(j,i)*20+430,430,upcase(mname[join(j,i)]));
        delay(100);
        setcolor(black);
        outtextxy(join(j,i)*20+430,430,upcase(mname[join(j,i)]));
        setcolor(1+random(15));
        outtextxy(join(j,i)*20+430,430,mname[join(j,i)]);
        {the author}
        if (ct>5)and(odd(join(i,j))) then
           begin
           setcolor(black);settextstyle(3,vertdir,3);
           outtextxy(5,80,'press any key to continue');
           delay(100);
           setcolor(yellow);
           outtextxy(5,80,'press any key to continue');
           end;
     end;
     repeat setcolor(1+random(15)) until getcolor<>8;
     setlinestyle(solidln,0,thickwidth);
     line(213,60 ,213,404);   { | }
     line(130,190,490,170);   {upper ---}
     line(130,305,490,305);   {lower ---}
     setlinestyle(UserBitLn, $C3, ThickWidth);
     ellipse(639,240,150,210,300,350);
     end;
until (keypressed)and(ct>=6);

GetMem(P,ImageSize(125,50,475,420));
GetImage(125,50,475,420,P^);
j:=50;
for i:=125 to 288  do
    begin
    if (i mod 4=0)or(i mod 6=0) then dec(j);
    PutImage(i,j,P^,NormalPut);
    end;
freemem(p,ImageSize(125,50,475,420));
while keypressed do readkey;
end;

procedure selection;
var level:1..6;

procedure level1choice;
begin
settextstyle(2,0,8);

if not computer then setcolor(yellow)else setcolor(black);
outtextxy(30,150,'One');

if computer then setcolor(yellow)else setcolor(black);
outtextxy(155,150,'Two');

setcolor(magenta);
if computer then moveto(0,150) else moveto(125,150);
outtext('Û');outtextxy(getx+textwidth('Abc'),gety,'Ú');

setcolor(white);
if not computer then moveto(0,150) else moveto(125,150);
outtext('Û');outtextxy(getx+textwidth('Abc'),gety,'Ú');
end;

procedure level2choice;
begin
settextstyle(2,0,8);

if mode=easy then setcolor(darkgray)else setcolor(lightcyan);
outtextxy(30,225,'Easy');

if mode=tough then setcolor(darkgray)else setcolor(lightcyan);
outtextxy(155,225,'Tough');

setcolor(darkgray);
if mode=easy then moveto(0,225) else moveto(125,225);
outtext('#[');outtextxy(getx+textwidth('Abcde'),gety,']');

setcolor(white);
if mode=tough then moveto(0,225) else moveto(125,225);
outtext('#[');outtextxy(getx+textwidth('Abcde'),gety,']');
end;

procedure theoptions;
var s:nametype;
begin
settextstyle(10,0,3);
setcolor(magenta);
outtextxy(40,10,'OPTIONS');

setlinestyle(solidln,0,thickwidth);
line(0,80,250,80);
line(0,110,250,110);

setcolor(black);
settextstyle(12,0,4);
outtextxy(50,85,concat(#26,'    to select'));
outtextxy(50,95,'Esc to finish');
level1choice;

bar( 5,375,250,400);{second player}
bar(25,300,250,325);{player1 name}
bar(25,400,250,425);{player2 name}
if not computer then bar( 0,200,250,252);{1 player mode}

settextstyle(1,0,1);

if level=1 then setcolor(lightred) else setcolor(lightgreen);
outtextxy(5,125,'Number of Players:');

if level=2 then setcolor(lightred) else setcolor(lightgreen);
outtextxy(5,200,'Mode of Play:');

if level=3 then setcolor(lightred) else setcolor(lightgreen);
outtextxy(5,275,'First Player''s Name:');

if level=4 then setcolor(lightred) else setcolor(lightgreen);
if computer then outtextxy(5,375,'Computer''s Name:')
            else outtextxy(5,375,'Second Player''s Name:');

if level=5 then setcolor(lightred) else setcolor(lightgreen);
outtextxy(5,450,'Number of Matches:');

setcolor(lightblue);settextstyle(8,0,2);
outtextxy(25,300,p1name);
outtextxy(25,400,p2name);
str(max,s);
outtextxy(200,450,s)
end;

procedure playermode;
var c:char;
begin
level1choice;
repeat
      c:=readkey;
      case c of
           #0:begin
                   c:=readkey;
                   case c of
                        #75:begin Computer:=true ;level1choice end;
                        #77:begin Computer:=false;level1choice end;
                        #80:begin
                                 if not computer then inc(level,2)
                                                 else inc(level);
                                 exit;
                                 end;
                        end;
                   end;
           #13:begin inc(level);exit;end;
           #27:begin level:=6; exit; end;
           end;
until false;
end;

procedure getthename(var name:nametype);
var i:0..10;
    c:char;
begin
i:=0;
settextstyle(8,0,2);
setfillstyle(solidfill,white);
bar(25,100*level,150,100*level+50);
repeat
      c:=readkey;
      case c of
           #0:begin
              c:=readkey;
              case c of
                   #72:begin
                            if(level=3)and(not computer)then dec(level,2)
                                                        else dec(level);
                            break;
                            end;
                   #80:begin inc(level);break;end;
                   #75:dec(i);
                   #77:inc(i);
                   end;
              end;
           #13:begin inc(level);break;end;
           #27:begin level:=6; break ;end;
            #9:dec(i);
      else begin
           inc(i);
           name[i]:=c;
           setcolor(lightblue);
           outtextxy(25+i*textwidth('m'),100*level,name[i]);
           end;
      end;
until false;
if i>0 then name[0]:=chr(i);
end;

procedure numberofgames;
var c:char;
    s:nametype;
begin
max:=0;
setcolor(blue);
repeat
      c:=readkey;
      case c of
           '0'..'9':begin
                         max:=max*10 +ord(c)-48;
                         if max>99 then max:=max mod 100;
                    end;
           #13,#27:begin inc(level);break;end;
           #8:max:=max div 10;
           #0:begin
                   c:=readkey;
                   case c of
                        #72:begin dec(level);break;end;
                        #80:begin inc(level);break;end;
                   end;
              end;
      end;
      bar(200,450,250,472);
      str(max,s);
      outtextxy(200,450,s);
      until false;
if max=0 then max:=5;
end;

procedure gamemode;
var c:char;

begin
level2choice;
repeat
c:=readkey;
case c of
#0:begin
        c:=readkey;
        case c of
             #75:begin mode:=easy;level2choice end;
             #77:begin mode:=tough;level2choice end;
             #80:begin inc(level);exit;end;
             #72:begin dec(level);exit;end;
             end;
        end;
#13:begin inc(level);exit;end;
#27:begin level:=6; exit; end;
end;
until false;
end;

begin

setfillstyle(solidfill,white);
bar(0,0,250,479);
level:=1;

repeat
theoptions;
case level of
     1:playermode;
     2:gamemode;
     3:getthename(p1name);
     4:getthename(p2name);
     5:numberofgames;
     end;
until level=6;
end;

procedure thankyou;
var x,y:integer;
    s1,s2:string[25];

begin
settextjustify(centertext,centertext);
setbkcolor(black);
cleardevice;
setcolor(lightgreen);
settextstyle(5,0,5);
outtextxy(320,50,'I Would Like To Thank');
outtextxy(320,220,'And');

s1:='Pralhad Kamath';
s2:='Marlow Lawrence';
settextstyle(7,0,2);
for x:=0 to 320 do
    begin
    setcolor(lightcyan);
    outtextxy(x,175,s1);
    outtextxy(getmaxx-x,275,s2);
    if x=320 then break;
    delay(40);
    setcolor(black);
    outtextxy(x,175,s1);
    outtextxy(getmaxx-x,275,s2);
    end;

settextstyle(12,0,6);
outtextxy(450,325,'For Programming the Computer''s Moves');
setcolor(lightred);settextstyle(0,0,2);
outtextxy(300,400,'I would like to hear from you');
outtextxy(400,450,'alanlobo@goatelecom.com');
delay(5000);
end;

function result:boolean;
var s:string[3];
begin

setfillstyle(solidfill,lightred);
bar(0,0,639,479);
setfillstyle(solidfill,lightgray);
bar(10,40,629,439);
setcolor(lightred);
line(10,10,629,469);
setfillstyle(solidfill,black);
floodfill(100,100,lightred);

setcolor(yellow);settextstyle(0,0,4);
outtextxy(200,10,'SCORES');
setcolor(darkgray);settextstyle(5,0,2);
outtextxy(100,449,'Press <Enter> To Play Again ; <Esc> Quits');

settextstyle(7,0,4);
setcolor(cyan);
outtextxy(40,400,p1name);
setcolor(magenta);
outtextxy(599-textwidth(p2name),40,p2name);

settextstyle(10,0,10);
setcolor(white);
str(p1win,s);
outtextxy(30,150,s);
setcolor(black);
str(p2win,s);
outtextxy(620-textwidth(s),50,s);

p1win:=0;
p2win:=0;
s[3]:=readkey;
if s[3]=#13 then result:=false else result:=true;
end;

procedure WaitForPlayer;
var
  X, Y,I :integer;
  Hour,Min,Sec,Sec100:word;
  s,t:string[9];

begin
while not KeyPressed do
  begin
    I := 0;RandSeed:=1962;
    repeat
          Inc(I);
          PutPixel(Random(99)+1,Random(478)+1,Random(MaxColors)+1);
          until KeyPressed or (I > 1500);

   GetTime(Hour,Min,Sec,Sec100);
   s:='';
   str(hour,t);s:=concat(s,t+':');
   str(min ,t);s:=concat(s,t+':');
   str(sec ,t);s:=concat(s,t);
   setfillstyle(linefill,LightMagenta);
   bar(550,449,639,479);
   settextstyle(smallfont,0,6);
   setcolor(lightgreen);
   outtextxy(560,455,s);

    I := 0;RandSeed:=1962;
    repeat
          Inc(I);
          X:=Random(99)+1;
          Y:=Random(478)+1;
          if GetPixel(X, Y)=Random(MaxColors)+1 then PutPixel(X, Y, 0);
          until KeyPressed or (I > 1500);
  end;
end;

procedure thescreen;
var conv:string[5];
begin
setfillstyle(solidfill,white);
bar(0,310,98,435);

setcolor(magenta);settextstyle(GothicFont,0,2);
outtextxy(15,310,'Games');
str(games,conv);
outtextxy(75,330,conv);

outtextxy(5,350,p1name);
str(p1win,conv);
outtextxy(75,370,conv);

outtextxy(5,390,p2name);
str(p2win,conv);
outtextxy(75,410,conv);

setcolor(lightcyan);settextstyle(DefaultFont,0,0);
outtextxy(10,450,'N new game');
outtextxy(10,460,'Esc quits');

settextstyle(5,0,3);
setcolor(lightblue);
outtextxy(120,0,concat(p1name,'  X'));
setcolor(lightred);
outtextxy(500,0,concat(p2name,'  O'));

SetLineStyle(solidLn,0,thickWidth);
setcolor(brown);
line(100,0,100,479);
setcolor(green);
line(313,60 ,313,404);   { | }
line(220,160,540,140);   {upper ---}
line(220,320,540,310);   {lower ---}
setlinestyle(UserBitLn, $C3, ThickWidth);
ellipse(639,240,150,210,200,350);
setlinestyle(solidLn, 0, ThickWidth);
end;

procedure thewinner(winner:boolean);
label hell;
const  pattern:fillpatterntype= ($7E,0,$7E,0,$7E,0,$7E,0);
var i:integer;

procedure drawline(x,y:integer);
const pos:array[1..3,1..3,1..2]of integer=
          (((220,90),(220,234),(220,375)),
           ((380,90),(380,234),(380,375)),
           ((540,90),(540,234),(540,375)));
begin
setcolor(yellow);
if(x=0)and(y<>0)then
                line(pos[1,y,1],pos[1,y,2],pos[3,y,1],pos[3,y,2])
                else
if(x<>0)and(y=0)then
                line(pos[x,1,1],pos[x,1,2],pos[x,3,1],pos[x,3,2])
                else
if     x=1      then
                line(pos[1,1,1],pos[1,1,2],pos[3,3,1],pos[3,3,2])
                else
                line(pos[3,1,1],pos[3,1,2],pos[1,3,1],pos[1,3,2]);
end;{proc drawline}

begin

setfillpattern(pattern,brown);
bar(102,449,550,479);
moveto(200,450);
setcolor(yellow);
if not winner then begin outtext('The Game Is Drawed');goto hell; end;

if checker=x then begin inc(p1win);outtext(concat(p1name,' takes the round'))end
             else begin inc(p2win);outtext(concat(p2name,' wins'))end;

for i:=1 to 3 do
if (grid[1,i]=grid[2,i])and(grid[2,i]=grid[3,i])then
                                           begin
                                           drawline(0,i);
                                           goto hell;
                                           end;

for i:=1 to 3 do
if(grid[i,1]=grid[i,2])and(grid[i,2]=grid[i,3])then
                                            begin
                                            drawline(i,0);
                                            goto hell;
                                            end;

if(grid[1,1]=grid[2,2])and(grid[2,2]=grid[3,3])then drawline(1,1)
                                               else drawline(0,0);
hell:
setlinestyle(solidln,0,normwidth);
setcolor(white);
circle(50,100,50);
circle(25,75,10);
circle(75,75,10);
for i:=0 to 80 do begin
if winner then arc(50,100,270-i,270+i,40)
          else arc(50,140, 90-i, 90+i,40);
delay(50);
end;

end;

procedure drawboard;
const pos:array[1..3,1..3,1..2]of integer=
      ( ( (220,90) , (220,234) , (220,375) ),
        ( (380,90) , (380,234) , (380,375) ),
        ( (540,90) , (540,234) , (540,375) ) );
       pattern:fillpatterntype= (0, $10, $28, $44, $28, $10, 0, 0);
var i,j:integer;

begin
setfillpattern(pattern,cyan);
bar(102,449,550,479);
settextstyle(4,0,1);

for i:=1 to 3 do
for j:=1 to 3 do
    begin
    if grid[i,j]=_ then setcolor(yellow)
                   else setcolor(getbkcolor);
    outtextxy(pos[i,j,1],pos[i,j,2],chr(join(i,j)+48));

    case grid[i,j] of
    o:begin
           setcolor(lightred);
           circle(pos[i,j,1],pos[i,j,2],50);
           end;
    x:begin
           setcolor(lightblue);
           line(pos[i,j,1]-50,pos[i,j,2]-50,pos[i,j,1]+50,pos[i,j,2]+50);
           line(pos[i,j,1]-50,pos[i,j,2]+50,pos[i,j,1]+50,pos[i,j,2]-50);
           end;
    end;{case}
  end;
end;

function checker:fill;
var i,j,winx,wino:integer;
label hell;

begin

for i:=1 to 3 do
    begin
    winx:=0;wino:=0;
    for j:=1 to 3 do
        begin
        if grid[i,j]=x then inc(winx);
        if grid[i,j]=o then inc(wino) ;
        end;
    if (wino=3)or(winx=3) then goto hell;
    end;

for i:=1 to 3 do
    begin
    winx:=0;wino:=0;
    for j:=1 to 3 do
        begin
        if grid[j,i]=x then inc(winx);
        if grid[j,i]=o then inc(wino) ;
        end;
    if (wino=3)or(winx=3) then goto hell;
    end;

wino:=0;winx:=0;
for i:=1 to 3 do
    begin
    if grid[i,i]=o then inc(wino);
    if grid[i,i]=x then inc(winx);
    end;
if (wino=3)or(winx=3) then goto hell;

wino:=0;winx:=0;
for i:=1 to 3 do
    begin
    if grid[i,4-i]=o then inc(wino);
    if grid[i,4-i]=x then inc(winx);
    end;
if (wino=3)or(winx=3) then goto hell;

checker:=_;
exit;
hell:if winx=3 then checker:=x
               else checker:=o;
end;

procedure player(playerturn:byte);
var i,j:integer;
    symbol:fill;
    c:char;
begin
settextstyle(triplexfont,0,2);

if playerturn=1 then
                begin
                symbol:=x;
                setcolor(yellow);
                outtextxy(200,450,concat(p1name,'''s turn'));
                end
           else begin
                symbol:=o;
                setcolor(lightcyan);
                outtextxy(200,450,concat(p2name,'''s turn'));
                end;
WaitForPlayer;
repeat
      c:=readkey;
      settextstyle(triplexfont,0,2);
      case c of
           '1'..'9':if (ord(c)-48) in slots
                       then begin
                            lastmove:=ord(c)-48;
                            exclude(slots,lastmove);
                            split(lastmove,i,j);
                            grid[i,j]:=symbol;
                            break
                            end
                       else begin
                            setfillstyle(hatchFill,lightgray);
                            bar(102,449,550,479);
                            setcolor(white);
                            outtextxy(200,450,'That position has been filled');
                            waitforplayer;
                            end;
           'N','n':begin move:=10;break end;
           #27:halt

           else begin
                setfillstyle(widedotfill,white);
                bar(102,450,550,479);
                setcolor(lightgreen);
                outtextxy(200,450,'You hit the wrong key');
                waitforplayer;
                end;
      end;
until false;
end;

procedure TheComputer;
var i,j:integer;

procedure blockorwin;
var v:fill;
    i,j:integer;
begin
     lastmove:=0;
     for v:=x to o do
         for i:=1 to 3 do
             for j:=1 to 3 do
                 if grid[i,j]=_ then
                    begin
                    grid[i,j]:=v;
                    if checker<>_ then  lastmove:=join(i,j);
                    grid[i,j]:=_;
                    end;

     if lastmove=0  then
                        repeat
                             lastmove:=1+random(9);
                             until lastmove in slots;
     end;

begin
settextstyle(triplexfont,0,2);
setcolor(lightcyan);
outtextxy(200,450,concat(p2name,'''s turn'));
delay(1000);

if mode=easy then blockorwin
else
case move of
1:begin
       repeat
       lastmove:=1+random(9)
       until lastmove in [1,3,7,9];
       move1:=lastmove;
       end;

2:if lastmove=5 then lastmove:=9
                else lastmove:=5;

3:case move1 of
       1:case lastmove of
              4:lastmove:=2;
              6:lastmove:=3;
              2:lastmove:=4;
            8,9:lastmove:=5;
          3,7,5:lastmove:=9;
            end;

       3:case lastmove of
              6:lastmove:=2;
              4:lastmove:=1;
              2:lastmove:=6;
            8,7:lastmove:=5;
          1,9,5:lastmove:=7;
            end;
       7:case lastmove of
              4:lastmove:=8;
              6:lastmove:=9;
              8:lastmove:=4;
            2,3:lastmove:=5;
          9,1,5:lastmove:=3;
             end;
       9:case lastmove of
              8:lastmove:=6;
              2:lastmove:=3;
              6:lastmove:=8;
            4,1:lastmove:=5;
          3,7,5:lastmove:=1;
            end;
end;

4:   if(grid[1,2]=x)and(grid[2,1]=x) then lastmove:=1
else if(grid[1,2]=x)and(grid[3,1]=x)
     or(grid[1,2]=x)and(grid[3,3]=x) then lastmove:=2
else if(grid[1,1]=x)and(grid[2,2]=x)
     or(grid[3,2]=x)and(grid[2,1]=x) then lastmove:=3
else if(grid[2,1]=x)and(grid[1,3]=x)
     or(grid[2,1]=x)and(grid[3,3]=x) then lastmove:=4
else if(grid[3,3]=x)and(grid[1,1]=x)
     or(grid[1,3]=x)and(grid[3,1]=x)
     or(grid[1,1]=x)and(grid[2,3]=x)
     or(grid[3,1]=x)and(grid[2,3]=x) then lastmove:=6
else if(grid[2,3]=x)and(grid[1,2]=x) then lastmove:=7
else if(grid[3,2]=x)and(grid[1,3]=x)
     or(grid[3,2]=x)and(grid[1,1]=x) then lastmove:=8
else if(grid[2,3]=x)and(grid[3,2]=x) then lastmove:=9
else blockorwin;

5:if grid[2,2]=_ then lastmove:=5 else blockorwin

else  blockorwin;
end;
exclude(slots,lastmove);
split(lastmove,i,j);
grid[i,j]:=o;
end;

procedure thegame;
var  winner:boolean;

procedure clearboard;
var i,j:integer;
begin
cleardevice;
thescreen;
move:=1;
for i:=1 to 3 do
    for j:=1 to 3 do
        grid[i,j]:=_;
winner:=false;
slots:=[1..9];
drawboard;
while keypressed do readkey;
end;

begin
for games:=0 to max-1 do
begin
clearboard;
repeat
      if player1 then player(1)
                 else if Computer then TheComputer
                              else player(2);
      drawboard;
      if checker<>_ then begin
                         winner:=true;
                         break
                         end;
      inc(move);
      if move>9 then break;

      if not player1 then player(1)
                     else if Computer then TheComputer
                             else player(2);

      if checker<>_ then winner:=true;
      drawboard;
      inc(move);

      until winner or (move>9);

if move=11 then break;
thewinner(winner);

delay(2000);
player1:=not player1;
end;
end;

procedure initialize;
var graphdriver,graphmode:integer;
begin
clrscr;
graphdriver:=vga;
graphmode  :=vgahi;
initgraph(graphdriver,graphmode,'');
if graphresult<>grok then
                         begin
                         writeln('Graphics Could Not Be Initialized;');
                         writeln('Check "Path To Driver" In Line 875');
                         readkey;
			          halt;
                         end;
player1 :=true;
Computer:=true;
mode:=tough;
p1win:=0;
p2win:=0;
max:=5;
p1name:='Player1';
p2name:='Computer';
randomize;
end;

begin{ing of the program}
initialize;
introduction;
repeat
      selection;
      thegame;
      until result;
thankyou;
closegraph;
end.
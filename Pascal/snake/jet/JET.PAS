{Jetgame by LANDON RABERN
         written on 1/19/97 using mode 13h}


uses crt,jetunit,multikey;
{$I KEYCONST.PAS}



{If you have a fast computer it may run fast so you can mess around with
WAITTIME until it runs right}
const WAITTIME=0;


type
    Tjet=record
                 x,y:word;
                 life,oldlife:word;
    end;
    Tbullet=record
                  x,y:word;
                  alive:boolean;


    end;
    Tenemy=record
                 x,y:word;
                 alive:boolean;
                 dir:byte;
    end;

var
   x,y,w,q,r,c,d,d2,a,b:word;
   ledge,redge,rsize,ecount,pcount,dcount:word;
   pauser:Byte;
   jet:Tjet;
   metercol:byte;
   bullet:array[1..15] of Tbullet;
   bcount:byte;
   enemy:array [1..20] of Tenemy;
   eplane:array [1..10] of Tenemy;
   ebullet,pbullet:Tbullet;
   beenhit,beenshot,pbulletshot,pbeenhit:boolean;
   boatc:word;
   score,oldscore:longint;
   accell,jdir:byte;
   
procedure scrolldown;assembler;
asm
     std
     push ds
     mov ax,bscr
     mov es, ax
     mov ds, ax
     mov di, 56000+(320*3)
     mov si, 56000
     mov cx, 14240
     db 66h
     rep movsw
     pop ds
end;


begin
     jdir:=0;
     accell:=0;
     oldscore:=65535;
     score:=0;
     pbulletshot:=false;
     dcount:=0;
     pbullet.alive:=false;
     pcount:=0;
     boatc:=0;
     pbeenhit:=false;
     beenhit:=false;
     beenshot:=false;
     ecount:=0;
     redge:=280;
     ledge:=45;
     rsize:=0;
     b:=1;
     a:=1;
     d:=0;
     c:=100;
     r:=1;
     bcount:=1;
     w:=9;
     metercol:=2;
     loadpic('jet.pic',1);
     loadpic('glife.pic',2);
     loadpic('ylife.pic',3);
     loadpic('rlife.pic',4);
     loadpic('nlife.pic',5);
     loadpic('bullet.pic',6);
     loadpic('palm.pic',7);
     loadpic('build2.pic',8);
     loadpic('badbult.pic',9);
     loadpic('boat2.pic',10);
     loadpic('badplane.pic',11);
     loadpic('plbullet.pic',12);

     setmcga;
     setupvirtual;
     pal(61,35,27,0);
     pal(62,40,30,0);
     pal(63,45,32,0);
     pal(64,50,35,0);
     pal(1,63,0,0);
     pal(9,0,0,0);
     pal(2,10,10,10);
     pal(90,20,0,0);
     pal(91,30,0,0);
     pal(92,40,0,0);
     pal(93,50,0,0);
     pal(94,60,0,0);
     pal(95,63,20,0);
     pal(96,63,20,0);
     pal(10,15,15,15);
     pal(7,0,63,0);
     pal(6,50,50,0);
     pal(3,15,15,0);
     pal(4,63,63,63);
     pal(100,0,0,50);
     pal(101,0,0,48);
     pal(102,0,0,52);
     pal(103,0,0,60);


     with jet do begin
          x:=170;
          y:=100;
          life:=10;
          oldlife:=65535;
     end;

     for x:=1 to 20 do
     with enemy[x] do begin
          x:=random(30)+2;
          y:=0;
          alive:=false;
     end;
     for x:=1 to 10 do 
     with eplane[x] do begin
          x:=150;
          y:=0;
          alive:=false;
          dir:=random(2);
     end;
     ebullet.alive:=false;

     for x:=1 to 15 do begin
         bullet[x].x:=0;
         bullet[x].y:=0;
         bullet[x].alive:=false;
     end;

     cls(0,bscr);
     cls(0,vaddr);
     cls(0,vga);
     for x:=0 to 319 do
         for y:=0 to 175 do
             putpixel(x,y,c+random(4),bscr);

     
     directvideo:=false;
     gotoxy(2,24);
     write('SCORE: ');
     randomize;
     repeat
           if waittime>0 then wait(waittime);
           inc (dcount);
           inc(pcount);
           inc(boatc);
           inc(ecount);
           inc(rsize);
           inc(a);
           inc(b);
           d:=ledge+random(15);
           d2:=redge-random(15);

           flip(bscr,vaddr);

           if rsize > 20 then begin
              ledge:=45+random(50);
              redge:=280-random(40);
              rsize:=0;
           end;

           if boatc mod 1000=0 then
              puticon(120,6,pics[10],bscr);

           if a >random(500)+10 then begin
              a:=0;
              puticon(5,0,pics[7],bscr);
           end;
           if b >random(547)+12 then begin
              b:=0;
              puticon(290,0,pics[7],bscr);
           end;
           scrolldown;
           
           for x:=d to d2 do begin
               putpixel(x,0,random(4)+c,bscr);
               putpixel(x,1,random(4)+c,bscr);
               putpixel(x,2,random(4)+c,bscr);
           end;
           for x:=0 to d do begin
              putpixel(x,0,random(4)+61,bscr);
              putpixel(x,1,random(4)+61,bscr);
              putpixel(x,2,random(4)+61,bscr);
           end;
           for x:=320 downto d2 do begin
              putpixel(x,0,random(4)+61,bscr);
              putpixel(x,1,random(4)+61,bscr);
              putpixel(x,2,random(4)+61,bscr);
           end;

{key input stuff and bullet kill stuff}
                if keystat[k_pad_4]=1 then begin
                   if jdir=1 then accell:=0;
                   jdir:=0;
                   if accell<25 then inc(accell);
                   dec(jet.x,accell div 4);
                end;
                if keystat[k_pad_6]=1 then begin
                   if jdir=0 then accell:=0;
                   jdir:=1;
                   if accell<25 then inc(accell);
                   inc(jet.x,accell div 4);
                end;
                if keystat[k_space]=1 then begin

                        if bcount<=15 then begin
                           bullet[bcount].x:=jet.x+4;
                           bullet[bcount].y:=jet.y+26;
                           bullet[bcount].alive:=true;
                        end;
                        inc(bcount);
                   end;
                if keystat[k_esc]=1 then begin
                   settext;
                   shutdown;
                   exit;
                end;
                if keystat[k_pad_2]=1 then begin
                        inc(jet.y,4);


                   end;
                if keystat[k_pad_8]=1 then begin
                        dec(jet.y,3);

                        {inc(jet.life);
                        inc(w);
                        if w>9 then w:=9;}
                   end;
           
           if jet.x<6 then jet.x:=6;
           if jet.x>275 then jet.x:=275;
           if jet.y>130 then jet.y:=130;
           if jet.y<6 then jet.y:=6;

           
           
{end of key input and bullet stuff}
                  
           {count to a random number then put down gun}
           if ecount> random(500)+random(200)+100 then begin
              enemy[1].alive:=true;
              beenhit:=false;
              beenshot:=false;
              ecount:=0;
           end;

           {count to a random number then put down plane}
           if pcount> random(500)+random(200)+100 then begin
              eplane[1].alive:=true;
              pcount:=0;
              pbulletshot:=false;
              pbeenhit:=false;
           end;

           {initialize gun bullet}
           if (enemy[1].alive) and (random(100)<random(20)) and not (beenshot)
           then begin
              beenshot:=true;
              ebullet.x:=enemy[1].x+45;
              ebullet.y:=enemy[1].y+10;
              ebullet.alive:=true;
           end;   

           {initialize plane bullet}
           if (eplane[1].alive) and not (pbulletshot) then begin

              pbullet.x:=eplane[1].x+20;
              pbullet.y:=eplane[1].y+40;
              pbullet.alive:=true;
              pbulletshot:=true;
           end;   
           if pbullet.alive then begin
                puticon(pbullet.x,pbullet.y,pics[12],vaddr);
                inc(pbullet.y,6);
           end;
          if pbullet.y>172 then begin
             pbulletshot:=false;
             pbullet.alive:=false;
          end;

           if ebullet.alive then begin
              puticon(ebullet.x,ebullet.y,pics[9],vaddr);
              inc(ebullet.x,5);
              inc(ebullet.y,3);
           end;

           if ebullet.x>315 then begin
              beenshot:=false;
              ebullet.alive:=false;
           end;
           if ebullet.y>170 then begin
              beenshot:=false;
              ebullet.alive:=false;
           end;
           for x:=1 to 20 do begin
               if enemy[x].alive then begin
                  puticon(enemy[x].x,enemy[x].y,pics[8],vaddr);
                  inc(enemy[x].y,3);
                  if enemy[x].y>150 then begin
                     enemy[x].alive:=false;
                     enemy[x].x:=random(30)+2;
                     enemy[x].y:=0;
                  end;
               end;
           end;

           for x:=1 to 10 do begin
               if eplane[x].alive then begin
                  puticon(eplane[x].x,eplane[x].y,pics[11],vaddr);
                  inc(eplane[x].y,2);
                  

                  if dcount>10 then begin
                  case random(2) of
                       0:begin
                         dcount:=0;
                         eplane[x].dir:=0;
                       end;
                       1:begin
                         dcount:=0;
                         eplane[x].dir:=1;
                       end;
                 end;

                 end;

                 case eplane[x].dir of
                      0:inc(eplane[x].x,2);
                      1:dec(eplane[x].x,2);
                 end;
                 if eplane[x].x>280 then eplane[x].x:=280;
                 if eplane[x].x<3 then eplane[x].x:=3;


                  if eplane[x].y>140 then begin
                     eplane[x].alive:=false;
                     eplane[x].x:=random(280)+4;
                     eplane[x].y:=0;
                  end;
               end;
               end;
                      
           {decrease jet life if hit}
           if (ebullet.x in [jet.x..jet.x+40]) and
           (ebullet.y in [jet.y..jet.y+40]) and (ebullet.alive) and not
           (beenhit) then
           begin
                for x:=0 to 5 do
                    for y:=0 to 5 do
                        putpixel(ebullet.x+x,ebullet.y+y,random(5)+90,vaddr);
                puticon(315-w*7,179,pics[5],vga);
                dec(w);
                dec(jet.life);
                beenhit:=true;
                ebullet.alive:=false;
           end;
                
           if (pbullet.x in [jet.x..jet.x+40]) and
           (pbullet.y in [jet.y..jet.y+40]) and (pbullet.alive) then
           begin
                for x:=0 to 5 do
                    for y:=0 to 5 do
                        putpixel(pbullet.x+x,pbullet.y+y,random(5)+90,vaddr);
                puticon(315-w*7,179,pics[5],vga);
                dec(w);
                dec(jet.life);
                pbeenhit:=true;
                pbullet.alive:=false;
                
           end;

           if eplane[1].alive then begin
           for x:=15 downto 1 do begin
               if bullet[x].alive then begin
                  if ((bullet[x].x in [eplane[1].x+1..eplane[1].x+39]) or
                     (bullet[x].x+31 in [eplane[1].x+1..eplane[1].x+39]))
                  and (bullet[x].y in [eplane[1].y..eplane[1].y+40]) then begin
                     bullet[x].alive:=false;
                     for q:=eplane[1].x-random(10) to eplane[1].x+40-random(10) do
                         for y:=eplane[1].y-5+random(10) to eplane[1].y+30+5-random(10) do
                             putpixel(q,y,random(7)+90,vaddr);
                     eplane[1].alive:=false;
                     eplane[1].x:=random(280)+4;
                     eplane[1].y:=0;
                     inc(score,100);
                     for y:=x downto 1 do
                         if not (bullet[y].alive) and (x=15) then
                            bcount:=y;
                   end;

             end;
              
           end;
           end;

           if jet.life>10 then jet.life:=10;
           if jet.life<1 then begin
              settext;
              exit;
           end;
           if jet.life<>jet.oldlife then begin
           {set meter color}
           if jet.life>6 then metercol:=2
           else if jet.life<4 then metercol:=4
           else metercol:=3;

           {put meter}
           for x:=0 to jet.life-1 do
                   puticon(315-x*7,179,pics[metercol],vga);
           
           jet.oldlife:=jet.life;
           end;

           for x:=1 to 15 do
               if bullet[x].alive then begin
                  puticon(bullet[x].x,bullet[x].y,pics[6],vaddr);
                  puticon(bullet[x].x+31,bullet[x].y,pics[6],vaddr);
                  dec(bullet[x].y,5); 

                  if bullet[x].y<6 then begin
                     bullet[x].alive:=false;
                     for y:=x downto 1 do
                         if not (bullet[y].alive) and (x=15) then
                            bcount:=y;

                  end;
            end;

           {flame}
           for y:=0 to 3 do
           for x:=jet.x+17 to jet.x+20 do
               putpixel(x+random(2),jet.y+40+y,random(7)+90,vaddr);

           {put jet}
           puticon(jet.x,jet.y,pics[1],vaddr);

           flip(vaddr,vga);
           
           if score<>oldscore then begin
              gotoxy(9,24);
              write(score);
              oldscore:=score;
           end;

         
     until 5<4;






     settext;
     shutdown;

end.

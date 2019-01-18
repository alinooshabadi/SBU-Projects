uses
 crt;

const
 delayconst=10000;

var
 doozscr: array [1..25,1..80] of word absolute $b800:0000;
 bturn,bmove                 :char;
 x,bamood,ran,amood,i,j,jat,doozscore  :integer;
 bcheck,bwinx,bwino          :boolean;


procedure check(bx,by:integer);

 begin
  bcheck:=false;
  if (bx>5) and (by>25) and (bx<21) and (by<55) then bcheck:=true;
 end;

procedure bcja;
 begin
 randomize;
 ran:=random(8)+1;
  if (doozscr[bamood,ran*4+22]=88+4*256) or (doozscr[bamood,ran*4+22]=79+1*256)
   then
    begin
     bamood:=bamood-2;
     bcja;
    end;
  jat:=bamood;
 end;

procedure processes(bj1,bj2,bj3,bj4,bi1,bi2,bi3,bi4,ij:integer);
begin
for j:=8 downto 1 do
  for i:=8 downto 1 do
  begin
  if bturn='x' then
  if doozscr[2*j+bj1,4*i+bi1]=ij then
   if doozscr[2*j+bj2,4*i+bi2]=ij then
    if doozscr[2*j+bj3,4*i+bi3]=ij then
     if (doozscr[2*j+bj4,4*i+bi4]<>79+1*256) and (doozscr[2*j+bj4,4*i+bi4]<>88+4*256) then
      if (doozscr[2*j+bj4+2,4*i+bi4]=79+1*256) or (doozscr[2*j+bj4+2,4*i+bi4]=88+4*256)
      or (doozscr[2*j+bj4+2,4*i+bi4]=78) then
      begin
       check(2*j+bj4,4*i+bi4);
       if (bcheck=true) then
        begin
         doozscr[2*j+bj4,4*i+bi4]:=88+4*256;
         bturn:='o';
        end;
       end;
      end;
end;

procedure checkplace(bj1,bj2,bj3,bj4,bi1,bi2,bi3,bi4,ij:integer);
begin
for j:=8 downto 1 do
  for i:=8 downto 1 do
  begin
  if doozscr[2*j+bj1,4*i+bi1]=ij then
   if doozscr[2*j+bj2,4*i+bi2]=ij then
    if doozscr[2*j+bj3,4*i+bi3]=ij then
     if (doozscr[2*j+bj4+2,4*i+bi4]<>79+1*256) and (doozscr[2*j+bj4+2,4*i+bi4]<>88+4*256) then
      if (doozscr[2*j+bj4+4,4*i+bi4]=79+1*256) or (doozscr[2*j+bj4+4,4*i+bi4]=88+4*256)
      or (doozscr[2*j+bj4+4,4*i+bi4]=78) then
      begin
       check(2*j+bj4+2,4*i+bi4);
       if (bcheck=true) then
        begin
         doozscr[2*j+bj4+2,4*i+bi4]:=80+0*256;
        end;
       end;
      end;
end;


procedure processes2(bj1,bj2,bj3,bj4,bi1,bi2,bi3,bi4,ij:integer);
begin
for j:=8 downto 1 do
  for i:=1 to 8 do
  begin
  if bturn='x' then
  if doozscr[2*j+bj1,4*i+bi1]=ij then
   if doozscr[2*j+bj2,4*i+bi2]=ij then
    if doozscr[2*j+bj3,4*i+bi3]=ij then
     if (doozscr[2*j+bj4,4*i+bi4]<>79+1*256) and (doozscr[2*j+bj4,4*i+bi4]<>88+4*256) then
      if (doozscr[2*j+bj4+2,4*i+bi4]=79+1*256) or (doozscr[2*j+bj4+2,4*i+bi4]=88+4*256)
      or (doozscr[2*j+bj4+2,4*i+bi4]=78) then
      begin
       check(2*j+bj4,4*i+bi4);
       if (bcheck=true) then
        begin
         doozscr[2*j+bj4,4*i+bi4]:=88+4*256;
         bturn:='o';
        end;
       end;
      end;
end;

procedure checkplace2(bj1,bj2,bj3,bj4,bi1,bi2,bi3,bi4,ij:integer);
begin
for j:=8 downto 1 do
  for i:=1 to 8 do
  begin
  if doozscr[2*j+bj1,4*i+bi1]=ij then
   if doozscr[2*j+bj2,4*i+bi2]=ij then
    if doozscr[2*j+bj3,4*i+bi3]=ij then
     if (doozscr[2*j+bj4+2,4*i+bi4]<>79+1*256) and (doozscr[2*j+bj4+2,4*i+bi4]<>88+4*256) then
      if (doozscr[2*j+bj4+4,4*i+bi4]=79+1*256) or (doozscr[2*j+bj4+4,4*i+bi4]=88+4*256)
      or (doozscr[2*j+bj4+4,4*i+bi4]=78) then
      begin
       check(2*j+bj4+2,4*i+bi4);
       if (bcheck=true) then
        begin
         doozscr[2*j+bj4+2,4*i+bi4]:=80+0*256;
        end;
       end;
      end;
end;

procedure processesxp(bj1,bj2,bj3,bj4,bi1,bi2,bi3,bi4,ij:integer);
begin
for j:=8 downto 1 do
  for i:=8 downto 1 do
  begin
  if bturn='x' then
  if doozscr[2*j+bj1,4*i+bi1]=ij then
   if doozscr[2*j+bj2,4*i+bi2]=ij then
    if doozscr[2*j+bj3,4*i+bi3]=ij then
     if (doozscr[2*j+bj4,4*i+bi4]<>79+1*256) and (doozscr[2*j+bj4,4*i+bi4]<>88+4*256)
     and (doozscr[2*j+bj4,4*i+bi4]<>80+0*256) then
      if (doozscr[2*j+bj4+2,4*i+bi4]=79+1*256) or (doozscr[2*j+bj4+2,4*i+bi4]=88+4*256)
      or (doozscr[2*j+bj4+2,4*i+bi4]=78) then
      begin
       check(2*j+bj4,4*i+bi4);
       if (bcheck=true) then
        begin
         doozscr[2*j+bj4,4*i+bi4]:=88+4*256;
         bturn:='o';
        end;
       end;
      end;
end;

procedure processesxp2(bj1,bj2,bj3,bj4,bi1,bi2,bi3,bi4,ij:integer);
begin
for j:=8 downto 1 do
  for i:=1 to 8 do
  begin
  if bturn='x' then
  if doozscr[2*j+bj1,4*i+bi1]=ij then
   if doozscr[2*j+bj2,4*i+bi2]=ij then
    if doozscr[2*j+bj3,4*i+bi3]=ij then
     if (doozscr[2*j+bj4,4*i+bi4]<>79+1*256) and (doozscr[2*j+bj4,4*i+bi4]<>88+4*256)
     and (doozscr[2*j+bj4,4*i+bi4]<>80+0*256) then
      if (doozscr[2*j+bj4+2,4*i+bi4]=79+1*256) or (doozscr[2*j+bj4+2,4*i+bi4]=88+4*256)
      or (doozscr[2*j+bj4+2,4*i+bi4]=78) then
      begin
       check(2*j+bj4,4*i+bi4);
       if (bcheck=true) then
        begin
         doozscr[2*j+bj4,4*i+bi4]:=88+4*256;
         bturn:='o';
        end;
       end;
      end;
end;


procedure pcmove;
begin


{===========================chrck if win===================================}
processes(4,4,4,4,22,18,14,10,88+4*256)  ;
processes(4,4,4,4,22,18,10,14,88+4*256)  ;
processes(4,4,4,4,22,14,10,18,88+4*256)  ;
processes(4,2,0,-2,22,18,14,10,88+4*256) ;
processes(4,2,-2,0,22,18,10,14,88+4*256) ;
processes(4,0,-2,2,22,14,10,18,88+4*256) ;
processes(-2,2,0,4,10,18,14,22,88+4*256) ;
processes2(4,2,0,-2,22,26,30,34,88+4*256);
processes2(4,2,-2,0,22,26,34,30,88+4*256);
processes2(4,-2,0,2,22,34,30,26,88+4*256);
processes2(-2,2,0,4,34,26,30,22,88+4*256);
processes2(4,4,4,4,22,26,30,34,88+4*256) ;
processes(4,2,0,-2,22,22,22,22,88+4*256) ;

{========================cHEcK IF losE======================================}
processes(4,4,4,4,22,18,14,10,79+1*256)  ;
processes(4,4,4,4,22,18,10,14,79+1*256)  ;
processes(4,4,4,4,22,14,10,18,79+1*256)  ;
processes(4,2,0,-2,22,18,14,10,79+1*256) ;
processes(4,2,-2,0,22,18,10,14,79+1*256) ;
processes(4,0,-2,2,22,14,10,18,79+1*256) ;
processes(-2,2,0,4,10,18,14,22,79+1*256) ;
processes2(4,2,0,-2,22,26,30,34,79+1*256);
processes2(4,2,-2,0,22,26,34,30,79+1*256);
processes2(4,-2,0,2,22,34,30,26,79+1*256);
processes2(-2,2,0,4,34,26,30,22,79+1*256);
processes2(4,4,4,4,22,26,30,34,79+1*256) ;
processes(4,2,0,-2,22,22,22,22,79+1*256) ;

{=================check place===============================================}
checkplace(4,4,4,4,22,18,14,10,79+1*256)  ;
checkplace(4,4,4,4,22,18,10,14,79+1*256)  ;
checkplace(4,4,4,4,22,14,10,18,79+1*256)  ;
checkplace(4,2,0,-2,22,18,14,10,79+1*256) ;
checkplace(4,2,-2,0,22,18,10,14,79+1*256) ;
checkplace(4,0,-2,2,22,14,10,18,79+1*256) ;
checkplace(-2,2,0,4,10,18,14,22,79+1*256) ;
checkplace2(4,2,0,-2,22,26,30,34,79+1*256);
checkplace2(4,2,-2,0,22,26,34,30,79+1*256);
checkplace2(4,-2,0,2,22,34,30,26,79+1*256);
checkplace2(-2,2,0,4,34,26,30,22,79+1*256);
checkplace2(4,4,4,4,22,26,30,34,79+1*256) ;
checkplace(4,2,0,-2,22,22,22,22,79+1*256) ;

{===========================================================================}
 processesxp (4,4,4,4,22,14,14,18,79+1*256)   ;
 processesxp (4,4,4,4,22,14,14,18,88+4*256)   ;
 processesxp (4,4,4,4,22,10,10,18,79+1*256)   ;
 processesxp (4,4,4,4,22,10,10,18,88+4*256)   ;
 processesxp (4,4,4,4,22,18,18,14,79+1*256)   ;
 processesxp (4,4,4,4,22,18,18,14,88+4*256)   ;
 processesxp (4,2,2,-2,22,18,18,10,79+1*256)  ;
 processesxp (4,2,2,-2,22,18,18,10,88+4*256)  ;
 processesxp (4,-2,-2,0,22,10,10,14,79+1*256) ;
 processesxp (4,-2,-2,0,22,10,10,14,88+4*256) ;
 processesxp (4,-2,-2,2,22,10,10,18,79+1*256) ;
 processesxp (4,-2,-2,2,22,10,10,18,88+4*256) ;
 processesxp (4,0,0,-2,22,14,14,10,79+1*256)  ;
 processesxp (4,0,0,-2,22,14,14,10,88+4*256)  ;
 processesxp (4,0,0,2,22,14,14,18,79+1*256)   ;
 processesxp (4,0,0,2,22,14,14,18,88+4*256)   ;
 processesxp2(4,0,0,-2,22,30,30,34,79+1*256)  ;
 processesxp2(4,0,0,-2,22,30,30,34,88+4*256)  ;
 processesxp2(4,2,2,-2,22,26,26,34,79+1*256)  ;
 processesxp2(4,2,2,-2,22,26,26,34,88+4*256)  ;
 processesxp (4,2,2,0,22,22,22,22,79+1*256)   ;
 processesxp (4,2,2,0,22,22,22,22,88+1*256)   ;
 processesxp (4,4,4,4,22,22,22,18,88+4*256)   ;
 processesxp (4,4,4,4,22,22,22,18,79+1*256)   ;

if bturn='x' then
 while bturn='x' do
  begin
  bcja;
  check(jat,4*(ran)+22);
  if (bcheck=true) then
  begin
  doozscr[jat,4*(ran)+22]:=88+4*256;
     bturn:='o';
     end;
  end
 end;


procedure winx;
begin
for j:=1 to 8 do
 for i:=1 to 8 do
  begin
  if doozscr[2*j+4,4*i+22]=88+4*256 then
   if doozscr[2*j+4,4*i+26]=88+4*256 then
    if doozscr[2*j+4,4*i+30]=88+4*256 then
     if doozscr[2*j+4,4*i+34]=88+4*256 then
       bwinx:=true;
  if doozscr[2*j+4,4*i+22]=88+4*256 then
    if doozscr[2*j+6,4*i+26]=88+4*256 then
     if doozscr[2*j+8,4*i+30]=88+4*256 then
      if doozscr[2*j+10,4*i+34]=88+4*256 then
       bwinx:=true;
   if doozscr[2*j+10,4*i+22]=88+4*256 then
    if doozscr[2*j+8,4*i+26]=88+4*256 then
     if doozscr[2*j+6,4*i+30]=88+4*256 then
      if doozscr[2*j+4,4*i+34]=88+4*256 then
       bwinx:=true;
   if doozscr[2*j+4,4*i+22]=88+4*256 then
    if doozscr[2*j+6,4*i+22]=88+4*256 then
     if doozscr[2*j+8,4*i+22]=88+4*256 then
      if doozscr[2*j+10,4*i+22]=88+4*256 then
       bwinx:=true;
       end;
     end;


procedure wino;
begin
for j:=1 to 8 do
 for i:=1 to 8 do
 begin
  if doozscr[2*j+4,4*i+22]=79+1*256 then
   if doozscr[2*j+4,4*i+26]=79+1*256 then
    if doozscr[2*j+4,4*i+30]=79+1*256 then
     if doozscr[2*j+4,4*i+34]=79+1*256 then
       bwino:=true;
   if doozscr[2*j+4,4*i+22]=79+1*256 then
    if doozscr[2*j+6,4*i+26]=79+1*256 then
     if doozscr[2*j+8,4*i+30]=79+1*256 then
      if doozscr[2*j+10,4*i+34]=79+1*256 then
       bwino:=true;
    if doozscr[2*j+10,4*i+22]=79+1*256 then
    if doozscr[2*j+8,4*i+26]=79+1*256 then
     if doozscr[2*j+6,4*i+30]=79+1*256 then
      if doozscr[2*j+4,4*i+34]=79+1*256 then
       bwino:=true;
   if doozscr[2*j+4,4*i+22]=79+1*256 then
    if doozscr[2*j+6,4*i+22]=79+1*256 then
     if doozscr[2*j+8,4*i+22]=79+1*256 then
      if doozscr[2*j+10,4*i+22]=79+1*256 then
       bwino:=true;
       end;
    end;


procedure bja;
 begin
  if (doozscr[amood,(ord(bmove)-48)*4+22]=88+4*256) or (doozscr[amood,(ord(bmove)-48)*4+22]=79+1*256)
   then
    begin
     amood:=amood-2;
     bja;
    end;
  jat:=amood;
 end;


begin
 clrscr;
 amood:=20;
 bwinx:=false;
 bwino:=false;
  textcolor(7);
  doozscore:=6400;
 gotoxy(65,2);write('Score :',doozscore);
  textcolor(15);
  gotoxy(24,4);writeln('  1   2   3   4   5   6   7   8');
  gotoxy(24,5);writeln('ษอออหอออหอออหอออหอออหอออหอออหอออป');
  gotoxy(24,6);writeln('บ','   ', chr(186),'   ',chr(186),'   ',chr(186),'   ',chr(186),
  '   ',chr(186),'   ',chr(186),'   ',chr(186),'   ','บ');

  gotoxy(24,7);writeln('ฬ','อออ', chr(206),'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),
  'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),'อออ','น');
  gotoxy(24,8);writeln('บ','   ', chr(186),'   ',chr(186),'   ',chr(186),'   ',chr(186),
  '   ',chr(186),'   ',chr(186),'   ',chr(186),'   ','บ');
  gotoxy(24,9);writeln('ฬ','อออ', chr(206),'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),
  'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),'อออ','น');
  gotoxy(24,10);writeln('บ','   ', chr(186),'   ',chr(186),'   ',chr(186),'   ',chr(186),
  '   ',chr(186),'   ',chr(186),'   ',chr(186),'   ','บ');
  gotoxy(24,11);writeln('ฬ','อออ', chr(206),'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),
  'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),'อออ','น');
  gotoxy(24,12);writeln('บ','   ', chr(186),'   ',chr(186),'   ',chr(186),'   ',chr(186),
  '   ',chr(186),'   ',chr(186),'   ',chr(186),'   ','บ');
  gotoxy(24,13);writeln('ฬ','อออ', chr(206),'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),
  'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),'อออ','น');
  gotoxy(24,14);writeln('บ','   ', chr(186),'   ',chr(186),'   ',chr(186),'   ',chr(186),
  '   ',chr(186),'   ',chr(186),'   ',chr(186),'   ','บ');
  gotoxy(24,15);writeln('ฬ','อออ', chr(206),'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),
  'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),'อออ','น');
  gotoxy(24,16);writeln('บ','   ', chr(186),'   ',chr(186),'   ',chr(186),'   ',chr(186),
  '   ',chr(186),'   ',chr(186),'   ',chr(186),'   ','บ');
  gotoxy(24,17);writeln('ฬ','อออ', chr(206),'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),
  'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),'อออ','น');
  gotoxy(24,18);writeln('บ','   ', chr(186),'   ',chr(186),'   ',chr(186),'   ',chr(186),
  '   ',chr(186),'   ',chr(186),'   ',chr(186),'   ','บ');
  gotoxy(24,19);writeln('ฬ','อออ', chr(206),'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),
  'อออ',chr(206),'อออ',chr(206),'อออ',chr(206),'อออ','น');
  gotoxy(24,20);writeln('บ','   ', chr(186),'   ',chr(186),'   ',chr(186),'   ',chr(186),
  '   ',chr(186),'   ',chr(186),'   ',chr(186),'   ','บ');
  gotoxy(24,21);writeln('ศอออสอออสอออสอออสอออสอออสอออสอออผ');
  doozscr[22,26]:=78;doozscr[22,30]:=78;doozscr[22,34]:=78;doozscr[22,38]:=78;
  doozscr[22,42]:=78;doozscr[22,46]:=78;doozscr[22,50]:=78;doozscr[22,54]:=78;

 while (bwinx=false) and (bwino=false) do
  begin
   wino;
   winx;
   IF (bwinx=false) and (bwino=false) then
   begin
    bamood:=20;
    amood:=20;
    delay(delayconst);
    pcmove;
    winx;
    IF (bwinx=false) and (bwino=false) then
    begin
     bmove:=readkey;
     bja;
     if (ord(bmove)>48) and (ord(bmove)<57) then
     begin
      check(jat,4*(ord(bmove)-48)+22);
      if bcheck=true then
      begin
       doozscr[jat,4*(ord(bmove)-48)+22]:=79+1*256;
       doozscore:=doozscore-100;
       gotoxy(65,2);write('Score :',doozscore);
       bturn:='x';
      end;
     end;
    end;
    if ord(bmove)=27 then
    begin
    doozscore:=0;
    exit;
    end;
   end;
  end;

  if bwinx=true then
  begin
   gotoxy(34,23);writeln('X win ...');
   doozscore:=0;
  end;
  if bwino=true then
  begin
   gotoxy(34,23);writeln('You Win');
  end;
  readln;
end.



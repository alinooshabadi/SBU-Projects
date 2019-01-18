Program HangEMhigh (input, output);

{Gary Hartman did the <GuessEntry> procedure, cleanup, and graphics;

Phil Hurak did the supporting procedures<HowLong>-<Insert>-ETC;

Jason Linkhart did the main, <Intro> procedure, and the pre/post statements}



Uses

  Crt;

Const

  maxlong = 50;

  maxguess = 8;

Type

  guesstring = string[30];

  guesstype = array[1..maxlong] of char;

Var

  used:guesstring;

  guessword:guesstring;

  realword:guesstype;

  again,inst:char;

  V:integer;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Procedure TheWord (VAR actual:guesstype);

{Pre: <actual> stores a string of the word with blanks

 Post: <actual> has been written to screen with blanks where not guessed}

Var

   I:integer;

Begin

     For I := 1 to maxlong do

         write (actual[I]);

end;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Function HowLong (VAR str: guesstype): integer;

{Pre:N/A

 Post:Returns the actual length of the string stored in <str>.

      The string is assumed to be padded with blanks }

Var

  pos:integer;

Begin

  pos := maxlong;

  While (Pos > 1) and (str[Pos] = ' ') do

    Begin

      pos := pos - 1;

      If str[pos] = ' ' then

        HowLong := 0

      Else HowLong := pos;

    end;

end;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Function Insert(Ch:char; VAR str: guesstype): Boolean;

{Pre:<ch> is the letter guess. <str> is the actual word.

 Post: Enters letter in the array to see if any match. <ch> is the letter guess.

       <str> is the actual word.}

Var

  I,let:integer;

Begin

  I := 1;

  let := HowLong(str);

  While (str[I] <> Ch) and (I <= let) do

      I := I+1;

      insert := str[I] = Ch

end;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Procedure PutIn(Ch: char; var Source,Dest:guesstype);

{ Pre: N/A <ch> is the letter guessed

  Post: The letter is inserted in place of a blank.}



var

    I: integer;



begin

     for I := 1 to HowLong(Source) do

       if Source[I] = Ch then

         Dest[I] := Ch

end;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Procedure GuessWhole  (last:integer; VAR gesit:guesstype);

{Pre: <last> is the length of the actual word. <gesit> is blank.

 Post: <last> is the length of the actual word <gesit> is the whole word guess.}

Var

  A:integer;

  guessing:guesstring;

Begin

  clrscr;

  write ('You Chose to guess the whole word, what is your answer?: ');

  readln (guessing);

  For A := 1 to last do

    Begin

      guessing[A] := upcase(guessing[A]);

    end;

  For A := 1 to last do

    Begin

      gesit[A] := guessing[A];

    end;

end;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Procedure Title;

{Pre:N/A

 Post:N/A}

 Var

   E,W:integer;

Begin

  clrscr;

  randomize;

  For W:= 1 to 12 do

    Begin

      E := random(15);

      textcolor(E);

      writeln ('ÆŞ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±° WELL-  °Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±µ':72);

      writeln ('Æ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş   HUNG ±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²µ':72);

      writeln ('Æ±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²     â ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Şµ':72);

      writeln ('Æ°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²± â     Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°µ':72);

      delay(100);

      clrscr;

      E := random(15);

      textcolor(E);

      writeln ('Æ°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²± WELL-  Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°µ':72);

      writeln ('ÆŞ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°   HUNG °Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±µ':72);

      writeln ('Æ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş    â  ±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²µ':72);

      writeln ('Æ±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²  â    ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Şµ':72);

      delay(100);

      clrscr;

      E := random(15);

      textcolor(E);

      writeln ('Æ±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş² WELL-  ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Şµ':72);

      writeln ('Æ°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±   HUNG Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°µ':72);

      writeln ('ÆŞ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°   â   °Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±µ':72);

      writeln ('Æ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş   â   ±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²µ':72);

      delay(100);

      clrscr;

      E := random(15);

      textcolor(E);

      writeln ('Æ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş WELL-  ±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²µ':72);

      writeln ('Æ±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²   HUNG ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Şµ':72);

      writeln ('Æ°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±  â    Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°µ':72);

      writeln ('ÆŞ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°    â  °Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±µ':72);

      delay(100);

      clrscr;

    end;

  textcolor(11);

  writeln ('ÆŞ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±° WELL-  °Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±µ':72);

  writeln ('Æ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş   HUNG ±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²µ':72);

  writeln ('Æ±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²     â ²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Şµ':72);

  writeln ('Æ°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²± â     Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°Ş²±°µ':72);

end;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Procedure TakeOut (VAR nomore:guesstring;whatlett:char);

Var

  takeloop:integer;

Begin

  For takeloop := 1 to 26 do

    Begin

      If (whatlett = nomore[takeloop]) then

        Begin

          nomore[takeloop] := ('Û');

        end;

    end;

end;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}



Procedure StrngRead (Var s: guesstype );

{Pre: user is prepared to enter a string

 Post: characters have been read from the keyboard and placed into <s>.

 The unused portion of s is filled with blanks. <Return> key ends the run.}



Var

  blankpos, currlength:integer;



Begin

  currlength:=0;

  While (not Eoln) and (currlength < maxlong) do

    Begin

      currlength:= currlength + 1;

      read (s[currlength]);

    end;

    readln;

    For blankpos := currlength + 1 to maxlong do

      s[blankpos] := ' '

end;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Procedure GuessEntry (VAR wordz:guesstype; VAR already:guesstring);

{Pre: <wordz> has to be entered by the guesser.

 Post: Win or lose is decided upon completion or tries.}



Var

    V,W,I,S,X,mis,let,try:integer;

   ch:char;

   spare,letr:guesstype;



Begin

  mis:=0;

  let := HowLong(wordz);

  clrscr;

  write ('UNUSED LETTERS: ³');

    For V := 1 to 26 do

      Begin

        write (already[V],'³');

      end;

    writeln;

  Writeln(' You are allowed to have ',maxguess,' mistakes');

  Writeln('Word is ');

  For X := 1 to let do

    Begin

      wordz[X] := upcase(wordz[X]);

      letr[X] := '*';

      Write('-')

    end;

  For X := let + 1 to maxlong do

      letr[X] := ' ';

      WriteLn;

      try := 0;

      Repeat

          Write('Enter a letter or <!> to guess the word? ');

          ch := ReadKey;

          ch := UpCase(ch);

          TakeOut (already,ch);

          WriteLn(ch);

          delay(600);

          CLRSCR;

          If ch = '!' then

           Begin

              For W := 1 to let do

                Begin

                  spare[W] := letr[W];

                end;

              GuessWhole (let,letr);

              If (letr <> wordz) then

                Begin

                  for W := 1 to let do

                    Begin

                      letr[W] := spare[W];

                    end;

                  try := try + 1;

                  mis := mis + 1;

                  writeln ('WRONG....You have incorrectly guessed the word!');

                  WRITELN;

                  writeln ('You took ',try,' turns and made ',mis,' mistakes');

                  WriteLn ('Word is ', letr);

                end;

           end

          Else If ch <> '!' then

            Begin

              If insert(ch, wordz) then

                Begin

                  PutIn (ch, wordz, letr);

                  write ('UNUSED LETTERS: ³');

                  For V := 1 to 26 do

                    Begin

                      write (used[V],'³');

                    end;

                  writeln;

                  writeln;

                  WriteLn ('Word is ', letr)

                end

              Else

                Begin {graphics}

                  write ('UNUSED LETTERS: ³');

                  For V := 1 to 26 do

                    Begin

                      write (used[V],'³');

                    end;

                  writeln;

                  writeln;

                  writeln ('Sorry, there are no ', ch, '''s');

                  writeln ('In the word ', letr);

                  mis:= mis + 1;

                  If mis = 1 then

                    Begin

                      for I := 800 downto 700 do

                        BEGIN

                          sound(I);

                          delay(10);

                        END;

                      NOSOUND;

                      writeln ('      ÑÍÍÍÍÍÍÍÍ»');

                      writeln ('      ³        º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º\ ');

                      writeln('ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶  \');

                      writeln('º              º    \');

                    end

                  Else If mis =2 then

                    Begin

                      for I := 700 downto 600 do

                        BEGIN

                          sound(I);

                          delay(10);

                        END;

                      NOSOUND;

                      writeln ('      ÑÍÍÍÍÍÍÍÍ»');

                      writeln ('      ³        º');

                      writeln('    /^^^\      º');

                      writeln('  @( 0¿0 )@    º');

                      writeln('    \ ì /      º');

                      writeln('              º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º\ ');

                      writeln('ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶  \');

                      writeln('º              º    \');

                    end

                  Else If mis =3 then

                    Begin

                      for I := 600 downto 500 do

                        BEGIN

                          sound(I);

                          delay(10);

                        END;

                      NOSOUND;

                      writeln ('      ÑÍÍÍÍÍÍÍÍ»');

                      writeln ('      ³        º');

                      writeln('    /^^^\      º');

                      writeln('  @( 0¿0 )@    º');

                      writeln('    \ ì /      º');

                      writeln('              º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º');

                      writeln('               º\ ');

                      writeln('ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶  \');

                      writeln('º              º    \');

                    end

                  Else If mis =4 then

                    Begin

                      for I := 500 downto 400 do

                        BEGIN

                          sound(I);

                          delay(10);

                        END;

                      NOSOUND;

                      writeln ('      ÑÍÍÍÍÍÍÍÍ»');

                      writeln ('      ³        º');

                      writeln('    /^^^\      º');

                      writeln('  @( 0¿0 )@    º');

                      writeln('    \ ì /      º');

                      writeln('              º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('       \       º');

                      writeln('        İ      º');

                      writeln('        İ      º');

                      writeln('        İ      º');

                      writeln('        İ      º\ ');

                      writeln('ÖÄÄÄÄÄÄÄÊÄÄÄÄÄÄ¶  \');

                      writeln('º              º    \');

                    end

                  Else If mis =5 then

                    Begin

                      for I := 400 downto 300 do

                        BEGIN

                          sound(I);

                          delay(10);

                        END;

                      NOSOUND;

                      writeln ('      ÑÍÍÍÍÍÍÍÍ»');

                      writeln ('      ³        º');

                      writeln('    /^^^\      º');

                      writeln('  @( 0¿0 )@    º');

                      writeln('    \ ì /      º');

                      writeln('              º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('     / \       º');

                      writeln('    Ş   İ      º');

                      writeln('    Ş   İ      º');

                      writeln('    Ş   İ      º');

                      writeln('    Ş   İ      º\ ');

                      writeln('ÖÄÄÄÊÄÄÄÊÄÄÄÄÄÄ¶  \');

                      writeln('º              º    \');

                    end

                  Else If mis =6 then

                    Begin

                      for I := 300 downto 200 do

                        BEGIN

                          sound(I);

                          delay(10);

                        END;

                      NOSOUND;

                      writeln ('      ÑÍÍÍÍÍÍÍÍ»');

                      writeln ('      ³        º');

                      writeln('    /^^^\      º');

                      writeln('  @( 0¿0 )@    º');

                      writeln('    \ ì /      º');

                      writeln('\             º');

                      writeln('  \   ²        º');

                      writeln('    \ ²        º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('     / \       º');

                      writeln('    Ş   İ      º');

                      writeln('    Ş   İ      º');

                      writeln('    Ş   İ      º');

                      writeln('    Ş   İ      º\ ');

                      writeln('ÖÄÄÄÊÄÄÄÊÄÄÄÄÄÄ¶  \');

                      writeln('º              º    \');

                    end

                  Else If mis =7 then

                    Begin

                      for I := 200 downto 100 do

                        BEGIN

                          sound(I);

                          delay(10);

                        END;

                      NOSOUND;

                      writeln ('      ÑÍÍÍÍÍÍÍÍ»');

                      writeln ('      ³        º');

                      writeln('    /^^^\      º');

                      writeln('  @( 0¿0 )@    º');

                      writeln('    \ ì /      º');

                      writeln('\         /   º');

                      writeln('  \   ²  /     º');

                      writeln('    \ ²/       º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('     / \       º');

                      writeln('    Ş   İ      º');

                      writeln('    Ş   İ      º');

                      writeln('    Ş   İ      º');

                      writeln('    Ş   İ      º\ ');

                      writeln('ÖÄÄÄÊÄÄÄÊÄÄÄÄÄÄ¶  \');

                      writeln('º              º    \');

                    end

                  Else If mis=8 then

                    Begin

                      begin

                        for I := 400 downto 50 do

                          BEGIN

                            sound(I);

                            DELAY(1);

                          END;

                        sound(400);

                        delay(20);

                        sound(300);

                        delay(20);

                        sound(200);

                        delay(20);

                        sound(100);

                        delay(20);

                        SOUND(50);

                        DELAY(20);

                        nosound;

                      end;

                      clrscr;

                      writeln ('      ÑÍÍÍÍÍÍÍÍ»');

                      writeln ('      ³        º');

                      writeln('    /^^^\      º');

                      writeln('  @( í¿í )@    º');

                      writeln('    \ ì /      º');

                      writeln('              º');

                      writeln('      ²        º');

                      writeln('      ²        º');

                      writeln('    / ² \      º');

                      writeln('   ³  ²  ³     º');

                      writeln('   ³ / \ ³     º');

                      writeln('   õŞ   İõ     º');

                      writeln('    Ş   İ      º');

                      writeln('    Ş   İ      º');

                      writeln('    Ş   İ      º\ ');

                      writeln('ÖÄÄ\­   ­ /ÄÄÄÄ¶  \');

                      writeln('º   \    /     º    \');

                      writeln ('...YOU DIED!...');

                      WRITELN;

                    end;

                end; {graphics}

              If (mis < maxguess) and (letr <> wordz) then

                Begin

                  try := try + 1;

                  writeln ('You took ',try,' turns and made ',mis,' mistakes');

                  writeln;

                end;

            end;

     Until (letr = wordz) or (mis >= maxguess);

       If (letr = wordz) then

         Begin

           for I := 550 to 800 do

             BEGIN

               sound(I);

               delay(2);

             END;

           SOUND(50);

           DELAY(80);

           sound(100);

           delay(80);

           sound(200);

           delay(80);

           sound(300);

           delay(80);

           sound(400);

           delay(80);

           sound(500);

           delay(80);

           sound(600);

           delay(80);

           NOSOUND;

           writeln ('Congratulations!, You have correctly guessed the word!');

           try := try+1;

           writeln ('You took ',try,' turns and made ',mis,' mistakes');

           delay(4000);

         end

       Else If (mis >= maxguess) then

         Begin

           writeln ('You have incorrectly guessed the word!');

           try := try+1;

           write ('The word was ');

           TheWord (wordz);

           WRITELN;

           writeln ('You took ',try,' turns and made ',mis,' mistakes');

           writeln ('Sorry.....Try again!.......');

           DELAY(4000);

           clrscr;

         end;

end;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Procedure Intro (ans:char);

{Pre:N/A <ans> is nothing.

 Post: tells player instructions to game if requested. <ans> is Y or N.}

Begin

   While ((ans <>'N') and (ans <>'Y')) do

         Begin {check}

              write ('You may only answer Y or N: ');

              readln (ans);

              ans := upcase(ans);

         end; {check}

   If (ans = 'Y') then

      Begin {need info}

        writeln;

        writeln ('A word was entered by another player. You have ',maxguess,' to guess the word.');

        writeln;

        writeln ('DO NOT press the <space> bar or <Enter> key after your entry, They are counted ');

        writeln;

        writeln ('as a guess and will be counted against you if pressed!');

        writeln;

        writeln ('The program will automatically read your entry WITHOUT pressing them, so don''t');

        writeln;

        writeln ('press them!');

        writeln;

        writeln ('Strike a key to begin......');

        readkey;

      end; {need info}

    clrscr;

end;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Procedure AlreadyTried (VAR entry:guesstring);

Var



  current,L:integer;

Begin

  current := 65;

  For L := 1 to 26 do

    Begin

      entry[L] := (char(current));

      current := current + 1;

    end;

end;



{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Procedure StringEntry (VAR enigma:guesstype);

{Pre: The user is told to enter a word that will be <enigma>.

 Post: letters have been read from the keyboard and placed into <enigma>.

      The unused part of <enigma> is filled with blanks.}



Var

   blanks,preslngth:integer;



Begin

     preslngth:=0;

     While (not eoln) and (preslngth < maxlong) do

           Begin {take in}

             preslngth:= preslngth + 1;

             read (enigma[preslngth]);

           end;  {take in}

     readln;

     For blanks := preslngth + 1 to maxlong do

       Begin {empty fill}

         enigma[blanks] := ' ';

       end; {empty fill}

end;

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Procedure Charerrck (var rep:char);



Begin {check ans}

  While (rep <> 'Y') and (rep <> 'N') do

    Begin {while}

      textcolor(33);

      writeln;

      writeln ('°±²!ERROR!²±°':45);

      delay(2500);

      clrscr;

      textcolor(11);

      writeln;

      writeln;

      write ('Enter only Y/NÄÄ ':45);

      rep := readkey;

      rep := upcase (rep);

    end; {while}

end; {check ans}

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Procedure Repit (VAR ch:char);

Var

  cr:char;

  rid:integer;

Begin {goagain}

  textcolor(2);

  write ('Do you wish to try again? Y/NÄÄ ');

  ch := readkey;

  ch := upcase (ch);

  charerrck (ch);

  If (ch = 'N') then

    begin

      clrscr;

      Title;

      textcolor(37);

      writeln;

      writeln ('Thanks for playing WELL-HUNG....Bye!':58);

      textcolor(11);

      delay(4000);

    end;

  If (ch = 'Y') then

    begin

      writeln;

      writeln;

    end;

end; {goagain}

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

{’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’’}

Begin {main}

  Title;

  Repeat

    AlreadyTried (used);

    clrscr;

    Write('Enter word that is to be guessed: ');

    StringEntry(realword);

    clrscr;

    Write ('Do you need instuctions to play HANG-MAN (Y/N)?: ');

    inst := readkey;

    inst := upcase(inst);

    Intro (inst);

    GuessEntry (realword,used);

    clrscr;

    Repit (again);

  Until (again = 'N');

end. {main}



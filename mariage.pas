program mariage;
uses wincrt;
type sex=(masculin,feminin);
type personne= record
          nom:string[25];
          age:real;
          sexe:sex;
end;
var p:personne;
begin
     p.nom:='FOTSO';
     p.age:=40;
     p.sexe:=masculin;
     writeln('Bonjour ',p.nom,' tu as', p.age,' ans.');
end.
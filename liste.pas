program TriListe;
uses wincrt;
const l=25;
type pointeur=^element;
     element= record
                        nom: string[l];
                        suiv:pointeur;
                        prec:pointeur;
               end;
var p,q,t,r,s:pointeur;
    i,n:integer;
begin
   write('Longueur de la liste : ');
   readln(n);
   writeln('Entrer de la liste : ');
   new(p);
   readln(p^.nom);
   p^.suiv:=nil;
   p^.prec:=nil;
   q:=p;
   for i:= 2 to n do
    begin
        new(q^.suiv);
        readln((q^.suiv)^.nom);
        (q^.suiv)^.prec:=q;
        q:=q^.suiv;
        q^.suiv:=nil;
    end;
    t:=p;
    writeln('Voici la liste saisie: ');
    while (t<>nil) do
     begin
         write(t^.nom,' ');
         t:=t^.suiv;
     end;
    t:=p;
    r:=q;
    while (t<>q) do
     begin
      r:=q;
      while (r<>t) do
       begin
           if (r^.nom<(r^.prec)^.nom)then
            begin
                (r^.prec)^.suiv:=r^.suiv;
                if (r^.suiv<>nil) then (r^.suiv)^.prec:=r^.prec;
                r^.suiv:=r^.prec;
                r^.prec:=(r^.prec)^.prec;
                (r^.suiv)^.prec:=r;
                if (r^.prec<>nil) then (r^.prec)^.suiv:=r;
                if (r^.suiv=p)then
                 begin
                     p:=r;
                     t:=r;
                 end;
                if (r^.suiv=t)then t:=r;
                if (r=q) then q:=r^.suiv;
            end
           else r:=r^.prec;
           s:=p;
           writeln(' ');
           writeln(' ');
           writeln('La liste actuelle: ');
           while (s<>nil) do
            begin
             write(s^.nom,' ');
             s:=s^.suiv;
            end;
       end;
      t:=t^.suiv;
     end;
     s:=p;
     writeln(' ');
     writeln(' ');
     writeln('Voici la liste triée: ');
     while (s<>nil) do
      begin
       write(s^.nom,' ');
       s:=s^.suiv;
      end;
     dispose(p); (*libère l'espace d'adresse p*)
     dispose(q);
     {
     dispose(t); déjà fait, vu que t=q
     dispose(s); déjà fait, vu que s=nil
     dispose(r); déjà fait, vu que r=t
     }
end.
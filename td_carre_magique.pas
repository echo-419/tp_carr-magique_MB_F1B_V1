program carre_magique;

uses crt;

const
        Taille=5;

Type
        tableau=array[1..Taille,1..Taille] of integer;


{but: initialiser le tableau et le chiffre 1;
entrer: les parametres;
sortie: le tableau avec le chiffre 1 ;
}
procedure init(var Tab:tableau; var i,j:integer);
var
        a,b:integer;
begin
        a:=i;
        b:=j;
        for a:=1 to Taille do               //initialisation tableau
                begin
                for b:=1 to Taille do
                        Tab[i,j]:=0;
                end;

                 i:= (Taille mod 2);                //coordonnee du 1
                 j:= (Taille mod 2)+1;
                 Tab[i,j]:=1;

end;

{but: remplire le tableau avec les chiffres;
entrer: les parametres;
sortie: le tableau remplit des chiffres ;
}
procedure nombre (var Tab: tableau; var i,j,compteur:integer);
var
        cpt:integer;

begin
         i:= (Taille mod 2);
         j:= (Taille mod 2)+1;
         cpt:=compteur;
         //on va au nord est depuis le 1
         i:=i-1;                             //nord
         j:=j+1;                             //est

        for cpt:=2 to (Taille*Taille)  do
                begin


                if (Tab[i,j]=0)then          //si la case est vide
                        Tab[i,j]:= cpt;
                        i:=i-1;                             //nord
                        j:=j+1;                             //est
                        if (j+1>Taille) then                       //extremit‚ du tableau par la gauche
                                j:=1;
                        if (j-1=0) then                             //extremit‚ du tableau par la droit
                                j:=Taille;
                        if (i-1=0) then                             //extremit‚ du tableau par le haut
                                begin
                                i:= Taille;
                                end;

                if (Tab[i,j]<>0) then               //si la case est pleine
                        while (Tab[i,j]<>0) do
                                begin
                                i:=i-1;             //nord
                                j:=j-1;             //ouest

                                if (j+1>Taille) then                       //extremit‚ du tableau par la gauche
                                        j:=1;
                                if (j-1=0) then                             //extremit‚ du tableau par la droit
                                         j:=Taille;
                                if (i-1=0) then                             //extremit‚ du tableau par le haut
                                        begin
                                        i:= Taille;
                                        end;
                                end;


        end;
        writeln (Tab[i,j]);                                //on affiche le tableau
end;

Var
        t:array[1..Taille,1..Taille] of integer;
        i,j,compteur:integer;

BEGIN
clrscr;

init(t,i,j);
nombre(t,i,j,compteur);

readln;
END.


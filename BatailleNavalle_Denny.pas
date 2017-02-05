{
Programme se lancant mais ne fonctionnant pas
ALGO:BatailleNavalle
BUT:Creer une bataille navalle
ENTREE:Tous ce qu'il faut our une bataille navalle
SORTIE:Le Jeu de la bataille navalle

CONST
	b1<-6
	b2<-5
	b3<-4
	b4<-3
	b5<-2
	Ncell<-10
Type cell=enregistrement
		x: Entier
FinEnregistrement
Type bateau=enregistrement
		b11,b22,b33,b44,b55:Entier
FinEnregistrement
Type flotte=enregsitrement
		bat:Tableau[1..Ncell,1..Ncell] de bateau
FinEnregistrement
Type
	grille:Tableau[1..Ncell*Ncell] de cell
	bat:Tableau[1..Ncell,1..Ncell] de bateau
Procedure creation (VAR place:grille)
var
	i,j:Entier
DEBUT
	POUR i de 1 a Ncell*Ncell faire
		place[i].x<-0
		ecrire(place[i].x)
		SI i MOD Ncell=0 alors
			FinSI
	FinPour
FinEnregistrement
Fonction appartientAuBateau(tab:grille, place:grille):Booleen
var
	x,y,i:entier
	appartienAUnBateau:booleen
DEBUT
	Ecrire "Coordonnee sur X : "
	Lire x
	Tant que x<1 OU x>Ncell faire
		Ecrire "Tu peux uniquement tirer sur les cases de 1 a "&Ncell&": "
		ecrire x
	FinTantQue
	Ecrire "Coordonnee sur Y: "
	Lire y
	Tant que y<1 OU y>Ncell faire
		Ecrire "Tu peux uniquement tirer sur les cases de 1 a "&Ncell&": "
		Lire y
	FinTantQue
	appartientAUnBateau<- tire(tab,x,y)
	Si appartienAUnBateau Alors
		Ecrire "Touche!"
	Sinon
		Ecrire "Manque!"
END
VAR
	tab:grille
	flote:bat
	place:grille
	i:entier
DEBUT
	creation(tab)
	placement_bateau(tab, flote)
	REPETER
		appartientAuBateau(tab,place)
		i<-i+10
	JUSQUA
FIN
}
program bataille_navale;
uses crt;

const
	b1=6;			// b1 signifie bateau 1
	b2=5;
	b3=4;
	b4=3;
	b5=2;
	Ncell=10;
type
	cell=record
	x:integer;	
end;

type
	bateau=record
	b11,b22,b33,b44,b55:integer;
end;

type
	flotte=record
	bat:array [1..Ncell,1..Ncell] of bateau;
	
end;



type
	grille=array [1..Ncell*Ncell] of cell;
	bat=array [1..Ncell,1..Ncell] of bateau;

	
procedure creation (var place:grille);
var
	i,j:integer;

begin
	for i:=1 to Ncell*Ncell do
		begin
			place[i].x:=0;
			write(place[i].x);
			if(i mod Ncell = 0) then
				writeln;
		end;
	writeln;
end;

function tire(Ttab:grille; x:integer; y:integer):boolean;
begin
	if (Ttab[(y-1)*Ncell + x].x = 1) then
	begin
		Exit(True);
    end
	else
	begin
		Exit(False);
	end;
end;

procedure placement_bateau(var tab:grille; boat:bat);
var
	i, j: integer;
	choixX, choixY: integer;
begin
	for i:= b5 to b1 do
	begin
		write('Sur quelle x voulez-vous placer le bateau de taille ', i, ': ');
		readln(choixX);
		while((choixX < 1) or (choixX > Ncell)) do
		begin
			write('La coordonnee sur X doit etre superieur ou egal a 1 et inferieur a ', Ncell, ': ');
			readln(choixX);
		end;
		
		write('Sur quelle y voulez-vous placer le bateau de taille ', i, ': ');
		readln(choixY);
		while((choixY < 1) or (choixY + i > Ncell)) do
		begin
			write('La coordonnee sur Y doit etre superieur ou egal a 1 et inferieur a ', Ncell - i + 1, ': ');
			readln(choixY);
		end;
		
		for j:= 1 to i do
		begin
			tab[(ChoixY-1)*Ncell + choixX + (j-1)*Ncell].x := 1;
		end;
	end;
	
	for i:= 1 to Ncell*Ncell do
	begin
		write(tab[i].x);
		if(i mod Ncell = 0) then
			writeln;
	end;
end;
	
function appartientAuBateau(tab:grille; place:grille): boolean;
var
	x, y , i: integer;
	appartientAUnBateau : boolean;
begin
	write('Coordonnee sur X: ');
	readln(x);
	while ((x<1) or (x>Ncell)) do
	begin
		write ('Tu peux uniquement tirer sur les cases de 1 a ',Ncell,': ');
		readln (x);
	end;
	write ('Coordonner sur y: ');
	readln(y);
	while ((y<1) or (y>Ncell)) do
	begin
		write ('Tu peux uniquement tirer sur les cases de 1 a ',Ncell,': ');
		readln (y);
	end;
	
	appartientAUnBateau := tire(tab, x, y);
	if(appartientAUnBateau) then
		begin
			writeln('Touche!');
		end
	else
		writeln('Manque!');
end;
	
var
	tab: grille;
	flote: bat;
	place:grille;
	i:integer;
	sortie:integer;
	
begin
    clrscr;
	creation(tab);
	placement_bateau(tab, flote);
	repeat
		appartientAuBateau(tab,place);
		i:=i+1;
		writeln('Appuyez sur 1 pour quitter ou 0 pour continuer')
	until sortie=1;
	readln;
end.

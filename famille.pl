homme(jean).
homme(fabien).
homme(jerome).
homme(emile).
homme(franck).
homme(bruno).
homme(marc).
femme(evelyne).
femme(louise).
femme(julie).
femme(anne).
femme(aurelie).
femme(sophie).
femme(marie).
femme(eve).
pere(emile,jean).
pere(jean,fabien).
pere(fabien,eve).
pere(jean,jerome).
pere(bruno,evelyne).
pere(bruno,franck).
pere(franck,sophie).
pere(franck,aurelie).
mere(louise,jean).
mere(julie,evelyne).
mere(julie,franck).
mere(evelyne,fabien).
mere(evelyne,jerome).
mere(anne,sophie).
mere(anne,aurelie).
mere(marie,eve).
mere(sophie,marc).
parent(X,Y) :- mere(X,Y); pere(X,Y).
fils(X,Y) :- parent(Y,X),homme(X).
fille(X,Y) :- parent(Y,X),femme(X).
grand-pere(X,Y) :- parent(P,Y), pere(X,P).
grand-mere(X,Y) :- parent(P,Y), mere(X,P).
gdparent(X,Y):-  grand-pere(X,Y); grand-mere(X,Y).
agdpere(X,Y) :- gdparent(P,Y),pere(X,P).
agdmere(X,Y) :- gdparent(P,Y),mere(X,P).
freresoeur(X,Y):-pere(P,X), pere(P,Y), mere(M,X), mere(M,Y), X \== Y.
frere(X,Y) :- homme(X), pere(P,X), pere(P,Y), mere(M,X), mere(M,Y), X \== Y.
soeur(X,Y) :- femme(X), pere(P,X), pere(P,Y), mere(M,X), mere(M,Y), X \== Y.
femme_de(X,Y):- femme(X), homme(Y), fils(P,X), fils(P,Y) ; fille(P,X),fille(P,Y).
mari(X,Y):-femme(Y), homme(X),fils(P,X),fils(P,Y) ; fille(P,X),fille(P,Y).
beaufrere(X,Y):- frere(X,Z), mari(Z,Y).
beaufrere(X,Y):- frere(X,Z),femme_de(Z,Y).
bellesoeur(X,Y):- soeur(X,Z), mari(Z,Y).
bellesoeur(X,Y):- soeur(X,Z), femme_de(Z,Y).
ancetre(X, Y) :- parent(X , Y).
ancetre(X, Y) :- parent(X , Z), ancetre(Z , Y).

%utah 
cost_living(utah,750).
pollution_level(utah,5).
crime_rate(utah,41).
transport_services(utah,no).
gas_price(utah,2.57).
health_care(utah,[10000,120]).

%Texas
cost_living(texas,1000).
pollution_level(texas,20).
crime_rate(texas,43).
transport_services(texas,no).
gas_price(texas,1.86).
health_care(texas,[19000,300]).

%Florida
cost_living(florida,2500).
pollution_level(florida,50).
crime_rate(florida,80).
transport_services(florida,yes).
gas_price(florida,2.2).
health_care(florida,[33000,350]).

%Arizona
cost_living(arizona,1500).
pollution_level(arizona,30).
crime_rate(arizona,40).
transport_services(arizona,no).
gas_price(arizona,2.01).
health_care(arizona,[26000,200]).

%california
cost_living(california,3000).
pollution_level(california,80).
crime_rate(california,60).
transport_services(california,yes).
gas_price(california,2.5).
health_care(california,[85000,400]).

%taxes
tax_rate(texas,6.25).
tax_rate(california,7.5).
tax_rate(utah,5.95).
tax_rate(florida,6).
tax_rate(arizona,5.6).

%minimum wage
minimum_wage(texas,7.25).
minimum_wage(california,10).
minimum_wage(utah,7.25).
minimum_wage(florida,8.05).
minimum_wage(arizona,8.05).


%disease
disease(cancer,50).
disease(asthma,40).

%Based_on_income
income(L,Y):- L < 65000,  cost_living(Y,750), write(Y).
income(L,Y):- L > 65000, L < 80000, cost_living(X,1000), write(X).
income(L,Y):- L > 80000, L < 95000, cost_living(X,1500), write(X).
income(L,Y):- L > 95000, L < 110000, cost_living(X,2500), write(X).
income(L,Y):- L > 110000, cost_living(X,3000), write(X).

public_transport(X) :- transport_services(X,Y).
private_transport(X):- gas_price(L,Y), Y @=< X, write(L).
safety(X) :-  crime_rate(Z,Y),Y < X, write(Z).
health(X,Y):-  write(X),income(X),write(Y),disease(Y,Z),write(Z),pollution_level(A,B), B<Z ,write(A).

best_place(health,Y)  :- pollution_level(Y,Z),Z<60, health_care(Y,[_,X]),X @>= 300.
best_place(economy,State) :- gas_price(State,Price), Price < 2.05,health_care(State,[P,_]),P < 30000,cost_living(State,Z), Z < 2000.
best_place(student) :- best_place(economy,State),minimum_wage(State,W),write(W).

%list_crime_rate(Y):- crime_rate(Z,X).
%list_crime_rate(Y):- Y=[X,list_crime_rate(_,X)].

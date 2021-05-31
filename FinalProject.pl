check:-
write('*******CORONA, MALARIA AND DENGUE CHECKER******'),
nl,
nl,
checkfor(Disease),
write('I believe that the patient have '),
write(Disease),
nl,
write('TAKE CARE '),
undo.

checkfor(covid):- covid,!.
checkfor(malaria) :- malaria,!.
checkfor(dengue) :- dengue,!.
checkfor(no_disease).


covid:-
checkSymptom(fever_or_chills),
checkSymptom(cough),
checkSymptom(breathing_difficulty),
checkSymptom(fatigue),
write('Advices and Sugestions:'),
nl,
write('1: Stay isolated in one room '),
nl,
write('2: Wear a face mask when near others.'),
nl,
write('3: Clean often-touched surfaces'),
nl,
nl,
write('Please qurantine yourself or contact doctor because'),
nl.


malaria :-
checkSymptom(fever),
checkSymptom(sweating),
checkSymptom(headache),
checkSymptom(nausea),
checkSymptom(vomiting),
checkSymptom(diarrhea),
write('Advices and Sugestions:'),
nl,
write('1: Aralen/tab'),
nl,
write('2: Qualaquin/tab'),
nl,
write('3: Plaquenil/tab'),
nl,
write('4: Mefloquine'),
nl,
nl,
write('Please do not sleep in open air and cover your full skin because'),
nl.


dengue :-
checkSymptom(high_fever),
checkSymptom(headache),
checkSymptom(pain_behind_eyes),
checkSymptom(vomiting),
checkSymptom(joint_pain),
write('Advices and Sugestions:'),
nl,
write('1: Preventing dehydration'),
nl,
write('2: tylenol or paracetamol/tab'),
nl,
write('3: Non-steroidal anti-inflammatory drugs (NSAIDs), such as aspirin or ibuprofen, are not advised, as they can increase the risk of internal bleeding.'),
nl,
nl,
write('Please do not sleep in open air and cover your full skin because'),
nl.

askQuestion(Question):-
write('Do you have the following symptom:'),
write(Question),
write('? '),
read(Reply),
nl,
((Reply == yes ; Reply == y)
->
assert(yes(Question));  
assert(no(Question)),fail).  

:- dynamic yes/1,no/1.  

checkSymptom(S):-
(yes(S)
->
true ;
(no(S)
->
fail ;
askQuestion(S))).



go:-
write('*******BLOOD BANK******'),
nl,
nl,
bloodtest(_Bloodcheck),
write('To donate blood you have to be above 16, weigh at least 110 pounds and not have donated in 56 days.'),
nl,
write('TAKE CARE '),
undo.

bloodtest(a_positive):- a_positive,!.
bloodtest(a_negative):- a_negative,!.
bloodtest(b_positive) :- b_positive,!.
bloodtest(b_negative) :- b_negative,!.
bloodtest(ab_positive) :- ab_positive,!.
bloodtest(ab_negative) :- ab_negative,!.
bloodtest(o_positive):- o_positive,!.
bloodtest(o_negative):- o_negative,!.

a_positive :-
checkType(a),
write('You can donate to A+,AB+'),
nl,
write('Dont donate blood if you have HIV/SIFILIS/HEPATISIS-B'),
nl.

a_negative :-
checkType(a_neg),
write('You can donate to A-,A,AB-,AB'),
nl,
write('Dont donate blood if you have HIV/SIFILIS/HEPATISIS-B'),
nl.

b_positive:-
checkType(b),
write('You can donate to B,AB'),
nl,
write('Dont donate blood if you have HIV/SIFILIS/HEPATISIS-B'),
nl.

ab_positive:-
checkType(ab),
write('You can donate to AB'),
nl,
write('Dont donate blood if you have HIV/SIFILIS/HEPATISIS-B'),
nl.

o_positive :-
checkType(o),
write('You can donate to O,A,B,AB'),
nl,
write('Dont donate blood if you have HIV/SIFILIS/HEPATISIS-B'),
nl.

b_negative:-
checkType(b_neg),
write('You can donate to B-,B+,AB-,AB'),
nl,
write('Dont donate blood if you have HIV/SIFILIS/HEPATISIS-B'),
nl.

ab_negative:-
checkType(ab_neg),
write('You can donate to AB-,AB+'),
nl,
write('Dont donate blood if you have HIV/SIFILIS/HEPATISIS-B'),
nl.

o_negative :-
checkType(o_neg),
write('You can donate to all types of blood'),
nl,
write('Dont donate blood if you have HIV/SIFILIS/HEPATISIS-B'),
nl.

ask(Q):-
write('Is your blood type:'),
write(Q),
write('? '),
read(Reply),
nl,
((Reply == yes ; Reply == y)
->
assert(yes(Q));  
assert(no(Q)),fail).  

:- dynamic yes/1,no/1.  

checkType(B):-
(yes(B)
->
true ;
(no(B)
->
fail ;
ask(B))).

undo:-retract(yes(_)),fail.
undo:-retract(no(_)),fail.
undo.
undo:-retract(yes(_)),fail.
undo:-retract(no(_)),fail.
undo.

donate_to(o,o).
donate_to(o,a).
donate_to(o,b).
donate_to(o,ab).
donate_to(a,a).
donate_to(a,ab).
donate_to(b,b).
donate_to(b,ab).
donate_to(ab,ab).
donate_to(on,o).
donate_to(on,a).
donate_to(on,b).
donate_to(on,ab).
donate_to(on,on).
donate_to(on,an).
donate_to(on,bn).
donate_to(on,abn).
donate_to(an,a).
donate_to(an,an).
donate_to(an,ab).
donate_to(an,abn).
donate_to(bn,ab).
donate_to(bn,b).
donate_to(bn,abn).
donate_to(bn,bn).
donate_to(abn,abn).
donate_to(abn,ab).


donor(asif,a).
donor(naim,b).
donor(amir,ab).
donor(imran,o).
donor(rafi,an).
donor(safi,bn).
donor(kafi,abn).
donor(hafiz,on).

has(asif,hiv).
has(naim,hepatisis_b).
has(imran,tonsil).

patient(riad,a).
patient(rakib,b).
patient(arif,o).
patient(sakib,ab).
patient(sarif,an).
patient(saik,bn).
patient(munna,abn).
patient(monir,on).

stocks(a,10).
stocks(b,20).
stocks(ab,19).
stocks(o,38).
stocks(an,17).
stocks(bn,15).
stocks(abn,18).
stocks(on,4).

unqualified_disease(hiv).
unqualified_disease(hepatisis_b).
unqualified_disease(sifilis).

compatibles(BLOODTYPE,PATIENT_NAME) :- patient(PATIENT_NAME,Y) , donate_to(BLOODTYPE,Y).

currently_available(BLOODTYPE,PATIENT_NAME) :- compatibles(BLOODTYPE,PATIENT_NAME) , stocks(BLOODTYPE,QTY) , QTY>0.

matches(DONOR_NAME,PATIENT_NAME) :- donor(DONOR_NAME,X) , compatibles(X,PATIENT_NAME).

qualified_donor(DONOR_NAME) :- has(DONOR_NAME,DISEASE) , not(unqualified_disease(DISEASE)).

match_and_qualified(DONOR_NAME,PATIENT_NAME) :- matches(DONOR_NAME,PATIENT_NAME) , qualified_donor(DONOR_NAME).

total_bag(TOTAL) :- stocks(a,QTY_A),stocks(b,QTY_B),stocks(ab,QTY_AB),stocks(o,QTY_O),stocks(an,QTY_An),stocks(bn,QTY_Bn),stocks(abn,QTY_ABn),stocks(on,QTY_On),TOTAL is QTY_A + QTY_B + QTY_AB + QTY_O + QTY_An + QTY_Bn + QTY_ABn + QTY_On.

low_stocks(BLOODTYPE) :- stocks(BLOODTYPE,QTY),QTY < 10.

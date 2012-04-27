abstract sig Index {}
sig Col extends Index {
  cell : Index -> Index
}

one sig 
One,Two,Three,Four,Five,Six,Seven,Eight,Nine
 extends Col{}

fact{
  all c : Col , row : Index | one cell[c,row]
}

fact {
all c1 , c2 : Col, r1,r2: Index | 
 ((c1 = c2) and (r1=r2))
 or (not (cell[c1,r1] = cell[c2,r2])) 
 or (not (c1=c2  or r1 = r2))
}

fact {
//(one r : Four |cell[One,One]=r)
(cell[One,One]=Four)
and
(one c : Col ,r : Index | c=Three and r = One and cell[c,r]=Two)
and
(one c : Col ,r : Index | c=Four and r = One and cell[c,r]=One)
and
(one c : Col ,r : Index | c=Five and r = One and cell[c,r]=Three)
and
(one c : Col ,r : Index | c=Two and r = Two and cell[c,r]=Six)
and
(one c : Col ,r : Index | c=Two and r = Three and cell[c,r]=Five)
and
(one c : Col ,r : Index | c=Four and r = Three and cell[c,r]=Eight)
and
(one c : Col ,r : Index | c=Five and r = Three and cell[c,r]=Seven)
and
(one c : Col ,r : Index | c=Nine and r = Three and cell[c,r]=Nine)
and
(one c : Col ,r : Index | c=Five and r = Four and cell[c,r]=Eight)
and
(one c : Col ,r : Index | c=Six and r = Four and cell[c,r]=Four)
and
(one c : Col ,r : Index | c=Seven and r = Four and cell[c,r]=Two)
and
(one c : Col ,r : Index | c=Eight and r = Four and cell[c,r]=Seven)
and
(one c : Col ,r : Index | c=Nine and r = Five and cell[c,r]=Eight)
and
(one c : Col ,r : Index | c=Two and r = Six and cell[c,r]=Three)
and
(one c : Col ,r : Index | c=Three and r = Six and cell[c,r]=Six)
and
(one c : Col ,r : Index | c=Five and r = Six and cell[c,r]=One)
and
(one c : Col ,r : Index | c=One and r = Seven and cell[c,r]=Two)
and
(one c : Col ,r : Index | c=Four and r = Seven and cell[c,r]=Nine)
and
(one c : Col ,r : Index | c=Eight and r = Seven and cell[c,r]=Three)
and
(one c : Col ,r : Index | c=Nine and r = Seven and cell[c,r]=Seven)
and
(one c : Col ,r : Index | c=Six and r = Eight and cell[c,r]=Five)
and
(one c : Col ,r : Index | c=Two and r = Nine and cell[c,r]=Four)


}

run{} for 13

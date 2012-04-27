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

fact{
all c:Col, r1,r2:Index | (r1=r2)or(not(cell[c,r1]=cell[c,r2]))
}
fact{
all c1,c2:Col, r:Index | (c1=c2)or(not(cell[c1,r]=cell[c2,r]))
}

fact {
(cell[One,One]=Four)
and
(cell[Three,One]=Two)
and
(cell[Four,One]=One)
and
(cell[Five,One]=Three)
and
(cell[Two,Two]=Six)
and
(cell[Two,Three]=Five)
and
(cell[Four,Three]=Eight)
and
(cell[Five,Three]=Seven)
and
(cell[Nine,Three]=Nine)
and
(cell[Five,Four]=Eight)
and
(cell[Six,Four]=Four)
and
(cell[Seven,Four]=Two)
and
(cell[Eight,Four]=Seven)
and
(cell[Nine,Five]=Eight)
and
(cell[Two,Six]=Three)
and
(cell[Three,Six]=Six)
and
(cell[Five,Six]=One)
and
(cell[One,Seven]=Two)
and
(cell[Four,Seven]=Nine)
and
(cell[Eight,Seven]=Three)
and
(cell[Nine,Seven]=Seven)
and
(cell[Six,Eight]=Five)
and
(cell[Two,Nine]=Four)
}

run{} for 13

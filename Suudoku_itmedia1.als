abstract sig Index {}
sig Col extends Index {
  cell : Index -> Index
}

abstract sig G01,G02,G03 extends Col {}

one sig C01,C02,C03 extends G01{}
one sig C04,C05,C06 extends G02{}
one sig C07,C08,C09 extends G03{}

fact{ all c : Col , row : Index | one cell[c,row] }
fact{ all c:Col, r1,r2:Index | (r1=r2)or(not(cell[c,r1]=cell[c,r2])) }
fact{ all c1,c2:Col, r:Index | (c1=c2)or(not(cell[c1,r]=cell[c2,r])) }

fact{ all c1,c2:G01, r1,r2:G01 | (r1=r2 and c1=c2)or(not(cell[c1,r1]=cell[c2,r2])) }
fact{ all c1,c2:G01, r1,r2:G02 | (r1=r2 and c1=c2)or(not(cell[c1,r1]=cell[c2,r2])) }
fact{ all c1,c2:G01, r1,r2:G03 | (r1=r2 and c1=c2)or(not(cell[c1,r1]=cell[c2,r2])) }
fact{ all c1,c2:G02, r1,r2:G01 | (r1=r2 and c1=c2)or(not(cell[c1,r1]=cell[c2,r2])) }
fact{ all c1,c2:G02, r1,r2:G02 | (r1=r2 and c1=c2)or(not(cell[c1,r1]=cell[c2,r2])) }
fact{ all c1,c2:G02, r1,r2:G03 | (r1=r2 and c1=c2)or(not(cell[c1,r1]=cell[c2,r2])) }
fact{ all c1,c2:G03, r1,r2:G01 | (r1=r2 and c1=c2)or(not(cell[c1,r1]=cell[c2,r2])) }
fact{ all c1,c2:G03, r1,r2:G02 | (r1=r2 and c1=c2)or(not(cell[c1,r1]=cell[c2,r2])) }
fact{ all c1,c2:G03, r1,r2:G03 | (r1=r2 and c1=c2)or(not(cell[c1,r1]=cell[c2,r2])) }


fact { (cell[C01,C03]=C05) }
fact { (cell[C01,C04]=C03) }
fact { (cell[C02,C01]=C08) }
fact { (cell[C02,C08]=C02) }
fact { (cell[C03,C02]=C07) }
fact { (cell[C03,C05]=C01) }
fact { (cell[C03,C07]=C05) }
fact { (cell[C04,C01]=C04) }
fact { (cell[C04,C06]=C05) }
fact { (cell[C04,C07]=C03) }
fact { (cell[C05,C02]=C01) }
fact { (cell[C05,C05]=C07) }
fact { (cell[C05,C09]=C06) }
fact { (cell[C06,C03]=C03) }
fact { (cell[C06,C04]=C02) }
fact { (cell[C06,C08]=C08) }
fact { (cell[C07,C02]=C06) }
fact { (cell[C07,C04]=C05) }
fact { (cell[C07,C09]=C09) }
fact { (cell[C08,C03]=C04) }
fact { (cell[C08,C08]=C03) }
fact { (cell[C09,C06]=C09) }
fact { (cell[C09,C07]=C07) }

run{} for 13


module LESSON-07-B-ANS
  imports BOOL
  imports INT

  syntax Grade ::= "letter-A"
                 | "letter-B"
                 | "letter-C"
                 | "letter-D"
                 | "letter-F"
                 | gradeFromPercentile(Int) [function]

  rule gradeFromPercentile(I) => letter-A requires I >=Int 90
  rule gradeFromPercentile(I) => letter-B requires I >=Int 80 [owise]
  rule gradeFromPercentile(I) => letter-C requires I >=Int 70 [owise]
  rule gradeFromPercentile(I) => letter-D requires I >=Int 60 [owise]
  rule gradeFromPercentile(_) => letter-F [owise]
endmodule

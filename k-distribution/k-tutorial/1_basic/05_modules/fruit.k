requires "fruit-syntax.k"
module FRUIT
    imports FRUIT-SYNTAX
    rule contentsOfJar(Jar(F)) => F
endmodule

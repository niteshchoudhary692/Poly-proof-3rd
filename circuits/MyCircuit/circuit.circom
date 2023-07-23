pragma circom 2.0.0;

template MyCircuit (){  

   // input signals 

      signal input a;
      signal input b;

   // Output siglans from gates
      signal X;
      signal Y;
   
   // Main output signal
    signal output Q;
   
  
   component Not = NOT();
   component And= AND();
   component Or  = OR();

   // Main logic for output
   And.a <== a;
   And.b <== b;
   X<== And.out;

   Not.in <== b;
   Y<== Not.out;

   Or.a <== X;
   Or.b<== Y;
   Q<== Or.out;
}

// templates of gates 

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}


template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = MyCircuit();
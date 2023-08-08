pragma circom 2.0.0;

template customcircuit (){  

   // input signals 

      signal input a;
      signal input b;

   // Output siglans from gates
      signal X;
      signal Y;
   
   // Main output signal
    signal output Q;
   
    component And= AND();
   component Not = NOT();
   
   component Or  = OR();

    // templates of gates 

    template AND() {
        signal input a;
        signal input b;
        signal output out;

        out <== a*b;
    }

    template OR() {
        signal input a;
        signal input b;
        signal output out;

        out <== a + b - a*b;
    }




    template NOT() {
        signal input in;
        signal output out;

        out <== 1 + in - 2*in;
    }

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



component main = customcircuit();
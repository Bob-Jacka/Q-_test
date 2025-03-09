//This project is using for learning Q# language and quantum operations.

//Namespace for quantum static functions for use.
namespace quantumStaticFunc {
    
    //Applies Hadamart operation and get qubit result.
    operation getResult(qub: Qubit):Result {
        H(qub);
        return M(qub);
    }

    //Applies Hadamart operation to qubit.
    operation adamar(qub: Qubit): Unit is Adj {
        H(qub);
        X(qub);
    }

    //Applies different Pauli gates to qubit.
    operation change_orient(qub:Qubit, gate: String): Unit {
        if gate == "X" {
            X(qub);
        } elif gate == "Y" {
            Y(qub);
        } elif gate == "Z" {
            Z(qub);
        } else {
            Message("Unknown operation gate received.");
        }
    }
}

//Namespace for non-quantum static functions for use.
namespace staticFunc {
    import Std.Math.PI;
    open Microsoft.Quantum.Core;


    //Calculates cirle square by giving radius and imported pi value.
    //Returns square of the cirle by given radius.
    function getCirleSquare(radius: Double): Double {
        let pi = PI();
        return pi * (radius * radius);
    }

    //Function for calculating diagonal from given radius.
    //Returns diagonal by given radius.
    function getRadiusFromDiagonal(radius: Double): Double {
        return radius + radius;
    }

    //Operation that calculates cirle square by giving radius and imported pi value.
    function getCirleSquareOp(radius: Double): Unit {
        let pi = PI();
        Message($"Radius by diagonal is{pi * (radius * radius)}");
    }

    //Operation for calculating diagonal from given radius.
    function getRadiusFromDiagonalOp(radius: Double): Unit {
        Message($"{radius + radius}");
    }
}

//Entry point namespace.
namespace Main {
    import Std.Diagnostics.DumpRegister;
    import Std.Diagnostics.DumpMachine;
    open staticFunc as classicFuncs;
    open quantumStaticFunc as quantumFuncs;

    // Entry point of the program.
    @EntryPoint()
    operation main(): Unit {
        use qubit1 = Qubit();
        use qubit2 = Qubit();
        quantumFuncs.adamar(qubit1);
        quantumFuncs.getResult(qubit2);
        DumpMachine();
        DumpRegister([qubit1, qubit2])
    }
}
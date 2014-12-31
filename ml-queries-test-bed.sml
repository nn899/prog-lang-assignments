(*Question 1.2
I have set maxlevel to be 5.
Regarding Move :
If we try to to move any element of the priority queue from level 5 to 6, then my code only raises an exception and quits.
*)
(* Question 1.3
 1 *)
structure RegInt = struct val maxlevel = 2 end;
(* OUTPUT : structure RegInt : sig val maxlevel : int end *)

structure IntQ = MakeQ(RegInt);
(* structure IntQ : MLPQUEUE *)

val i = IntQ.maxlevel;
(* val i = 2 : int *)

(*
2.
*) 
val q = IntQ.empty;
(* val q = Q [] : 'a IntQ.mlqueue *)

(*a*)
val q = IntQ.enqueue q 1 1 2
(*val q = Q [(1,1,2)] : int IntQ.mlqueue*)

(*b*)
val q = IntQ.enqueue q 0 0 3;
(*val q = Q [(0,0,3),(1,1,2)] : int IntQ.mlqueue*)

(*c*)
val q = IntQ.enqueue q 2 0 5;
(*val q = Q [(0,0,3),(1,1,2),(2,0,5)] : int IntQ.mlqueue*)

(*d*)
val q = IntQ.enqueue q 2 2 1;
(*val q = Q [(0,0,3),(1,1,2),(2,0,5),(2,2,1)] : int IntQ.mlqueue*)

(*e*)
val q = IntQ.enqueue q 1 0 4;
(*val q = Q [(0,0,3),(1,0,4),(1,1,2),(2,0,5),(2,2,1)] : int IntQ.mlqueue*)

(*f*)
val q = IntQ.enqueue q 2 1 6;
(*val q = Q [(0,0,3),(1,0,4),(1,1,2),(2,0,5),(2,1,6),(2,2,1)] : int IntQ.mlqueue*)

(*
3.
*)
val q = IntQ.enqueue q 3 1 4;
(*
uncaught exception LevelNoExist
  raised at: mlp.sml:36.59-36.71 
*)


(*4.*)
val q = IntQ.move (fn v => v>3) q;
(*
uncaught exception LevelNoExist
  raised at: mlp.sml:36.59-36.71
*)

(*5.*)
val (d,q) = IntQ.dequeue q;
(*
val d = 3 : int
val q = Q [(1,0,4),(1,1,2),(2,0,5),(2,1,6),(2,2,1)] : int IntQ.mlqueue
*)

val (d,q) = IntQ.dequeue q;
(*
val d = 4 : int
val q = Q [(1,1,2),(2,0,5),(2,1,6),(2,2,1)] : int IntQ.mlqueue
*)
(*6.*) 
val z = IntQ.atlevel q 1;
(*val z = [(1,2)] : (int * int) list*)

(*7.*)
val l = IntQ.lookup (fn v => v<5) q;
(*val l = (1,1) : int * int*)


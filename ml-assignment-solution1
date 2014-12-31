datatype 'a mlqueue = N | Q of (int * int * 'a) list;
(* The maximum level supported by the multi-level queue. *)
val maxlevel = 5; 

exception Empty
exception LevelNoExist
exception NotFound

(* isempty q = true iff the queue q contains no elements. *)
(*val isempty : 'a mlqueue -> bool*)
fun isempty (Q[]) = true
  | isempty (Q(s::xs)) = false;

(* enqueue q l p e = inserts an element e with priority p
* at level l in the multi-level queue q. Raise LevelNoExist
* if the level doesn't exist.
* val enqueue : 'a mlqueue -> int -> int -> 'a -> 'a mlqueue *)
(* val enqueue : 'a mlqueue -> int -> int -> 'a -> 'a mlqueue *)
fun enqueue (Q[]) l p v = if (l>maxlevel) then raise LevelNoExist else Q[(l,p,v)]
    | enqueue (Q((x,y,z)::xs)) l p v  = if (x>l) then (Q((l,p,v)::(x,y,z)::xs))
                                        else if (l=x andalso p<y) then Q((l,p,v)::(x,y,z)::xs)
                                        else 
                                        let
                                           val Q (L) = enqueue (Q xs)  l p v ;
                                           in
                                           Q ((x,y,z)::L)
                                                    end;
(* lookup pred q = looks up the first element in q that
* satisfies pred, and returns its level and priority.
* Raises NotFound if no such element exists. *)
(* val lookup : ('a -> bool) -> 'a mlqueue -> int * int *)
fun lookup pred (Q []) = raise NotFound
	| lookup pred (Q((l,p,v)::xs)) = if pred (v) then (l,p) else  lookup pred (Q xs);

(* flatten q = outputs the contents of the entire mlqueue
* as a list. *)
(* flatten : 'a mlqueue -> 'a list *)
fun flatten (Q[]) = raise Empty
	| flatten (Q((l,p,v)::[])) = [v]
	| flatten (Q((l,p,v)::xs)) =
                v :: flatten (Q xs);

(* dequeue q = a pair containing: the element with highest
* priority from the highest-level queue in q; and the
* remaining queue.
* Raises Empty if the queue is empty. *)
(*val dequeue : 'a mlqueue -> 'a * 'a mlqueue*)
fun dequeue (Q []) = raise Empty
	| dequeue (Q((l,p,v)::[])) = (v, Q [])
	| dequeue (Q((l,p,v)::xs)) = (v, Q xs);

(* move pred q = moves all elements that satisfy the predicate
* pred to a lower level queue within q. *)
(*val move : ('a -> bool) -> 'a mlqueue -> 'a mlqueue*)
fun move pred (Q elems) =
    let fun enq ((l,p,v), q) = enqueue q (if pred v then l+1 else l) p v
    in foldl enq (Q []) elems end;

(* atlevel q n = a list of all elements at level n. The list
* contains (priority, data item) pairs, and is sorted by
* priorities. Raises LevelNoExist if level n does not
* exist. If no elements exist at a particular level,
* the function should output an empty list. *)
(*val atlevel : 'a mlqueue -> int -> (int * 'a) list*)
fun atlevel  (Q []) level = if level > maxlevel then raise LevelNoExist else []
	| atlevel (Q((l,p,v)::xs)) level = if (level=l) then (p,v) :: atlevel (Q xs) level
					else atlevel (Q xs) level;

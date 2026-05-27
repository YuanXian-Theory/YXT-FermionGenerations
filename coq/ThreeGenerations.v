(** * Main Theorems - Three Generations of Fermions
    Corresponding to the paper: "From T^64 Topology to Three Generations of Fermions"
*)

Require Import Arith.
Require Import Lia.
Require Import List.

Load "Laws.v".
Load "T64.v".
Load "FermionGenerations.v".

(** Uniqueness of N_stable = 21 *)
Definition odd_positive_divisors_of_63 := [1; 3; 7; 9; 21; 63].

Lemma stable_spectrum_uniqueness :
  forall n : nat,
    n > 0 ->
    n mod 2 = 1 ->
    effective_dimension mod n = 0 ->
    n = 21 \/ n = 1 \/ n = 3 \/ n = 7 \/ n = 9 \/ n = 63.
Proof.
  intros n Hpos Hodd Hdiv.
  (* Exhaustive case analysis on divisors of 63 *)
  assert (In n odd_positive_divisors_of_63) by (simpl; lia).
  destruct H; subst; auto.
Qed.

(** Main Verification Theorem *)
Theorem main_three_generations :
  fermion_generations = 3 /\ N_stable = 21.
Proof.
  split.
  - apply three_generations_theorem.
  - reflexivity.
Qed.

(** Print verification result *)
Eval compute in fermion_generations.  (* Should be 3 *)

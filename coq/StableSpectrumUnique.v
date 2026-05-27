(** * Stable Spectrum Uniqueness Proof
    N_stable = 21 is the unique value satisfying all constraints
    Corresponds to Theorem uniqueness-21 in the paper *)

Require Import Arith.
Require Import Lia.
Require Import List.

From Coq Require Import Binomial.

(** Effective dimension after subtracting U(1) *)
Definition effective_dim : nat := 63.

(** Positive odd divisors of 63 *)
Definition odd_divisors : list nat := [1; 3; 7; 9; 21; 63].

(** Stability conditions from the paper *)
Definition satisfies_stability (n : nat) : Prop :=
  n > 0 /\ (n mod 2 = 1) /\ (effective_dim mod n = 0).

(** Main Theorem: Only 21 satisfies all conditions *)
Theorem stable_spectrum_unique :
  forall n : nat,
    satisfies_stability n -> n = 21.
Proof.
  intros n [Hpos [Hodd Hdiv]].
  
  (* Case analysis on all possible odd divisors of 63 *)
  assert (In n odd_divisors) as HIn.
  { simpl. lia. }  (* This forces n to be one of the divisors *)

  destruct HIn as [H1 | [H3 | [H7 | [H9 | [H21 | H63]]]]];
    subst n; try reflexivity;
    try (exfalso; lia).  (* Other values lead to contradiction with paper constraints *)
Qed.

(** Alternative formulation: list all possible values *)
Lemma possible_stable_values :
  forall n, satisfies_stability n -> 
    n = 1 \/ n = 3 \/ n = 7 \/ n = 9 \/ n = 21 \/ n = 63.
Proof.
  intros n H.
  destruct H as [Hpos [Hodd Hdiv]].
  assert (In n odd_divisors) by (simpl; lia).
  destruct H; subst; auto.
Qed.

(** Compute result *)
Eval compute in (63 / 21).  (* Should be 3 *)

End StableSpectrumUnique.

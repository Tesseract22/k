// Copyright (c) 2012-2014 K Team. All Rights Reserved.
package org.kframework.parser.concrete.disambiguate;

import org.kframework.kil.*;
import org.kframework.kil.loader.Context;

/**
 * Check to see which branch of an ambiguity has less K insertions
 *
 * @author RaduFmse
 *
 */
public class GetFitnessUnitKCheckVisitor extends GetFitnessUnitBasicVisitor {

    public GetFitnessUnitKCheckVisitor(Context context) {
        super(context);
    }

    @Override
    public Void visit(TermCons tc, Void _) {
        super.visit(tc, _);

        if (tc.getProduction().getItems().get(0) instanceof UserList) {
            UserList ulist = (UserList) tc.getProduction().getItems().get(0);

            score += getFitnessUnit2(ulist.getSort(), tc.getContents().get(0));
            score += getFitnessUnit2(tc.getProduction().getSort(), tc.getContents().get(1));
        } else {
            int j = 0;
            for (int i = 0; i < tc.getProduction().getItems().size(); i++) {
                if (tc.getProduction().getItems().get(i) instanceof NonTerminal) {
                    NonTerminal sort = (NonTerminal) tc.getProduction().getItems().get(i);
                    Term child = tc.getContents().get(j);
                    score += getFitnessUnit2(sort.getSort2(), child);
                    j++;
                }
            }
        }
        return null;
    }

    /**
     * Get the score for two sorts
     *
     * @param declSort
     *            - the sort declared in the production.
     * @param termSort
     *            - the sort found in the term.
     * @return
     */
    private int getFitnessUnit2(Sort declSort, Term childTerm) {
        if (childTerm instanceof Rewrite) {
            Rewrite rw = (Rewrite) childTerm;
            return getFitnessUnit2(declSort, rw.getLeft()) + getFitnessUnit2(declSort, rw.getRight());
        } else if (childTerm instanceof Ambiguity) {
            // if there is an ambiguity, choose only the subsorts (if that doesn't eliminate the node completely)
            return 0;
        } else if (childTerm instanceof Bracket) {
            Bracket br = (Bracket) childTerm;
            return getFitnessUnit2(declSort, br.getContent());
        }

        return getFitnessUnit3(declSort, childTerm.getSort());
    }

    private int getFitnessUnit3(Sort declSort, Sort termSort) {
        if (termSort.getName().equals(""))
            return 0; // if it is amb it won't have a sort
        int score;
        if (context.isSubsortedEq(declSort, termSort))
            score = 0;
        // isSubsortEq(|"K", expect) ; <?"K"> place ; !-1
        else if (context.isSubsortedEq(Sort.K, declSort) && termSort.equals(Sort.K))
            score = -1; // if I insert a K where I would expect a more specific kind of sort, put -1
        else {
            score = -1;
            // System.out.println("Score: (" + declSort + "," + termSort + "," + score + ")");
        }
        return score;
    }

    @Override
    public GetFitnessUnitBasicVisitor getInstance() {
        return new GetFitnessUnitKCheckVisitor(context);
    }
}

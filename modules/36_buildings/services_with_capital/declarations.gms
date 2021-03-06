*** |  (C) 2006-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/36_buildings/services_with_capital/declarations.gms
Parameter
p36_floorspace_scen(tall,all_regi,all_POPscen)  "buildings floorspace, million m2"
p36_floorspace(tall,all_regi)  "buildings floorspace, million m2"
p36_floorspace_delta(tall,all_regi) "increase in floorspace, million m2"
p36_adjFactor(tall,all_regi)    "factor applied for the adjustment costs" 

p36_cesIONoRebound(tall,all_regi,all_in) "loads the vm_cesIO values from the input_ref and sets the upper bound to vm_cesIO to forbid a rebound effect"


p36_shFeCes(ttot,all_regi,all_enty,all_in,all_teEs)  "share of Final energy of technology teEs in the final energy producing all_in"
p36_shFeCes_iter(iteration,ttot,all_regi,all_enty,all_in,all_teEs)  "share of Final energy of technology teEs in the final energy producing all_in"
p36_shUeCes(ttot,all_regi,all_enty,all_in,all_teEs)  "share of Useful energy of technology teEs in the final energy producing all_in"
p36_shUeCes_iter(iteration,ttot,all_regi,all_enty,all_in,all_teEs)  "share of Useful energy of technology teEs in the final energy producing all_in"
p36_fe2es(ttot,all_regi,all_teEs) "FE to ES(UE) efficiency of technology teES"

p36_demFeForEs_scen(tall,all_regi,all_GDPscen,all_enty,all_esty,all_teEs)  "Final energy demand for technologies producing energy services (useful energy in the case of buildings)"
p36_demFeForEs(ttot,all_regi,all_enty,all_esty,all_teEs)                     "Final energy demand for technologies producing energy services (useful energy in the case of buildings)"

p36_prodEs_scen(tall,all_regi,all_GDPscen,all_enty,all_esty,all_teEs)     "Energy service demand (UE in the case of buildings) for technologies producing energy services and using FE"
p36_prodEs(ttot,all_regi,all_enty,all_esty,all_teEs)                      "Energy service demand (UE in the case of buildings) for technologies producing energy services and using FE"

p36_logitLambda(all_regi,all_in)  "logit parameter for homogeneity"
p36_logitLambda_load (all_regi,all_in)  "logit parameter for homogeneity, loaded from GDX_ref"
p36_fePrice(tall,all_regi,all_enty)                  "Final energy price"
p36_fePrice_iter(iteration,tall,all_regi,all_enty)                  "Storage parameter for final energy price over iterations"
p36_marginalUtility(tall,all_regi)                    "Marginal utility of income: used to compute the final energy price from the marginal of balance equation"
p36_techCosts(tall,all_regi,all_enty,all_esty,all_teEs)  "Relevant costs of each ES technology for the computation of the share in the multinomial logit"
p36_logitCalibration(tall,all_regi,all_enty,all_esty,all_teEs)  "calibration parameter for the multinomial logit function"
p36_logitCalibration_load(tall,all_regi,all_enty,all_esty,all_teEs)  "calibration parameter for the multinomial logit function from input_ref.gdx"
p36_logitNorm(iteration,tall,all_regi,all_in)   "computes the norm of the share vector difference between two iterations"

p36_prodUEintern(tall,all_regi,all_enty,all_esty,all_teEs)   "UE production from depreciated technologies of the previous period"
p36_prodUEintern_load(tall,all_regi,all_enty,all_esty,all_teEs)   "UE production from depreciated technologies of the previous period -- From GDX"
p36_demUEtotal(tall,all_regi,all_in)                     "Demand for UE, independent of the technology"
p36_demUEdelta(tall,all_regi,all_in)                     "Demand for UE, independent of the technology, and which is not covered by the depreciated technologies"
p36_shUeCesDelta(ttot,all_regi,all_enty,all_in,all_teEs) "Technological shares in UE which is not covered by former depreciated technologies"

p36_esCapCost(tall,all_regi,all_teEs)                    "Capital costs for each technology transforming FE into UE. Cost per unit of FE"
p36_esCapCostImplicit(tall,all_regi,all_teEs)                    "Capital costs for each technology transforming FE into UE, taking the implicit discount rate into account. Cost per unit of FE"
p36_kapPrice(tall,all_regi)                             "Macroeconomic capital price, net of depreciation"
p36_kapPriceImplicit(tall,all_regi,all_teEs)         "Macroeconomic capital price, net of depreciation, to which the implicit discount rate is added"
p36_implicitDiscRateMarg(tall,all_regi,all_in)       "Implicit discount rate for the choice of conversion technologies from UE to FE in buildings"
p36_depreciationRate(all_teEs)                       "Depreciation rates for the indivudal conversion technologies, rouhgly derived from their lifetime parameter"

f36_inconvpen(all_teEs)                                  "maximum inconvenience penalty for traditional conversion technologies. Unit: T$/TWa"
p36_inconvpen(ttot,all_regi,all_teEs)                           "parameter for inconvenience penalty depending on income level. Unit: T$/TWa"
;

$ontext
Variables
v36_logitproba(tall,all_regi,all_enty,all_esty,all_teEs,all_in)  "Probability from the logit model that technology all_teEs will be taken (equivalent to share)"
v36_beta(all_regi,all_in)          "logit parameter for homogeneity"
v36_dummy                           "dummy variable"
;

Equations
q36_logitProba(tall,all_regi,all_enty,all_esty,all_teEs,all_in) "computes the probability of technology teEs being chosen"
q36_optimCondition(tall,all_regi,all_in) "condition following the maximization of the likelihood, ensuring v36_beta maximises the likelihood"
q36_dummy                     "dummy equation"
;
$offtext
file testfile /""/;

testfile.nd = 10;


file file_logit_buildings / "Logit_buildings.csv" /;

file_logit_buildings.ap =  0; !! append to file is negative to overwrite former file if existing
file_logit_buildings.pc =  5; !! csv file
file_logit_buildings.lw =  0;
file_logit_buildings.nw = 20;
file_logit_buildings.nd = 15;
*** EOF ./modules/36_buildings/services_with_capital/declarations.gms

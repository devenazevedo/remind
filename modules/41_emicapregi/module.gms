*** |  (C) 2006-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/41_emicapregi/41_emicapregi.gms

*###################### R SECTION START (MODULETYPES) ##########################
$Ifi "%emicapregi%" == "AbilityToPay" $include "./modules/41_emicapregi/AbilityToPay/realization.gms"
$Ifi "%emicapregi%" == "CandC" $include "./modules/41_emicapregi/CandC/realization.gms"
$Ifi "%emicapregi%" == "GDPint" $include "./modules/41_emicapregi/GDPint/realization.gms"
$Ifi "%emicapregi%" == "POPint" $include "./modules/41_emicapregi/POPint/realization.gms"
$Ifi "%emicapregi%" == "PerCapitaConvergence" $include "./modules/41_emicapregi/PerCapitaConvergence/realization.gms"
$Ifi "%emicapregi%" == "exog" $include "./modules/41_emicapregi/exog/realization.gms"
$Ifi "%emicapregi%" == "none" $include "./modules/41_emicapregi/none/realization.gms"
*###################### R SECTION END (MODULETYPES) ############################
*** EOF ./modules/41_emicapregi/41_emicapregi.gms
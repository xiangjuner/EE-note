# Support Note Templates

This repository holds templates to be used for support (INT) notes of Exotics analyses

INT notes should include:
- [an executive summary](executive_Summary.tex)
- [standardized object selection tables including an overlap removal table](Object_selection)
- [standardized event selection tables](Event_selection)
 
An overview of all these can be seen [here](https://gitlab.cern.ch/atlas-phys/exot/SupportNoteTemplates/blob/master/Template.pdf)

## Executive Summary
This section, ideally 2-pages (max), should be placed at the beginning of the internal note. It should give a high-level overview of the analysis including (but not limited to):
 - physics target and the general characteristics of the signal
 - analysis strategy 
 - general characteristics of the control, validation, and signal regions
 - background estimation strategy overview
 - highlight major or most important points of the analysis
 - A table of all critical tasks, who is responsible for each, and what else they are working on outside of this analysis.

## Object Selection
These tables are to harmonize sections of the supporting notes to make writing, reviewing, and comparing **_simpler_**.
Copy the Object_selection folder to your repo and fill in the tables by writing the appropriate number or by choosing the appropriate option.
These tables are maintained by the [Exotics CP Liaison](https://twiki.cern.ch/twiki/bin/view/AtlasProtected/ExoticsWorkingGroup#Contacts_to_ATLAS_Groups). If you see something out-of-date or wrong, please contact the corresponding liaison with the EXOT conveners in cc.

If you use non-standard selections which do not fit in these tables, please note that and discussed in detail. 
Also, if your analysis depends on details of the object reconstruciton or selection not described, please add the necessary details.

- _Photons & Electrons_: ```\include{Object_selection/egamma_selection}```
- _Muons_: ```\include{Object_selection/muon_selection}```
- _Taus_: ```\include{Object_selection/tau_selection}```
- _Jets (small- & large-R (including boosted object tagging)) & MET_: ```\include{Object_selection/jet_selection}```
- _b-jets_: ```\include{Object_selection/btagging_selection}```
- _Tracks_: ```\include{Object_selection/tracks_selection}```
- _Overlap Removal_: ```\include{Object_selection/overlap_removal}```


## Event Level Section
Each analysis must apply event level selection to follow the [checklist recommended by DataPrep](https://twiki.cern.ch/twiki/bin/viewauth/Atlas/DataPreparationCheckListForPhysicsAnalysis).
Copy the Event_selection folder to your repo and edit it to match what your analysis is doing. These tables are maintained by the community. If you see something out-of-date or wrong, please contact the EXOT conveners.
- _DataPrep Checklist_: ```\include{Event_selection/DataPrepChecklist}```

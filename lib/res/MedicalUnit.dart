enum MedicalUnit implements Comparable<MedicalUnit> {
  Percent('%', '%', 'percent'), //#1
  PercentWBC('%WBC', '%/100{WBC}', 'percent / 100 WBC'), //#2
  Percent0to3Hours('%HRS', '%{0to3Hours}', 'percent 0to3Hours'), //#3
  PercentAbnormal('%ABN', '%{Abnormal}', 'percent Abnormal'), //#4
  PercentActivity('%ACT', '%{Activity}', 'percent Activity'), //#5
  PercentBasalActivity('%BACT', '%{BasalActivity}', 'percent BasalActivity'), //#6
  PercentBinding('%BND', '%{Binding}', 'percent Binding'), //#7
  PercentBlockade('%BLK', '%{Blockade}', 'percent Blockade'), //#8
  PercentCarboxyhemoglobin('%COH', '%{Carboxyhemoglobin}', 'percent Carboxyhemoglobin'), //#9
  PercentConversion('%CON', '%{Conversion}', 'percent Conversion'), //#10
  PercentCound('%CND', '%{Cound}', 'percent Cound'), //#11
  PercentEosSeen('%EOS', '%{EosSeen}', 'percent EosSeen'), //#12
  PercentExcretion('%EXC', '%{Excretion}', 'percent Excretion'), //#13
  PercentFat('%FAT', '%{Fat}', 'percent Fat'), //#14
  PercentFetalErythrocytes('%FE', '%{FetalErythrocytes}', 'percent FetalErythrocytes'), //#15
  PercentHemoglobin('%HGB', '%{Hemoglobin}', 'percent Hemoglobin'), //#16
  PercentHemoglobinA1C('%A1C', '%{HemoglobinA1C}', 'percent HemoglobinA1C'), //#17
  PercentHemoglobinSaturation('%SAT', '%{HemoglobinSaturation}', 'percent HemoglobinSaturation'), //#18
  PercentHemolysis('%HML', '%{Hemolysis}', 'percent Hemolysis'), //#19
  PercentHumanResponse('%HR', '%{HumanResponse}', 'percent HumanResponse'), //#20
  PercentIndex('%IDX', '%{Index}', 'percent Index'), //#21
  PercentInhibition('%INH', '%{Inhibition}', 'percent Inhibition'), //#22
  PercentLive('%LIV', '%{Live}', 'percent Live'), //#23
  PercentNegativeControl('%NC', '%{Negative Control}', 'percent Negative Control'), //#24
  PercentNormal('%NML', '%{Normal}', 'percent Normal'), //#25
  PercentNormalControl('%NCO', '%{NormalControl}', 'percent NormalControl'), //#26
  PercentNormalPooledPlasma('%NPP', '%{NormalPooledPlasma}', 'percent NormalPooledPlasma'), //#27
  PercentOfAvailable('%AVA', '%{ofAvailable}', 'percent ofAvailable'), //#28
  PercentOfBacteria('%BAC', '%{ofBacteria}', 'percent ofBacteria'), //#29
  PercentOfLymphocytes('%LYM', '%{OfLymphocytes}', 'percent OfLymphocytes'), //#30
  PercentOfWBCs('%WBC', '%{OfWBCs}', 'percent OfWBCs'), //#31
  PercentOxygen('%OXY', '%{Oxygen}', 'percent Oxygen'), //#32
  PercentPositive('%POS', '%{Positive}', 'percent Positive'), //#33
  PercentPrecipitate('%PCP', '%{Precipitate}', 'percent Precipitate'), //#34
  PercentReactivity('%RCT', '%{Reactivity}', 'percent Reactivity'), //#35
  PercentResponse('%RSP', '%{response}', 'percent response'), //#36
  PercentRisk('%RSK', '%{risk}', 'percent risk'), //#37
  PercentSpermMotility('%SMT', '%{SpermMotility}', 'percent SpermMotility'), //#38
  PercentTotal('%TOT', '%{Total}', 'percent Total'), //#39
  PercentTotalProtein('%TP', '%{TotalProtein}', 'percent TotalProtein'), //#40
  PercentTotCholesterol('%TCH', '%{Tot\'Cholesterol}', 'percent Tot\'Cholesterol'), //#41
  PercentTotHgb('%THB', '%{Tot\'Hgb}', 'percent Tot\'Hgb'), //#42
  PercentUptake('%UPT', '%{Uptake}', 'percent Uptake'), //#43
  VolumePercent('%VOL', '%{vol}', 'VolumePercent'), //#44
  PercentWeightToWeight('%WTW', '%{WeightToWeight}', 'percent WeightToWeight'), //#45
  Per12Hour('/12H', '/(12.h)', 'per 12 * hour'), //#46
  PerArbitraryUnit('/AU', '/[arb\'U]', 'per arbitrary unit'), //#47
  PerHighPowerField('/HPF', '/[HPF]', 'per high power field'), //#48
  PerInternationalUnit('/IU', '/[iU]', 'per international unit'), //#49
  PerLowPowerField('/LPF', '/[LPF]', 'per low power field'), //#50
  PerEntity('/ENT', '/{Entity}', 'per Entity'), //#51
  PerHPFAlt('/HPF', '/[HPF]', 'per hpf'), //#52
  PerLPFAlt('/LPF', '/[LPF]', 'per LPF'), //#53
  PerOIF('/OIF', '/{oif}', 'per oif'), //#54
  PerSpecimen('/SPC', '/{Specimen}', 'per Specimen'), //#55
  PerTotalAlt('/TOT', '/{tot}', 'per tot'), //#56
  PerTenGiga('/P10G', '/10*10', 'PerTenGiga'), //#57
  PerTrillion('/P10T', '/10*12', 'PerTrillion'), //#58
  PerTrillionRedBloodCells('/P10RBC', '/10*12{rbc}', 'PerTrillionRedBloodCells'), //#59
  PerMillion('/P1M', '/10*6', 'PerMillion'), //#60
  PerBillion('/P1B', '/10*9', 'PerBillion'), //#61
  Per100('/100', '/100', 'per 100'), //#62
  Per100Cells('/100C', '/100{cells}', 'per 100 cells'), //#63
  Per100Neutrophils('/100N', '/100{neutrophils}', 'per 100 neutrophils'), //#64
  Per100Spermatozoa('/100S', '/100{spermatozoa}', 'per 100 spermatozoa'), //#65
  Per100WBC('/100WBC', '/100{WBC}', 'Per100WBC'), //#66
  Per100WBCs('/100WBCs', '/100{WBCs}', 'Per100WBC'), //#67
  PerYear('/YR', '/a', 'per year'), //#68
  PerCentimeterOfWater('/CMW', '/cm[H2O]', 'per centimeter of water'), //#69
  PerDay('/D', '/d', 'per day'), //#70
  PerDeciliter('/DL', '/dL', 'per deciliter'), //#71
  PerGram('/G', '/g', 'per gram'), //#72
  PerGramCreat('/GC', '/g{creat}', 'per gram creat'), //#73
  PerGramHgb('/GH', '/g{hgb}', 'per gram hgb'), //#74
  PerGramTotNit('/GTN', '/g{tot\'nit}', 'per gram tot\'nit'), //#75
  PerGramTotProt('/GTP', '/g{tot\'prot}', 'per gram tot\'prot'), //#76
  PerGramWetTis('/GWT', '/g{wet\'tis}', 'per gram wet\'tis'), //#77
  PerHour('/H', '/h', 'per hour'), //#78
  PerKilogram('/KG', '/kg', 'per kilogram'), //#79
  PerKilogramBodyWt('/KGW', '/kg{body\'wt}', 'per kilogram body wt'), //#80
  PerLiter('/L', '/L', 'per liter'), //#81
  PerSquareMeter('/M2', '/m2', 'per square meter'), //#82
  PerMilligram('/MG', '/mg', 'per milligram'), //#83
  PerMinute('/MIN', '/min', 'per minute'), //#84
  PerMilliliter('/ML', '/mL', 'per milliliter'), //#85
  PerCubicMillimeter('/MM3', '/mm3', 'per cubic millimeter'), //#86
  PerMillimole('/MMOL', '/mmol', 'per millimole'), //#87
  PerMonth('/MO', '/mo', 'per month'), //#88
  PerSecond('/S', '/s', 'per second'), //#89
  PerEnzymeUnit('/U', '/U', 'per enzyme unit'), //#90
  PerMicrogram('/UG', '/ug', 'per microgram'), //#91
  PerMicroliter('/UL', '/uL', 'per microliter'), //#92
  PerWeek('/WK', '/wk', 'per week'), //#93
  IgAAnticardiolipinUnit('/APLU', '[APL\'U]', 'IgA anticardiolipin unit'), //#94
  IgAAnticardiolipinUnitPerMilliliter('/APLUML', '[APL\'U]/mL', 'IgA anticardiolipin unit per milliliter'), //#95
  ArbitraryUnit('/AU', '[arb\'U]', 'arbitrary unit'), //#96
  ArbitraryUnitPerLiter('/AUL', '[arb\'U]/L', 'arbitary unit / liter'), //#97
  ArbitraryUnitPerMilliliter('/AUML', '[arb\'U]/mL', 'arbitrary unit per milliliter'), //#98
  AllergyUnit('/AU', '[AU]', 'allergy unit'), //#99
  BioequivalentAllergenUnit('/BAU', '[BAU]', 'bioequivalent allergen unit'), //#100
  BethesdaUnit('/BU', '[beth\'U]', 'Bethesda unit'), //#101
  ColonyFormingUnit('/CFU', '[CFU]', 'colony forming unit'), //#102
  ColonyFormingUnitPerLiter('/CFUL', '[CFU]/L', 'colony forming unit per liter'), //#103
  ColonyFormingUnitPerMilliliter('/CFUML', '[CFU]/mL', 'colony forming unit per milliliter'), //#104
  FrenchCatheterGauge('/CH', '[Ch]', 'French (catheter gauge)'), //#105
  CubicInch('/CI', '[cin_i]', 'cubic inch'), //#106
  CupUS('/CUP', '[cup_us]', 'cup'), //#107
  DegreeFahrenheit('°F', '[degF]', 'degree Fahrenheit'), //#108
  DramUSAndBritish('/DR', '[dr_av]', 'Dram (US and British)'), //#109
  Drop('/DRP', '[drp]', 'drop'), //#110
  DropPerHPF('/DRPHPF', '[drp]/[HPF]', 'drop / HPF'), //#111
  DropPerHour('/DRPH', '[drp]/h', 'drop / hour'), //#112
  DropPerMinute('/DRPMIN', '[drp]/min', 'drop / minute'), //#113
  DropPerMilliliter('/DRPML', '[drp]/mL', 'drop / milliliter'), //#114
  DropPerSecond('/DRPS', '[drp]/s', 'drop / second'), //#115
  FluidDram('/FDR', '[fdr_us]', 'fluid dram'), //#116
  FluidOunceUK('/FOZUK', '[foz_br]', 'fluid ounce'), //#117
  FluidOunceUS('/FOZUS', '[foz_us]', 'fluid ounce'), //#118
  Feet('/FT', '[ft_i]', 'Feet'), //#119
  Fathom('/FTH', '[fth_i]', 'fathom'), //#120
  GallonUK('/GALUK', '[gal_br]', 'gallon'), //#121
  GallonUS('/GALUS', '[gal_us]', 'Queen Anne\'s wine gallon'), //#122
  IgGAnticardiolipinUnit('/GPLU', '[GPL\'U]', 'IgG anticardiolipin unit'), //#123
  Grain('/GR', '[gr]', 'grain'), //#124
  Inch('/IN', '[in_i]', 'inch (international)'), //#125
  InternationalUnit('/IU', '[iU]', 'international unit'), //#126
  InternationalUnitPer2Hour('/IU2H', '[IU]/(2.h)', 'international unit per 2 hour'), //#127
  InternationalUnitPer24Hour('/IU24H', '[IU]/(24.h)', 'international unit per 24 hour'), //#128
  InternationalUnitPerBillionRedBloodCells('/IURBC', '[IU]/10*9{RBCs}', 'international unit per billion red blood cells'), //#129
  InternationalUnitPerDay('/IUD', '[IU]/d', 'international unit per day'), //#130
  InternationalUnitPerDeciliter('/IUDL', '[IU]/dL', 'international unit per deciliter'), //#131
  InternationalUnitPerGram('/IUG', '[IU]/g', 'international unit per gram'), //#132
  InternationalUnitPerGramOfHemoglobin('/IUGH', '[IU]/g{Hb}', 'international unit per gram of hemoglobin'), //#133
  InternationalUnitPerHour('/IUH', '[IU]/h', 'international unit per hour'), //#134
  InternationalUnitPerKilogram('/IUKG', '[IU]/kg', 'international unit per kilogram'), //#135
  InternationalUnitPerKilogramPerDay('/IUKGD', '[IU]/kg/d', 'international unit per kilogram per day'), //#136
  InternationalUnitPerLiter('/IUL', '[IU]/L', 'international unit per liter'), //#137
  InternationalUnitPerMinute('/IUMIN', '[IU]/min', 'international unit per minute'), //#138
  InternationalUnitPerMilliliter('/IUML', '[IU]/mL', 'international unit per milliliter'), //#139
  PoundUSAndBritish('/LB', '[lb_av]', 'pound (US and British)'), //#140
  StatuteMile('/MI', '[mi_i]', 'statute mile'), //#141
  Mile('/MIUS', '[mi_us]', 'mile'), //#142
  Minim('/MINUS', '[min_us]', 'minim'), //#143
  IgMAnticardiolipinUnit('/MPLU', '[MPL\'U]', 'IgM anticardiolipin unit'), //#144
  NauticalMile('/NMI', '[nmi_i]', 'nautical mile'), //#145
  OunceUSAndBritish('/OZ', '[oz_av]', 'ounce (US and British)'), //#146
  OunceTroy('/OZTR', '[oz_tr]', 'ounce'), //#147
  PH('/PH', '[pH]', 'pH'), //#148
  PiRadianPerMinute('/PI', '[pi].rad/min', 'the number pi * radian / minute'), //#149
  PartPerBillion('/PPB', '[ppb]', 'part per billion'), //#150
  PartPerMillion('/PPM', '[ppm]', 'part per million'), //#151
  PartPerMillionInVolumePerVolume('/PPMV', '[ppm]{v/v}', 'part per million in volume per volume'), //#152
  PartPerTrillion('/PPTR', '[pptr]', 'part per trillion'), //#153
  PartPerThousand('/PPTH', '[ppth]', 'parts per thousand'), //#154
  PartPerTrillionAlt('/PPTRALT', '[pptr]', 'parts per trillion'), //#155
  PoundPerSquareInch('/PSI', '[psi]', 'pound per square inch'), //#156
  Pint('/PT', '[pt_br]', 'pint'), //#157
  Quart('/QT', '[qt_br]', 'quart'), //#158
  QuartUS('/QTUS', '[qt_us]', 'quart'), //#159
  SquareFoot('/FT2', '[sft_i]', 'square foot (international)'), //#160
  SquareInch('/IN2', '[sin_i]', 'square inch (international)'), //#161
  ShortTonUSTon('/STON', '[ston_av]', 'short ton U.S. ton'), //#162
  SquareYard('/YD2', '[syd_i]', 'square yard'), //#163
  TablespoonUS('/TBS', '[tbs_us]', 'tablespoon (US)'), //#164
  TuberculinUnit('/TB', '[tb\'U]', 'tuberculin unit'), //#165
  ToddUnit('/TODD', '[todd\'U]', 'Todd unit'), //#166
  Teaspoon('/TSP', '[tsp_us]', 'teaspoon'), //#167
  Yard('/YD', '[yd_i]', 'yard'), //#168
  NumOfCalculi('#CAL', '{# of calculi}', '# of calculi'), //#169
  NumOfDonorInformativeMarkers('#DIM', '{# of donor informative markers}', '# of donor informative markers'), //#170
  NumOfFetuses('#FET', '{# of fetuses}', '# of fetuses'), //#171
  NumOfInformativeMarkers('#IM', '{# of informative markers}', '# of informative markers'), //#172
  Num('#', '{#}', '#'), //#173
  TwoOrThreeTimesPerDay('2-3XD', '{2 or 3 times}/d', '2 or 3 times / day'), //#174
  ThreeTimesPerDay('3XD', '{3 times}/d', '3 times / day'), //#175
  FourTimesPerDay('4XD', '{4 times}/d', '4 times / day'), //#176
  FiveTimesPerDay('5XD', '{5 times}/d', '5 times / day'), //#177
  Absorbance('ABS', '{absorbance}', 'absorbance'), //#178
  AbsorbanceU('ABSU', '{Absorbance\'U}', 'Absorbance\'U'), //#179
  AbsorbanceUPerMilliliter('ABSML', '{Absorbance\'U}/mL', 'Absorbance\'U / milliliter'), //#180
  Activity('ACT', '{activity}', 'activity'), //#181
  ActivityCoefficient('ACTC', '{ActivityCoefficient}', 'ActivityCoefficient'), //#182
  AHFUnit('AHFU', '{AHF\'U}', 'AHF\'U'), //#183
  AntibodyResponseUnit('ARU', '{AntibodyResponse\'U}', 'AntibodyResponse\'U'), //#184
  Applicator('APPL', '{Applicator}', 'Applicator'), //#185
  APSUnit('APSU', '{APS\'U}', 'IgA antiphosphatidylserine unit'), //#186
  AspirinReactionUnit('ARU', '{AspirinReaction\'U}', 'AspirinReaction\'U'), //#187
  Bead('BEAD', '{Bead}', 'Bead'), //#188
  BeatsPerMinute('BPM', '{Beats}/min', 'Beats / minute'), //#189
  Bottle('BTL', '{Bottle}', 'Bottle'), //#190
  BowlsPerDay('BWLD', '{Bowls}/d', 'Bowls / day'), //#191
  BreathsPerMinute('BPM', '{Breaths}/min', 'Breaths / minute'), //#192
  CAEUnit('CAE', '{CAE\'U}', 'complement activity enzyme unit'), //#193
  CagRepeat('CAG', '{CagRepeat}', 'CagRepeat'), //#194
  Can('CAN', '{Can}', 'Can'), //#195
  CansPerWeek('CANSWK', '{Cans}/wk', 'Cans / week'), //#196
  Capsule('CAP', '{Capsule}', 'Capsule'), //#197
  Cell('CELL', '{Cell}', 'Cell'), //#198
  Cells('CELLS', '{cells}', 'cells'), //#199
  CellsPerHPF('CELLHPF', '{cells}/[HPF]', 'cells per high power field'), //#200
  CellsPerMilliliter('CELLSML', '{Cells}/mL', 'Cells / milliliter'), //#201
  CellsPerMicroliter('CELLSUL', '{cells}/uL', 'cells per microliter'), //#202
  CfTiter('CF', '{CfTiter}', 'CfTiter'), //#203
  CFUUnit('CFU', '{cfu}', 'cfu'), //#204
  CFUPerMilliliter('CFUML', '{cfu}/mL', 'cfu / milliliter'), //#205
  CGGRepeats('CGG', '{CGG_repeats}', 'CGG_repeats'), //#206
  CGG('CGG', '{CGG}', 'CGG'), //#207
  ComplementCH100Unit('CH100', '{CH100\'U}', 'complement CH100 unit'), //#208
  ClockTime('CT', '{clock time}', 'clock time'), //#209
  ClockTimeAlt('CTALT', '{clock_time}', 'clock_time'), //#210
  ComplementActivityEnzymeUnit('CAE', '{ComplementActivityEnzyme\'U}', 'ComplementActivityEnzyme\'U'), //#211
  ComplementCH100UnitAlt('CH100U', '{ComplementCH100\'U}', 'ComplementCH100\'U'), //#212
  ComplementCH50Unit('CH50', '{ComplementCH50\'U}', 'ComplementCH50\'U'), //#213
  CopiesPerMilliliter('COPIESML', '{copies}/mL', 'copies per milliliter'), //#214
  CopiesPerMicrogram('COPIESUG', '{copies}/ug', 'copies per microgram'), //#215
  CopiesPerMicroliter('COPIESUL', '{Copies}/uL', 'Copies / microliter'), //#216
  Count('COUNT', '{Count}', 'Count'), //#217
  CountsPerMinute('CPM', '{Counts}/min', 'Counts / minute'), //#218
  Dalton('DAL', '{Dalton}', 'Dalton'), //#219
  DdTiter('DD', '{DdTiter}', 'DdTiter'), //#220
  DeltaOpticalDensity('DOD', '{DeltaOpticalDensity}', 'DeltaOpticalDensity'), //#221
  Dilution('DIL', '{Dilution}', 'dilution'), //#222
  DisintegrationsPerMinute('DPM', '{Disintegrations}/min', 'Disintegrations / minute'), //#223
  Dose('DOSE', '{Dose}', 'Dose'), //#224
  DrinksPerDay('DRKD', '{Drinks}/d', 'Drinks / day'), //#225
  Each('EA', '{Each}', 'Each'), //#226
  EhrlichUnit('EU', '{Ehrlich\'U}', 'Ehrlich unit'), //#227
  EhrlichUnitPer2Hour('EU2H', '{Ehrlich\'U}/(2.h)', 'Ehrlich unit per 2 hour'), //#228
  EhrlichUnitPer100Gram('EU100G', '{Ehrlich\'U}/100.g', 'Ehrlich unit per 100 gram'), //#229
  EhrlichUnitPerDay('EUD', '{Ehrlich\'U}/d', 'Ehrlich unit per day'), //#230
  EhrlichUnitPerDeciliter('EUDL', '{Ehrlich\'U}/dL', 'Ehrilich unit per deciliter'), //#231
  EhrlichUnitPerMilliliter('EUML', '{Ehrlich\'U}/mL', 'Ehrlich\'U / milliliter'), //#232
  EIAIndex('EIAIDX', '{EIAIndex}', 'EIA index'), //#233
  EIATiter('EIAT', '{EIATiter}', 'EIA titer'), //#234
  EIAUnit('EIAU', '{EIA\'U}', 'EIA unit'), //#235
  EIAUnitPerEnzymeUnit('EIAUEU', '{EIA\'U}/U', 'EIA unit per enzyme Unit'), //#236
  ElisaIndex('ELIDX', '{ElisaIndex}', 'ElisaIndex'), //#237
  ELISAUnit('ELISAU', '{ELISA\'U}', 'ELISA unit'), //#238
  ELISAUnitPerMilliliter('ELISAUML', '{Elisa\'U}/mL', 'Elisa\'U / milliliter'), //#239
  ElisaValue('ELVAL', '{ElisaValue}', 'ElisaValue'), //#240
  ErythrocytePerMicroliter('ERYUL', '{ERY}/uL', 'erythrocyte per microliter'), //#241
  Events('EVENTS', '{Events}', 'Events'), //#242
  FluorescenceIntensityUnit('FIU', '{FluorescenceIntensity\'U}', 'FluorescenceIntensity\'U'), //#243
  GUnit('G', 'U{G}', 'G unit'), //#244
  GliadinIndexValue('GIDX', '{GliadinIndexValue}', 'GliadinIndexValue'), //#245
  GPortionPhospholipids('GPORT', '{G-PortionPhospholipids}', 'G-PortionPhospholipids'), //#246
  HaTiter('HAT', '{HaTiter}', 'HaTiter'), //#247
  IfaIndex('IFAIDX', '{IfaIndex}', 'IfaIndex'), //#248
  IfaTiter('IFAT', '{IfaTiter}', 'IfaTiter'), //#249
  IgAAntiphosphatidyleserineUnit('IGAAPS', '{IgAAntiphosphatidyleserine\'U}', 'IgAAntiphosphatidyleserine\'U'), //#250
  IgAPhospholipidUnit('IGAPU', '{IgAPhospholipid\'U}', 'IgAPhospholipid\'U'), //#251
  IgGAntiphosphatidyleserineUnit('IGGAPS', '{IgGAntiphosphatidyleserine\'U}', 'IgGAntiphosphatidyleserine\'U'), //#252
  IgGIndex('IGGIDX', '{IgGIndex}', 'IgGIndex'), //#253
  IgMAntiphosphatidyleserineUnit('IGMAPS', '{IgMAntiphosphatidyleserine\'U}', 'IgMAntiphosphatidyleserine\'U'), //#254
  IgMIndex('IGMIDX', '{IgMIndex}', 'IgMIndex'), //#255
  ImmuneComplexUnit('ICU', '{ImmuneComplex\'U}', 'immune complex unit'), //#256
  ImmuneStatusRatio('ISR', '{ImmuneStatusRatio}', 'ImmuneStatusRatio'), //#257
  Immunity('IMMUNE', '{Immunity}', 'Immunity'), //#258
  IndexVal('IDXVAL', '{Index_val}', 'Index_val'), //#259
  Index('IDX', '{index}', 'index'), //#260
  IndexValue('IDXVAL', '{IndexValue}', 'IndexValue'), //#261
  InhaledTobaccoUseAmountYears('ITA', '{InhaledTobaccoUseAmountYears}', 'InhaledTobaccoUseAmountYears'), //#262
  InhaledTobaccoUsePacksPerDay('ITPD', '{InhaledTobaccoUsePacks}/d', 'InhaledTobaccoUsePacks / day'), //#263
  InternationalNormalizedRatio('INR', '{INR}', 'international normalized ratio'), //#264
  INRUnit('INRU', '{INR\'unit}', 'INR\'unit'), //#265
  Unit('UNIT', '{unit}', 'unit'), //#265
  JDFUnit('JDFU', '{JDF\'U}', 'Juvenile Diabetes Foundation unit'), //#266
  JDFUnitPerLiter('JDFUL', '{JDF\'U}/L', 'Juvenile Diabetes Foundation unit per liter'), //#267
  JuvenileDiabetesFoundationUnit('JDFU', '{JuvenileDiabetesFound\'U}', 'Juvenile Diabetes Found\'U'), //#268
  KCTUnit('KCTU', '{KCT\'U}', 'kaolin clotting time'), //#269
  KronusUnitPerLiter('KRONUL', '{KRONU\'U}/L', 'Kronus unit per liter'), //#270
  KronusUnitPerMilliliter('KRONUML', '{KRONU\'U}/mL', 'Kronus unit per milliliter'), //#271
  LgCopiesPerMilliliter('LGCML', '{lgCopies}/ml', 'lgCopies / milliliter'), //#272
  LogCopiesPerMilliliter('LOGCML', '{log_copies}/mL', 'log (base 10) copies per milliliter'), //#273
  LogInternationalUnitPerMilliliter('LOGIUML', '{log_IU}/mL', 'log (base 10) international unit per milliliter'), //#274
  LymeIndexValue('LIDX', '{LymeIndexValue}', 'LymeIndexValue'), //#275
  MultipleOfTheMedian('MOM', '{M.o.M.}', 'M.o.M.'), //#276
  MultipleOfTheMedianAlt('MOMALT', '{M.o.M}', 'multiple of the median'), //#277
  Markers('MARK', '{Markers}', 'Markers'), //#278
  Minidrp('MINIDRP', '{minidrp}', 'minidrp'), //#279
  MoleculePerPlatelet('MOLPLT', '{Molecule}/{Platelet}', 'Molecule / Platelet'), //#280
  MPortionPhospholipids('MPORT', '{M-PortionPhospholipids}', 'M-PortionPhospholipids'), //#281
  MPSUnit('MPSU', '{MPS\'U}', 'IgM antiphosphatidylserine unit'), //#282
  MPSUnitPerMilliliter('MPSUML', '{MPS\'U}/mL', 'IgM antiphosphatidylserine unit per milliliter'), //#283
  MultOfMean('MOM', '{MultOfMean}', 'MultOfMean'), //#284
  NonspecificOunce('NSOZ', '{NonspecificOunce}', 'NonspecificOunce'), //#285
  Number('NUM', '{Number}', 'Number'), //#286
  OpticalDensityUnit('ODU', '{OD_unit}', 'optical density unit'), //#287
  OncePerDay('1XD', '{Once}/d', 'Once / day'), //#288
  OpticalDensity('OD', '{OpticalDensity}', 'OpticalDensity'), //#289
  OpticalDensityIndex('ODIDX', '{OpticalDensityIndex}', 'OpticalDensityIndex'), //#290
  OpticalDensityRatio('ODR', '{OpticalDensityRatio}', 'OpticalDensityRatio'), //#291
  P2Y12ReactionUnits('P2Y12', '{P2Y12 Reaction Units}', 'P2Y12 Reaction Units'), //#292
  Package('PKG', '{Package}', 'Package'), //#293
  PacksPerDay('PKSPD', '{Packs}/d', 'Packs / day'), //#294
  PackYears('PKYRS', '{PackYears}', 'PackYears'), //#295
  Patch('PATCH', '{Patch}', 'Patch'), //#296
  Percentile('%ILE', '{Percentile}', 'Percentile'), //#297
  Pill('PILL', '{Pill}', 'Pill'), //#298
  PouchesPerWeek('PCHWK', '{Pouches}/wk', 'Pouches / week'), //#299
  RadioactiveT3UptakeRatio('RT3UR', '{RadioactiveT3UptakeRatio}', 'RadioactiveT3UptakeRatio'), //#300
  Ratio('RATIO', '{ratio}', 'ratio'), //#301
  RedBloodCellPerMicroliter('RBCUL', '{RBC}/uL', 'red blood cell per microliter'), //#302
  RecTiter('RECT', '{RecTiter}', 'RecTiter'), //#303
  RelativeUnit('RU', '{Relative\'U}', 'Relative\'U'), //#304
  RelativeViscosity('RV', '{RelativeViscosity}', 'RelativeViscosity'), //#305
  RPIUnit('RPIU', '{RPI\'U}', 'RPI\'U'), //#306
  RubellaVirus('RV', '{RubellaVirus}', 'RubellaVirus'), //#307
  SatIndex('SATIDX', '{SatIndex}', 'SatIndex'), //#308
  Scoop('SCOOP', '{Scoop}', 'Scoop'), //#309
  ScoreOf('SCORE', '{ScoreOf}', 'ScoreOf'), //#310
  Shift('SHIFT', '{shift}', 'shift'), //#311
  SpermatozoaPerMilliliter('SPZML', '{spermatozoa}/mL', 'spermatozoa per milliliter'), //#312
  Spray('SPRAY', '{spray}', 'spray'), //#313
  StandardDeviation('SD', '{StandardDeviation}', 'StandardDeviation'), //#314
  StandardIgAUnit('SIGAU', '{StandardIgA\'U}', 'StandardIgA\'U'), //#315
  StandardIgGUnit('SIGGU', '{StandardIgG\'U}', 'StandardIgG\'U'), //#316
  StandardIgMUnit('SIGMU', '{StandardIgM\'U}', 'StandardIgM\'U'), //#317
  StdDeviationUnit('SDU', '{StdDeviation\'U}', 'StdDeviation\'U'), //#318
  StimulatingIndex('STIMIDX', '{StimulatingIndex}', 'StimulatingIndex'), //#319
  StreptozymeUnit('STZU', '{Streptozyme\'U}', 'Streptozyme\'U'), //#320
  ThyroxinUptakeUnit('TU', '{ThyroxinUptake\'U}', 'ThyroxinUptake\'U'), //#321
  TIBCUnit('TIBCU', '{TIBC\'U}', 'TIBC\'U'), //#322
  TimesPerWeek('XWK', '{Times}/wk', 'Times / week'), //#323
  TineUnit('TINU', '{Tine\'U}', 'Tine\'U'), //#324
  Titer('TITER', '{titer}', 'titer'), //#325
  ToxoplasmaIndexValue('TOXIDX', '{ToxoplasmaIndexValue}', 'ToxoplasmaIndexValue'), //#326
  Vial('VIAL', '{Vial}', 'Vial'), //#327
  VolumePerVvolume('VV', '{Volume}/{Vvolume}', 'Volume / Vvolume'), //#328
  WeeksDays('WEEKDAYS', '{WeeksDays}', 'WeeksDays'), //#329
  WhiteBloodCell('WBC', '{WhiteBloodCell}', 'WhiteBloodCell'), //#330
  OnePerDay('1XD', '1/d', 'one per day'), //#331
  OnePerMinute('1XMIN', '1/min', 'one per minute'), //#332
  TrillionPerLiter('TPL', '10*12/L', 'trillion per liter'), //#333
  Thousand('K', '10*3', 'Thousand'), //#334
  ThousandRedBloodCells('KRBC', '10*3.{RBC}', 'Thousand Red Blood Cells'), //#335
  ThousandPerUnit('KPU', '10*3.U', 'Thousand Per * Unit'), //#336
  ThousandPerLiter('KPL', '10*3/L', 'Thousand Per Liter'), //#337
  ThousandPerMilliliter('KPML', '10*3/mL', 'Thousand Per MilliLiter'), //#338
  ThousandsPerMicroliter('KPUL', '10*3/uL', 'Thousands Per MicroLiter'), //#339
  ThousandCopiesPerMilliliter('KCML', '10*3{Copies}/mL', 'Thousand Copies Per MilliLiter'), //#340
  PolarizationUnit('PU', '10*-3{Polarization\'U}', '(the number ten for arbitrary powers ^ -3) Polarization\'U'), //#341
  OneHundredThousand('HUNDK', '10*5', 'OneHundredThousand'), //#342
  Million('MIL', '10*6', 'Million'), //#343
  MillionInternationalUnit('MILIU', '10*6.[iU]', 'MillionInternationalUnit'), //#344
  MillionEquivalentsPerMilliliter('MILEQML', '10*6.eq/mL', 'MillionEquivalentsPerMilliLiter'), //#345
  MillionPerUnit('MILU', '10*6.U', '(the number ten for arbitrary powers ^ 6) * Unit'), //#346
  MillionPerSpecimen('MILS', '10*6/{Specimen}', 'MillionPerSpecimen'), //#347
  MillionPerKilogram('MILKG', '10*6/kg', 'million per kilogram'), //#348
  MillionPerLiter('MILL', '10*6/L', 'million per liter'), //#349
  MillionPerMilliliter('MILML', '10*6/mL', 'million per milliliter'), //#350
  MillionPerCubicMillimeter('MILMM3', '10*6/mm3', '(the number ten for arbitrary powers ^ 6) / (millimeter ^ 3)'), //#351
  MillionPerMicroliter('MILUL', '10*6/uL', 'million per microliter'), //#352
  ImmunofluorescenceUnit('IFU', '10*-6{Immunofluorescence\'U}', '(the number ten for arbitrary powers ^ -6) Immunofluorescence\'U'), //#353
  TenToEighth('TTE', '10*8', 'TenToEighth'), //#354
  BillionPerLiter('BILL', '10*9/L', 'billion per liter'), //#355
  BillionPerMilliliter('BILML', '10*9/mL', 'billion per milliliter'), //#356
  BillionPerMicroliter('BILUL', '10*9/uL', 'billion per microliter'), //#357
  TenLiterPerMinutePerSquareMeter('10LMSM', '10.L/(min.m2)', '10 liter per minute per square meter'), //#358
  TenLiterPerMinute('10LPM', '10.L/min', '10 liter per minute'), //#359
  MicroNewtonSecondPerCentimeterPerMeterSquare('MUNS', '10.uN.s/(cm.m2)', '10 * microNewton * second / centimeter * (meter ^ 2)'), //#360
  MicroNewtonSecondPerCentimeter('MUNSCM', '10.uN.s/cm', '10 * microNewton * second / centimeter'), //#361
  MicroNewtonSecondPerCentimeterSquare('MUNSCM2', '10.uN.s/cm2', '10 * microNewton * second / (centimeter ^ 2)'), //#362
  Year('YR', 'a', 'year'), //#363
  AmperePerMeter('AM', 'A/m', 'Ampère / meter'), //#364
  TechnicalAtmosphere('ATT', 'att', 'technical atmosphere'), //#365
  Bar('BAR', 'bar', 'bar'), //#366
  DegreeCelsius('°C', 'Cel', 'degree Celsius'), //#367
  Centigram('CG', 'cg', 'centigram'), //#368
  Centiliter('CL', 'cL', 'centiliter'), //#369
  Centimeter('CM', 'cm', 'centimeter'), //#370
  CentimeterOfWater('CMW', 'cm[H2O]', 'centimeter of water'), //#371
  CentimeterOfWaterPerSecondMeter('CMWSM', 'cm[H2O]/(s.m)', 'centimeter of water column / second * meter'), //#372
  CentimeterOfWaterPerLiterPerSecond('CMWLPS', 'cm[H2O]/L/s', 'centimeter of water per liter per second'), //#373
  CentimeterOfMercury('CMHG', 'cm[Hg]', 'centimeter of mercury'), //#374
  SquareCentimeter('CM2', 'cm2', 'square centimeter'), //#375
  SquareCentimeterPerSecond('CM2S', 'cm2/s', 'square centimeter per second'), //#376
  CubicCentimeter('CM3', 'cm3', 'cubic centimeter'), //#377
  Centipoise('CP', 'cP', 'centiPoise'), //#378
  Centistokes('CST', 'cSt', 'centiStokes'), //#379
  Day('D', 'd', 'day'), //#380
  Decibel('DB', 'dB', 'decibel'), //#381
  Degree('DEG', 'deg', 'degree'), //#382
  DegreePerSecond('DEGS', 'deg/s', 'degree per second'), //#383
  Decigram('DG', 'dg', 'decigram'), //#384
  Deciliter('DL', 'dL', 'deciliter'), //#385
  Decimeter('DM', 'dm', 'decimeter'), //#386
  SquareDecimeterPerSquareSecond('DM2S2', 'dm2/s2', 'square decimeter per square second'), //#387
  Equivalents('EQ', 'eq', 'equivalents'), //#388
  EquivalentsPerLiter('EQL', 'eq/L', 'equivalents / liter'), //#389
  EquivalentsPerMilliliter('EQML', 'eq/mL', 'equivalents / milliliter'), //#390
  EquivalentsPerMillimole('EQMMOL', 'eq/mmol', 'equivalents / millimole'), //#391
  EquivalentsPerMicromole('EQUMOL', 'eq/umol', 'equivalents / micromole'), //#392
  Erg('ERG', 'erg', 'erg'), //#393
  Electronvolt('EV', 'eV', 'electronvolt'), //#394
  Femtogram('FG', 'fg', 'femtogram'), //#395
  Femtoliter('FL', 'fL', 'femtoliter'), //#396
  FemtoliterPerNanoliter('FLNL', 'fL/nL', 'femtoliter / nanoliter'), //#397
  Femtometer('FM', 'fm', 'femtometer'), //#398
  Femtomole('FMOL', 'fmol', 'femtomole'), //#399
  FemtomolePerGram('FMOLG', 'fmol/g', 'femtomole per gram'), //#400
  FemtomolePerLiter('FMOLL', 'fmol/L', 'femtomole per liter'), //#401
  FemtomolePerMilligram('FMOLMG', 'fmol/mg', 'femtomole / milligram'), //#402
  FemtomolePerMilliliter('FMOLML', 'fmol/mL', 'femtomole / milliliter'), //#403
  Gram('G', 'g', 'gram'), //#404
  GramMeter('GM', 'g.m', 'gram * meter'), //#405
  GramMeterPerHbMeterSquare('GMHMS2', 'g.m/({hb}.m2)', 'gram * meter / hb * (meter ^ 2)'), //#406
  GramMeterPerHb('GMHB', 'g.m/{hb}', 'gram * meter / hb'), //#407
  GramPer100Gram('G100G', 'g/(100.g)', 'gram per 100 gram'), //#408
  GramPer12Hour('G12H', 'g/(12.h)', 'gram per 12 hour'), //#409
  GramPer24Hour('G24H', 'g/(24.h)', 'gram per 24 hour'), //#410
  GramPer3Days('G3D', 'g/(3.d)', 'gram per 3 days'), //#411
  GramPer4Hour('G4H', 'g/(4.h)', 'gram per 4 hour'), //#412
  GramPer48Hour('G48H', 'g/(48.h)', 'gram per 48 hour'), //#413
  GramPer5Hour('G5H', 'g/(5.h)', 'gram per 5 hour'), //#414
  GramPer6Hour('G6H', 'g/(6.h)', 'gram per 6 hour'), //#415
  GramPer72Hour('G72H', 'g/(72.h)', 'gram per 72 hour'), //#416
  GramPer8Hour('G8H', 'g/(8.h)', 'gram / 8 * hour'), //#417
  GramPer8KilogramHour('G8KGH', 'g/(8.kg.h)', 'gram / 8 * kilogram * hour'), //#418
  GramPerKilogramHour('GKGH', 'g/(kg.h)', 'gram / kilogram * hour'), //#419
  GramPerKilogramMinute('GKGM', 'g/(kg.min)', 'gram / kilogram * minute'), //#420
  GramPerTotalWeight('GTW', 'g/{TotalWeight}', 'gram / TotalWeight'), //#421
  GramPerDay('GD', 'g/d', 'gram per day'), //#422
  GramPerDeciliter('GDL', 'g/dL', 'gram per deciliter'), //#423
  GramPerGram('GG', 'g/g', 'gram per gram'), //#424
  GramPerGramCre('GGC', 'g/g{Cre}', 'gram / gram Cre'), //#425
  GramPerGramCreat('GGC', 'g/g{creat}', 'gram / gram creat'), //#426
  GramPerGramTissue('GGT', 'g/g{tissue}', 'gram per gram of tissue'), //#427
  GramPerHour('GH', 'g/h', 'gram per hour'), //#428
  GramPerHourPerSquareMeter('GHM2', 'g/h/m2', 'gram per hour per square meter'), //#429
  GramPerKilogram('GKG', 'g/kg', 'gram per kilogram'), //#430
  GramPerKilogramPerDay('GKGD', 'g/kg/d', 'gram per kilogram per day'), //#431
  GramPerLiter('GL', 'g/L', 'gram per liter'), //#432
  GramsPerSquareMeter('GM2', 'g/m2', 'grams Per Square Meter'), //#433
  GramPerMilligram('GMG', 'g/mg', 'gram per milligram'), //#434
  GramPerMinute('GMN', 'g/min', 'gram per minute'), //#435
  GramPerMilliliter('GML', 'g/mL', 'gram per milliliter'), //#436
  GramPerMillimole('GMMOL', 'g/mmol', 'gram per millimole'), //#437
  GramPerMillimoleCreat('GMMOLC', 'g/mmol{creat}', 'gram / millimole creat'), //#438
  GramPerMole('GMOL', 'g/mol', 'gram per mole'), //#439
  GigaBecquerel('GBQ', 'GBq', 'gigaBecquerel'), //#440
  Hour('H', 'h', 'hour'), //#441
  Hectoliter('HL', 'hL', 'hectoliter'), //#442
  Hertz('HZ', 'Hz', 'Hertz'), //#443
  Joule('J', 'J', 'joule'), //#444
  JoulePerLiter('JL', 'J/L', 'joule per liter'), //#445
  Kelvin('K', 'K', 'Kelvin'), //#446
  KelvinPerWatt('KW', 'K/W', 'Kelvin / Watt'), //#447
  KiloInternationalUnitPerLiter('KIUL', 'k[IU]/L', 'kilo international unit per liter'), //#448
  KiloInternationalUnitPerMilliliter('KIUML', 'k[IU]/mL', 'kilo international unit per milliliter'), //#449
  KatalPerKilogram('KATKG', 'kat/kg', 'katal / kilogram'), //#450
  KatalPerLiter('KATL', 'kat/L', 'katal / liter'), //#451
  KiloBecquerel('KBQ', 'kBq', 'kiloBecquerel'), //#452
  Kilocalorie('KCAL', 'kcal', 'kilocalorie'), //#453
  KilocaloriePer8Hour('KCAL8H', 'kcal/(8.h)', 'kilocalorie / 8 * hour'), //#454
  KilocaloriePerHour('KCALH', 'kcal/h', 'kilocalorie per hour'), //#455
  Kilogram('KG', 'kg', 'kilogram'), //#456
  KilogramMeterPerSecond('KGMS', 'kg.m/s', 'kilogram meter per second'), //#457
  KilogramPerSecondPerSquareMeter('KGSM2', 'kg/(s.m2)', 'kilogram per second per square meter'), //#458
  KilogramPerHour('KGH', 'kg/h', 'kilogram per hour'), //#459
  KilogramPerLiter('KGL', 'kg/L', 'kilogram per liter'), //#460
  KilogramPerSquareMeter('KGM2', 'kg/m2', 'kilogram / (meter ^ 2)'), //#461
  KilogramPerCubicMeter('KGM3', 'kg/m3', 'kilogram / (meter ^ 3)'), //#462
  KilogramPerMinute('KGM', 'kg/min', 'kilogram / minute'), //#463
  KilogramPerMole('KGMOL', 'kg/mol', 'kilogram per mole'), //#464
  KilogramPerSecond('KGS', 'kg/s', 'kilogram / second'), //#465
  Kiloliter('KL', 'kL', 'kiloliter'), //#466
  Kilometer('KM', 'km', 'kilometer'), //#467
  KiloPascal('KPA', 'kPa', 'kiloPascal'), //#468
  Kilosecond('KS', 'ks', 'kilosecond'), //#469
  KiloenzymeUnitPerGram('KU', 'kU/g', 'kiloenzyme Unit per gram'), //#470
  KiloUnitPerHour('KUH', 'kU/h', 'kiloUnit / hour'), //#471
  KiloenzymeUnitPerLiter('KUL', 'kU/L', 'kiloenzyme Unit per liter'), //#472
  KiloenzymeUnitPerMilliliter('KUML', 'kU/mL', 'kilo enzyme unit per milliliter'), //#473
  Liter('L', 'L', 'liter'), //#474
  LiterSecondSquareSecond('/S2', 'L.s2/s', 'liter * (second ^ 2) / second'), //#475
  LiterPer8Hour('L8H', 'L/(8.h)', 'liter per 8 hour'), //#476
  LiterPerMinutePerSquareMeter('LMSM', 'L/(min.m2)', 'liter per minute per square meter'), //#477
  LiterPerDay('LD', 'L/d', 'liter per day'), //#478
  LiterPerHour('LH', 'L/h', 'liter per hour'), //#479
  LiterPerKilogram('LKG', 'L/kg', 'liter per kilogram'), //#480
  LiterPerLiter('LL', 'L/L', 'liter per liter'), //#481
  LiterPerMinute('LPM', 'L/min', 'liter per minute'), //#482
  LiterPerSecond('LPS', 'L/s', 'liter / second'), //#483
  LumenPerSquareMeter('LM2', 'lm/m2', 'lumen / (meter ^ 2)'), //#484
  Meter('M', 'm', 'meter'), //#485
  MeterPerSecond('MS', 'm/s', 'meter per second'), //#486
  MeterPerSquareSecond('MS2', 'm/s2', 'meter per square second'), //#487
  MilliinternationalUnit('MIU', 'm[iU]', 'milliinternational unit'), //#488
  MilliinternationalUnitPerLiter('MIUL', 'm[IU]/L', 'milli international unit per liter'), //#489
  MilliinternationalUnitPerMilliliter('MIUML', 'm[IU]/mL', 'milli international unit per milliliter'), //#490
  SquareMeter('M2', 'm2', 'square meter'), //#491
  SquareMeterPerSecond('M2S', 'm2/s', 'square meter per second'), //#492
  CubicMeterPerSecond('M3S', 'm3/s', 'cubic meter per second'), //#493
  Milliampere('MA', 'mA', 'milliAmpère'), //#494
  Millibar('MBAR', 'mbar', 'millibar'), //#495
  MillibarSecondPerLiter('MBARSL', 'mbar.s/L', 'millibar second per liter'), //#496
  MegaBecquerel('MBQ', 'MBq', 'megaBecquerel'), //#497
  MilliCurie('MCI', 'mCi', 'milliCurie'), //#498
  Milliequivalent('MEQ', 'meq', 'milliequivalent'), //#499
  MilliequivalentPer12Hour('MEQ12H', 'meq/(12.h)', 'milliequivalent per 12 hour'), //#500
  MilliequivalentPer2Hour('MEQ2H', 'meq/(2.h)', 'milliequivalent per 2 hour'), //#501
  MilliequivalentPer24Hour('MEQ24H', 'meq/(24.h)', 'milliequivalent per 24 hour'), //#502
  MilliequivalentPer8Hour('MEQ8H', 'meq/(8.h)', 'milliequivalent per 8 hour'), //#503
  MilliequivalentPer8HourKilogram('MEQ8HK', 'meq/(8.h.kg)', 'milliequivalents / 8 * hour * kilogram'), //#504
  MilliequivalentPerKilogramPerDay('MEQKGD', 'meq/(kg.d)', 'milliequivalents / kilogram * day'), //#505
  MilliequivalentPerSpecimen('MEQS', 'meq/{Specimen}', 'milliequivalents / Specimen'), //#506
  MilliequivalentPerDay('MEQD', 'meq/d', 'milliequivalent per day'), //#507
  MilliequivalentPerDeciliter('MEQDL', 'meq/dL', 'milliequivalent per deciliter'), //#508
  MilliequivalentPerGram('MEQG', 'meq/g', 'milliequivalent per gram'), //#509
  MilliequivalentPerGramCre('MEQGC', 'meq/g{Cre}', 'milliequivalents / gram Cre'), //#510
  MilliequivalentPerHour('MEQH', 'meq/h', 'milliequivalent per hour'), //#511
  MilliequivalentPerKilogram('MEQKG', 'meq/kg', 'milliequivalent per kilogram'), //#512
  MilliequivalentPerKilogramPerHour('MEQKGH', 'meq/kg/h', 'milliequivalent per kilogram per hour'), //#513
  MilliequivalentPerKilogramPerMinute('MEQKGM', 'meq/kg/min', 'milliequivalents / kilogram / minute'), //#514
  MilliequivalentPerLiter('MEQL', 'meq/L', 'milliequivalent per liter'), //#515
  MilliequivalentPerSquareMeter('MEQM2', 'meq/m2', 'milliequivalent per square meter'), //#516
  MilliequivalentPerMinute('MEQMIN', 'meq/min', 'milliequivalent per minute'), //#517
  MilliequivalentPerMilliliter('MEQML', 'meq/mL', 'milliequivalent per milliliter'), //#518
  Milligram('MG', 'mg', 'milligram'), //#519
  MilligramPer10Hour('MG10H', 'mg/(10.h)', 'milligram per 10 hour'), //#520
  MilligramPer12Hour('MG12H', 'mg/(12.h)', 'milligram per 12 hour'), //#521
  MilligramPer18Hour('MG18H', 'mg/(18.h)', 'milligram per 18 hour'), //#522
  MilligramPer2Hour('MG2H', 'mg/(2.h)', 'milligram per 2 hour'), //#523
  MilligramPer24Hour('MG24H', 'mg/(24.h)', 'milligram per 24 hour'), //#524
  MilligramPer72Hour('MG72H', 'mg/(72.h)', 'milligram per 72 hour'), //#525
  MilligramPer8Hour('MG8H', 'mg/(8.h)', 'milligram per 8 hour'), //#526
  MilligramPer8HourKilogram('MG8HK', 'mg/(8.h.kg)', 'milligram / 8 * hour * kilogram'), //#527
  MilligramPerKilogramHour('MGKGH', 'mg/(kg.h)', 'milligram / kilogram * hour'), //#528
  MilligramPerHgbPerGram('MGHGG', 'mg/{Hgb}/g', 'milligram / Hgb / gram'), //#529
  MilligramPerSpecimen('MGS', 'mg/{Specimen}', 'milligram / Specimen'), //#530
  MilligramPerTotalVolume('MGTOTV', 'mg/{Tot\'Volume}', 'milligram / Tot\'Volume'), //#531
  MilligramPerVolume('MGVOL', 'mg/{Volume}', 'milligram / Volume'), //#532
  MilligramPerDay('MGD', 'mg/d', 'milligram per day'), //#533
  MilligramPerDayAlt('MGDALT', 'mg/d/(173.10*-2.m2)', 'milligram / day / 173 * (the number ten for arbitrary powers ^ -2) * (meter ^ 2)'), //#534
  MilligramPerDeciliter('MGDL', 'mg/dL', 'milligram per deciliter'), //#535
  MilligramPerGram('MGG', 'mg/g', 'milligram per gram'), //#536
  MilligramPerGramCre('MGGC', 'mg/g{Cre}', 'milligram / gram Cre'), //#537
  MilligramPerGramCreat('MGGC', 'mg/g{creat}', 'milligram per gram of creatinine'), //#538
  MilligramPerHour('MGH', 'mg/h', 'milligram per hour'), //#539
  MilligramPerKilogram('MGKG', 'mg/kg', 'milligram per kilogram'), //#540
  MilligramPerKilogramPerDay('MGKGD', 'mg/kg/(24.h)', 'milligram / kilogram / 24 * hour'), //#541
  MilligramPerKilogramPerDayAlt('MGKGDA', 'mg/kg/d', 'milligram per kilogram per day'), //#542
  MilligramPerKilogramPerMinute('MGKGM', 'mg/kg/min', 'milligram per kilogram per minute'), //#543
  MilligramPerLiter('MGL', 'mg/L', 'milligram per liter'), //#544
  MilligramPerSquareMeter('MGM2', 'mg/m2', 'milligram per square meter'), //#545
  MilligramPerCubicMeter('MGM3', 'mg/m3', 'milligram per cubic meter'), //#546
  MilligramPerMilligram('MGMG', 'mg/mg', 'milligram per milligram'), //#547
  MilligramPerMilligramCre('MGMGC', 'mg/mg{cre}', 'milligram / milligram cre'), //#548
  MilligramPerMinute('MGMIN', 'mg/min', 'milligram per minute'), //#549
  MilligramPerMilliliter('MGML', 'mg/mL', 'milligram per milliliter'), //#550
  MilligramPerMillimole('MGMMOL', 'mg/mmol', 'milligram per millimole'), //#551
  MilligramPerMillimoleCre('MGMMOLC', 'mg/mmol{Cre}', 'milligram / millimole Cre'), //#552
  MilligramPerMillimoleCreat('MGMMOLC', 'mg/mmol{creat}', 'milligram per millimole of creatinine'), //#553
  MilligramPerWeek('MGWK', 'mg/wk', 'milligram per week'), //#554
  MilligramPhenylketonesPerDeciliter('MGDL', 'mg{Phenylketones}/dL', 'milligram Phenylketones / deciliter'), //#555
  Minute('MIN', 'min', 'minute'), //#556
  Milliliter('ML', 'mL', 'milliliter'), //#557
  MilliliterPerHbMeterSquare('MLHMS', 'mL/({h\'b}.m2)', 'milliliter / h\'b * (meter ^ 2)'), //#558
  MilliliterPer10Hour('ML10H', 'mL/(10.h)', 'milliliter per 10 hour'), //#559
  MilliliterPer12Hour('ML12H', 'mL/(12.h)', 'milliliter per 12 hour'), //#560
  MilliliterPer2Hour('ML2H', 'mL/(2.h)', 'milliliter per 2 hour'), //#561
  MilliliterPer24Hour('ML24H', 'mL/(24.h)', 'milliliter per 24 hour'), //#562
  MilliliterPer4Hour('ML4H', 'mL/(4.h)', 'milliliter per 4 hour'), //#563
  MilliliterPer72Hour('ML72H', 'mL/(72.h)', 'milliliter per 72 hour'), //#564
  MilliliterPer8Hour('ML8H', 'mL/(8.h)', 'milliliter per 8 hour'), //#565
  MilliliterPerKilogramMinute('MLKGMIN', 'mL/(kg.min)', 'milliliter / kilogram * minute'), //#566
  MilliliterPerSquareInch('MLIN2', 'mL/[sin_i]', 'milliliter per square inch (international)'), //#567
  MilliliterPerHeartbeat('MLHB', 'mL/{h\'b}', 'MilliLitersPerHeartbeat [SI Volume Units]'), //#568
  MilliliterPerCentimeterOfWater('MLCMW', 'mL/cm[H2O]', 'milliliter / centimeter of water column'), //#569
  MilliliterPerDay('MLD', 'mL/d', 'milliliter per day'), //#570
  MilliliterPerDeciliter('MLDL', 'mL/dL', 'milliliter per deciliter'), //#571
  MilliliterPerHour('MLH', 'mL/h', 'milliliter per hour'), //#572
  MilliliterPerKilogram('MLKG', 'mL/kg', 'milliliter per kilogram'), //#573
  MilliliterPerKilogramPer8Hour('MLKGH8', 'mL/kg/(8.h)', 'milliliter per kilogram per 8 hour'), //#574
  MilliliterPerKilogramPerDay('MLKGD', 'mL/kg/d', 'milliliter per kilogram per day'), //#575
  MilliliterPerKilogramPerHour('MLKGH', 'mL/kg/h', 'milliliter per kilogram per hour'), //#576
  MilliliterPerKilogramPerMinute('MLKGM', 'mL/kg/min', 'milliliter per kilogram per minute'), //#577
  MilliliterPerLiter('MLL', 'mL/L', 'milliliter per liter'), //#578
  MilliliterPerSquareMeter('MLM2', 'mL/m2', 'milliliter per square meter'), //#579
  MilliliterPerMillibar('MLMBAR', 'mL/mbar', 'milliliter per millibar'), //#580
  MilliliterPerMinute('MLMIN', 'mL/min', 'milliliter per minute'), //#581
  MilliliterPerMinuteAlt('MLM2ALT', 'mL/min/(173.10*-2.m2)', 'milliliter / minute / 173 * (the number ten for arbitrary powers ^ -2) * (meter ^ 2)'), //#582
  MilliliterPerMinutePer1Point73SquareMeter('MLM2', 'mL/min/{1.73_m2}', 'milliliter per minute per 1.73 square meter'), //#583
  MilliliterPerMinutePerSquareMeter('MLMINSM', 'mL/min/m2', 'milliliter per minute per square meter'), //#584
  MilliliterPerMillimeter('MLMM', 'mL/mm', 'milliliter per millimeter'), //#585
  MilliliterPerSecond('MLS', 'mL/s', 'milliliter per second'), //#586
  Millimeter('MM', 'mm', 'millimeter'), //#587
  MillimeterPerHour('MMH', 'mm/h', 'millimeter per hour'), //#588
  MillimeterPerMinute('MMMIN', 'mm/min', 'millimeter per minute'), //#589
  MillimeterOfWater('MMW', 'mm[H2O]', 'millimeter of water'), //#590
  MillimeterOfMercury('MMHG', 'mm[Hg]', 'millimeter of mercury'), //#591
  SquareMillimeter('MM2', 'mm2', 'square millimeter'), //#592
  CubicMillimeter('MM3', 'mm3', 'cubic millimeter'), //#593
  Millimole('MMOL', 'mmol', 'millimole'), //#594
  MillimolePer12Hour('MMOL12H', 'mmol/(12.h)', 'millimole per 12 hour'), //#595
  MillimolePer18Hour('MMOL18H', 'mmol/(18.h)', 'millimole per 18 hour'), //#596
  MillimolePer2Hour('MMOL2H', 'mmol/(2.h)', 'millimole per 2 hour'), //#597
  MillimolePer24Hour('MMOL24H', 'mmol/(24.h)', 'millimole per 24 hour'), //#598
  MillimolePer6Hour('MMOL6H', 'mmol/(6.h)', 'millimole per 6 hour'), //#599
  MillimolePer8Hour('MMOL8H', 'mmol/(8.h)', 'millimole per 8 hour'), //#600
  MillimolePer8HourKilogram('MMOL8HK', 'mmol/(8.h.kg)', 'millimole / 8 * hour * kilogram'), //#601
  MillimolePerTotalVolume('MMOLTV', 'mmol/{Tot\'Volume}', 'millimole / Tot\'Volume'), //#602
  MillimolePerDay('MMOLD', 'mmol/d', 'millimole per day'), //#603
  MillimolePerDeciliter('MMOLDL', 'mmol/dL', 'millimole per deciliter'), //#604
  MillimolePerGram('MMOLG', 'mmol/g', 'millimole per gram'), //#605
  MillimolePerGramCreat('MMOLGC', 'mmol/g{creat}', 'millimole per gram of creatinine'), //#606
  MillimolePerGramHemoglobin('MMOLGH', 'mmol/g{hemoglobin}', 'millimole per gram of hemoglobin'), //#607
  MillimolePerHour('MMOLH', 'mmol/h', 'millimole per hour'), //#608
  MillimolePerHourPerMilligramOfHemoglobin('MMOLHGH', 'mmol/h/mg{Hb}', 'millimole per hour per milligram of hemoglobin'), //#609
  MillimolePerHourPerMilligramOfProtein('MMOLHP', 'mmol/h/mg{protein}', 'millimole per hour per milligram of protein'), //#610
  MillimolePerKilogram('MMOLKG', 'mmol/kg', 'millimole per kilogram'), //#611
  MillimolePerLiter('MMOLL', 'mmol/L', 'millimole per liter'), //#612
  MillimolePerLiterPerSecond('MMOLLPS', 'mmol/L/s', 'millimole per liter per second'), //#613
  MillimolePerLiterOfRedBloodCells('MMOLLRC', 'mmol/L{RBCs}', 'millimole per liter of red blood cells'), //#614
  MillimolePerMeter('MMOLM', 'mmol/m', 'millimole / meter'), //#615
  MillimolePerMilligram('MMOLMG', 'mmol/mg', 'millimole per milligram'), //#616
  MillimolePerMilligramPerHour('MMOLMGH', 'mmol/mg/h', 'millimole per milligram per hour'), //#617
  MillimolePerMinutePerMilligramOfHemoglobin('MMOLMMGH', 'mmol/min/mg{hemoglobin}', 'millimole per minute per milligram of hemoglobin'), //#618
  MillimolePerMinutePerMilligramOfProtein('MMOLMMGP', 'mmol/min/mg{protein}', 'millimole per minute per milligram of protein'), //#619
  MillimolePerMinutePerMilliliter('MMOLMMML', 'mmol/min/mL', 'millimole per minute per milliliter'), //#620
  MillimolePerMilliliter('MMOLML', 'mmol/mL', 'millimole per milliliter'), //#621
  MillimolePerMilliliterPerHour('MMOLMLH', 'mmol/mL/h', 'millimole per milliliter per hour'), //#622
  MillimolePerMilliliterPerMinute('MMOLMLM', 'mmol/mL/min', 'millimole per milliliter per minute'), //#623
  MillimolePerMillimole('MMOLMMOL', 'mmol/mmol', 'millimole per millimole'), //#624
  MillimolePerMole('MMOLMOL', 'mmol/mol', 'millimole per mole'), //#625
  MillimolePerMoleCre('MMOLMOLC', 'mmol/mol{creat}', 'millimole per mole of creatinine'), //#626
  MillimolePerSecondPerLiter('MMOLSPL', 'mmol/s/L', 'millimole per second per liter'), //#627
  Month('MO', 'mo', 'month'), //#628
  Mole('MOL', 'mol', 'mole'), //#629
  MolePerDay('MOLD', 'mol/d', 'mole per day'), //#630
  MolePerKilogram('MOLKG', 'mol/kg', 'mole per kilogram'), //#631
  MolePerKilogramPerSecond('MOLKGS', 'mol/kg/s', 'mole per kilogram per second'), //#632
  MolePerLiter('MOLL', 'mol/L', 'mole per liter'), //#633
  MolePerCubicMeter('MOLM3', 'mol/m3', 'mole per cubic meter'), //#634
  MolePerMilliliter('MOLML', 'mol/mL', 'mole per milliliter'), //#635
  MolePerMole('MOLMOL', 'mol/mol', 'mole per mole'), //#636
  MolePerMoleCre('MOLMOLC', 'mol/mol{creat}', 'mole / mole creat'), //#637
  MolePerSecond('MOLS', 'mol/s', 'mole per second'), //#638
  Milliosmole('MOSM', 'mosm', 'milliosmole'), //#639
  MilliosmolePerKilogram('MOSMKG', 'mosm/kg', 'milliosmole per kilogram'), //#640
  MilliosmolePerLiter('MOSML', 'mosm/L', 'milliosmole per liter'), //#641
  Millipascal('MPA', 'mPa', 'millipascal'), //#642
  Millisecond('MS', 'ms', 'millisecond'), //#643
  MillienzymeUnit('MU', 'mU', 'millienzyme Unit'), //#644
  MillienzymeUnitPerGram('MUG', 'mU/g', 'millienzyme Unit per gram'), //#645
  MillienzymeUnitPerGramHgb('MUGH', 'mU/g{Hgb}', 'milliUnit / gram Hgb'), //#646
  MillienzymeUnitPerLiter('MUL', 'mU/L', 'millienzyme Unit per liter'), //#647
  MillienzymeUnitPerMilligram('MUMG', 'mU/mg', 'milliUnit / milligram'), //#648
  MillienzymeUnitPerMilligramCre('MUMGC', 'mU/mg{Cre}', 'milliUnit / milligram Cre'), //#649
  MillienzymeUnitPerMinute('MUMIN', 'mU/min', 'milliUnit / minute'), //#650
  MillienzymeUnitPerMilliliter('MUML', 'mU/mL', 'millienzyme Unit per milliliter'), //#651
  MillienzymeUnitPerMilliliterPerMinute('MUMLMIN', 'mU/mL/min', 'millienzyme Unit per milliliter per minute'), //#652
  MillienzymeUnitPerMillimoleCreat('MUMMC', 'mU/mmol{creatinine}', 'millienzyme Unit per millimole of creatinine'), //#653
  MillienzymeUnitPerMillimoleRedBloodCells('MUMMRBC', 'mU/mmol{RBCs}', 'millienzyme Unit per millimole of red blood cells'), //#654
  Millivolt('MV', 'mV', 'milliVolt'), //#655
  Newton('N', 'N', 'Newton'), //#656
  NewtonCentimeter('NCM', 'N.cm', 'Newton centimeter'), //#657
  NewtonSecond('NS', 'N.s', 'Newton second'), //#658
  NanoCurie('NCI', 'nCi', 'nanoCurie'), //#659
  Nanogram('NG', 'ng', 'nanogram'), //#660
  NanogramPer24Hour('NG24H', 'ng/(24.h)', 'nanogram per 24 hour'), //#661
  NanogramPer8Hour('NG8H', 'ng/(8.h)', 'nanogram per 8 hour'), //#662
  NanogramPer8HourKilogram('NG8HK', 'ng/(8.h.kg)', 'nanogram / 8 * hour * kilogram'), //#663
  NanogramPerKilogramDay('NGKGD', 'ng/(kg.d)', 'nanogram / kilogram * day'), //#664
  NanogramPerKilogramHour('NGKGH', 'ng/(kg.h)', 'nanogram / kilogram * hour'), //#665
  NanogramPerKilogramMinute('NGKGM', 'ng/(kg.min)', 'nanogram / kilogram * minute'), //#666
  NanogramPerMillion('NGM', 'ng/10*6', 'nanogram per million'), //#667
  NanogramPerDay('NGD', 'ng/d', 'nanogram per day'), //#668
  NanogramPerDeciliter('NGDL', 'ng/dL', 'nanogram per deciliter'), //#669
  NanogramPerDeciliterPerHour('NGDLH', 'ng/dL/h', 'nanogram / deciliter / hour'), //#670
  NanogramPerGram('NGG', 'ng/g', 'nanogram per gram'), //#671
  NanogramPerGramCre('NGGC', 'ng/g{Cre}', 'nanogram / gram Cre'), //#672
  NanogramPerGramCreat('NGGC', 'ng/g{creat}', 'nanogram per gram of creatinine'), //#673
  NanogramPerHour('NGH', 'ng/h', 'nanogram per hour'), //#674
  NanogramPerKilogram('NGKG', 'ng/kg', 'nanogram per kilogram'), //#675
  NanogramPerKilogramPer8Hour('NGKGH8', 'ng/kg/(8.h)', 'nanogram per kilogram per 8 hour'), //#676
  NanogramPerKilogramPerHour('NGKGH', 'ng/kg/h', 'nanogram per kilogram per hour'), //#677
  NanogramPerKilogramPerMinute('NGKGM', 'ng/kg/min', 'nanogram per kilogram per minute'), //#678
  NanogramPerLiter('NGL', 'ng/L', 'nanogram per liter'), //#679
  NanogramPerSquareMeter('NGM2', 'ng/m2', 'nanogram per square meter'), //#680
  NanogramPerMilligram('NGMG', 'ng/mg', 'nanogram per milligram'), //#681
  NanogramPerMilligramPerHour('NGMGH', 'ng/mg/h', 'nanogram per milligram per hour'), //#682
  NanogramPerMilligramProtein('NGMGP', 'ng/mg{Protein}', 'nanogram / milligram Protein'), //#683
  NanogramPerMinute('NGMIN', 'ng/min', 'nanogram per minute'), //#684
  NanogramPerMilliliter('NGML', 'ng/mL', 'nanogram per millliiter'), //#685
  NanogramPerMilliliterPerHour('NGMLH', 'ng/mL/h', 'nanogram per milliliter per hour'), //#686
  NanogramPerMilliliterRedBloodCells('NGMLRC', 'ng/mL{rbc}', 'nanogram / milliliter rbc'), //#687
  NanogramPerSecond('NGS', 'ng/s', 'nanogram per second'), //#688
  Nanokatal('NKAT', 'nkat', 'nanokatal'), //#689
  Nanoliter('NL', 'nL', 'nanoliter'), //#690
  Nanometer('NM', 'nm', 'nanometer'), //#691
  NanometerPerSecondPerLiter('NMSPL', 'nm/s/L', 'nanometer per second per liter'), //#692
  Nanomole('NMOL', 'nmol', 'nanomole'), //#693
  NanomolePer24Hour('NMOL24H', 'nmol/(24.h)', 'nanomole per 24 hour'), //#694
  NanomolePerDay('NMOLD', 'nmol/d', 'nanomole per day'), //#695
  NanomolePerDeciliter('NMOLDL', 'nmol/dL', 'nanomole per deciliter'), //#696
  NanomolePerGram('NMOLG', 'nmol/g', 'nanomole per gram'), //#697
  NanomolePerGramCre('NMOLGC', 'nmol/g{Cre}', 'nanomole / gram Cre'), //#698
  NanomolePerGramCreat('NMOLGC', 'nmol/g{creat}', 'nanomole per gram of creatinine'), //#699
  NanomolePerGramDryWeight('NMOLGDW', 'nmol/g{dry_wt}', 'nanomole per gram of dry weight'), //#700
  NanomolePerHourPerLiter('NMOLHL', 'nmol/h/L', 'nanomole per hour per liter'), //#701
  NanomolePerHourPerMilligramProtein('NMOLHMP', 'nmol/h/mg{protein}', 'nanomole per hour per milligram of protein'), //#702
  NanomolePerHourPerMilliliter('NMOLHM', 'nmol/h/mL', 'nanomole per hour per milliliter'), //#703
  NanomolePerLiter('NMOLL', 'nmol/L', 'nanomole per liter'), //#704
  NanomolePerLiterPerMillimoleCreat('NMOLLMC', 'nmol/L/mmol{creat}', 'nanomole per liter per millimole of creatinine'), //#705
  NanomolePerLiterPerSecond('NMOLLPS', 'nmol/L/s', 'nanomole per liter per second'), //#706
  NanomolePerLiterOfRedBloodCells('NMOLLRC', 'nmol/L{RBCs}', 'nanomole per liter of red blood cells'), //#707
  NanomolePerMeterPerMilligramOfProtein('NMOLMP', 'nmol/m/mg{protein}', 'nanomole per meter per milligram of protein'), //#708
  NanomolePerMilligram('NMOLMG', 'nmol/mg', 'nanomole per milligram'), //#709
  NanomolePerMilligramPerHour('NMOLMGH', 'nmol/mg/h', 'nanomole per milligram per hour'), //#710
  NanomolePerMinutePerMilligramOfHemoglobin('NMOLMMGH', 'nmol/min/mg{hemoglobin}', 'nanomole per minute per milligram of hemoglobin'), //#711
  NanomolePerMinutePerMilligramOfProtein('NMOLMMGP', 'nmol/min/mg{protein}', 'nanomole per minute per milligram of protein'), //#712
  NanomolePerMinutePerMilliliter('NMOLMMML', 'nmol/min/mL', 'nanomole per minute per milliliter'), //#713
  NanomolePerMilliliter('NMOLML', 'nmol/mL', 'nanomole per milliliter'), //#714
  NanomolePerMilliliterPerHour('NMOLMLH', 'nmol/mL/h', 'nanomole per milliliter per hour'), //#715
  NanomolePerMilliliterPerMinute('NMOLMLM', 'nmol/mL/min', 'nanomole per milliliter per minute'), //#716
  NanomolePerMillimole('NMOLMMOL', 'nmol/mmol', 'nanomole per millimole'), //#717
  NanomolePerMillimoleCre('NMOLMMOLC', 'nmol/mmol{Cre}', 'nanomole / millimole Cre'), //#718
  NanomolePerMillimoleCreat('NMOLMMOLC', 'nmol/mmol{creat}', 'nanomole per millimole of creatinine'), //#719
  NanomolePerMole('NMOLMOL', 'nmol/mol', 'nanomole per mole'), //#720
  NanomolePerNanomole('NMOLN', 'nmol/nmol', 'nanomole per nanomole'), //#721
  NanomolePerSecond('NMOLS', 'nmol/s', 'nanomole per second'), //#722
  NanomolePerSecondPerLiter('NMOLSPL', 'nmol/s/L', 'nanomole per second per liter'), //#723
  NanomolePerMicromoleCreat('NMOLUMC', 'nmol/umol{creat}', 'nanomole per micromole of creatinine'), //#724
  Nanosecond('NS', 'ns', 'nanosecond'), //#723
  Ohm('OHM', 'Ohm', 'Ohm'), //#724
  OsmolePerKilogram('OSMK', 'osm/kg', 'osmole per kilogram'), //#725
  OsmolePerLiter('OSML', 'osm/L', 'osmole per liter'), //#726
  Pascal('PA', 'Pa', 'Pascal'), //#727
  Picogram('PG', 'pg', 'picogram'), //#728
  PicogramPerDeciliter('PGDL', 'pg/dL', 'picogram per deciliter'), //#729
  PicogramPerLiter('PGL', 'pg/L', 'picogram per liter'), //#730
  PicogramPerMilligram('PGMG', 'pg/mg', 'picogram per milligram'), //#731
  PicogramPerMilliliter('PGML', 'pg/mL', 'picogram per milliliter'), //#732
  PicogramPerMillimeter('PGMM', 'pg/mm', 'picogram per millimeter'), //#733
  Picokatal('PKAT', 'pkat', 'picokatal'), //#734
  Picoliter('PL', 'pL', 'picoliter'), //#735
  Picometer('PM', 'pm', 'picometer'), //#736
  Picomole('PMOL', 'pmol', 'picomole'), //#737
  PicomolePerDay('PMOLD', 'pmol/d', 'picomole per day'), //#738
  PicomolePerDeciliter('PMOLDL', 'pmol/dL', 'picomole per deciliter'), //#739
  PicomolePerGram('PMOLG', 'pmol/g', 'picomole per gram'), //#740
  PicomolePerHourPerMilligramOfProtein('PMHMG', 'pmol/h/mg{protein}', 'picomole per hour per milligram of protein'), //#741
  PicomolePerHourPerMilliliter('PMHML', 'pmol/h/mL', 'picomole per hour per milliliter'), //#742
  PicomolePerLiter('PMOLL', 'pmol/L', 'picomole per liter'), //#743
  PicomolePerMilligramOfProtein('PMMG', 'pmol/mg{protein}', 'picomole per milligram of protein'), //#744
  PicomolePerMinute('PMMIN', 'pmol/min', 'picomole per minute'), //#745
  PicomolePerMinutePerMilligramOfProtein('PMMMP', 'pmol/min/mg{protein}', 'picomole per minute per milligram of protein'), //#746
  PicomolePerMilliliter('PMML', 'pmol/mL', 'picomole per milliliter'), //#747
  PicomolePerMillimole('PMMM', 'pmol/mmol', 'picomole per millimole'), //#748
  PicomolePerMillimoleCreatinine('PMMCR', 'pmol/mmol{creat}', 'picomole per millimole of creatinine'), //#749
  PicomolePerMole('PMMOL', 'pmol/mol', 'picomole per mole'), //#750
  PicomolePerMicromole('PMUM', 'pmol/umol', 'picomole per micromole'), //#751
  PicomolePerMicromoleCreatinine('PMUMC', 'pmol/umol{creat}', 'picomole per micromole of creatinine'), //#752
  Picosecond('PS', 'ps', 'picosecond'), //#753
  Picotesla('PT', 'pT', 'picotesla'), //#754
  Second('S', 's', 'second'), //#755
  Stokes('ST', 'St', 'Stokes'), //#756
  Tonne('T', 't', 'tonne'), //#757
  EnzymeUnit('U', 'U', 'enzyme Unit'), //#758
  EnzymeUnitPerHour('U1H', 'U/(1.h)', 'enzyme Unit per 1 hour'), //#759
  EnzymeUnitPer12Hour('U12H', 'U/(12.h)', 'enzyme unit per 12 hour'), //#760
  EnzymeUnitPer18Hour('U18H', 'U/(18.h)', 'enzyme Unit per 18 hour'), //#761
  EnzymeUnitPer2Hour('U2H', 'U/(2.h)', 'enzyme unit per 2 hour'), //#762
  EnzymeUnitPer24Hour('U24H', 'U/(24.h)', 'enzyme unit per 24 hour'), //#763
  EnzymeUnitPer10BillionCells('U10B', 'U/10*10{cells}', 'enzyme unit per 10 billion cells'), //#764
  EnzymeUnitPerTrillion('U1T', 'U/10*12', 'enzyme unit per trillion'), //#765
  EnzymeUnitPerMillion('U1M', 'U/10*6', 'enzyme unit per million'), //#766
  EnzymeUnitPerBillion('U1B', 'U/10*9', 'enzyme unit per billion'), //#767
  EnzymeUnitPerDay('UD', 'U/d', 'enzyme unit per day'), //#768
  EnzymeUnitPerDeciliter('UDL', 'U/dL', 'enzyme unit per deciliter'), //#769
  EnzymeUnitPerGram('UG', 'U/g', 'enzyme unit per gram'), //#770
  UnitPerGramCre('UGCR', 'U/g{Cre}', 'Unit / gram Cre'), //#771
  EnzymeUnitPerHourAlt('UH', 'U/h', 'enzyme unit per hour'), //#772
  UnitPerKilogramPerHour('UKGH', 'U/kg/h', 'Unit / kilogram / hour'), //#773
  EnzymeUnitPerKilogramOfHemoglobin('UKGH', 'U/kg{Hb}', 'enzyme unit per kilogram of hemoglobin'), //#774
  EnzymeUnitPerKilogramOfHemoglobinAlt('UKHE', 'U/kg{hemoglobin}', 'enzyme Unit per kilogram of hemoglobin'), //#775
  EnzymeUnitPerLiter('UL', 'U/L', 'enzyme unit per liter'), //#776
  EnzymeUnitPerMinute('UMIN', 'U/min', 'enzyme unit per minute'), //#777
  EnzymeUnitPerMilliliter('UML', 'U/mL', 'enzyme unit per milliliter'), //#778
  UnitPerMilliliterRBC('UMRB', 'U/mL{RBC}', 'Unit / milliliter RBC'), //#779
  EnzymeUnitPerMilliliterOfRedBloodCells('UMRBC', 'U/mL{RBCs}', 'enzyme unit per milliliter of red blood cells'), //#780
  EnzymeUnitPerMillimoleOfCreatinine('UMCR', 'U/mmol{creat}', 'enzyme unit per millimole of creatinine'), //#781
  EnzymeUnitPerMole('UMOL', 'U/mol', 'enzyme Unit per mole'), //#782
  EnzymeUnitPerSecond('US', 'U/s', 'enzyme unit per second'), //#783
  EnzymeUnitPerMicromole('UUMO', 'U/umol', 'enzyme Unit per micromole'), //#784
  MicroInternationalUnit('UIU', 'u[IU]', 'micro international unit'), //#785
  MicroInternationalUnitPerLiter('UIUL', 'u[IU]/L', 'microinternational unit per liter'), //#786
  MicroInternationalUnitPerMilliliter('UIUM', 'u[IU]/mL', 'micro international unit per milliliter'), //#787
  Microequivalents('UEQ', 'ueq', 'microequivalents'), //#788
  MicroequivalentPerLiter('UEQL', 'ueq/L', 'microequivalent per liter'), //#789
  MicroequivalentPerMilliliter('UEQM', 'ueq/mL', 'microequivalent per milliliter'), //#790
  Microgram('UG', 'ug', 'microgram'), //#791
  MicrogramPer24Hour('UG24', 'ug/(24.h)', 'microgram per 24 hour'), //#792
  MicrogramPer8Hour('UG8H', 'ug/(8.h)', 'microgram per 8 hour'), //#793
  MicrogramPerKilogramDay('UGKD', 'ug/(kg.d)', 'microgram / kilogram * day'), //#794
  MicrogramPerKilogramHour('UGKH', 'ug/(kg.h)', 'microgram / kilogram * hour'), //#795
  MicrogramPerSpecimen('UGSP', 'ug/{Specimen}', 'microgram / Specimen'), //#796
  MicrogramPerTotalVolume('UGTV', 'ug/{TotalVolume}', 'MicroGramsPerTotalVolume'), //#797
  MicrogramPerDay('UGD', 'ug/d', 'microgram per day'), //#798
  MicrogramPerDeciliter('UGDL', 'ug/dL', 'microgram per deciliter'), //#799
  MicrogramPerDeciliterRBC('UGDR', 'ug/dL{rbc}', 'microgram / deciliter rbc'), //#800
  MicrogramPerGram('UGG', 'ug/g', 'microgram per gram'), //#801
  MicrogramPerGramCre('UGGC', 'ug/g{Cre}', 'microgram / gram Cre'), //#802
  MicrogramPerGramCreatinine('UGGT', 'ug/g{creat}', 'microgram per gram of creatinine'), //#803
  MicrogramPerGramDryWeight('UGDW', 'ug/g{DryWeight}', 'microgram / gram DryWeight'), //#804
  MicrogramPerGramHgb('UGHB', 'ug/g{Hgb}', 'microgram / gram Hgb'), //#805
  MicrogramPerGramTissue('UGTI', 'ug/g{Tissue}', 'microgram / gram Tissue'), //#806
  MicrogramPerHour('UGH', 'ug/h', 'microgram per hour'), //#807
  MicrogramPerKilogram('UGKG', 'ug/kg', 'microgram per kilogram'), //#808
  MicrogramPerKilogramPer8Hour('UGK8', 'ug/kg/(8.h)', 'microgram per kilogram per 8 hour'), //#809
  MicrogramPerKilogramPerDay('UGKD', 'ug/kg/d', 'microgram per kilogram per day'), //#810
  MicrogramPerKilogramPerHour('UGKH', 'ug/kg/h', 'microgram per kilogram per hour'), //#811
  MicrogramPerKilogramPerMinute('UGKM', 'ug/kg/min', 'microgram per kilogram per minute'), //#812
  MicrogramPerLiter('UGL', 'ug/L', 'microgram per liter'), //#813
  MicrogramPerLiterPer24Hour('UG24H', 'ug/L/(24.h)', 'microgram per liter per 24 hour'), //#814
  MicrogramPerLiterDDU('UGDD', 'ug/L{DDU}', 'microgram / liter DDU'), //#815
  MicrogramPerSquareMeter('UGM2', 'ug/m2', 'microgram per square meter'), //#816
  MicrogramPerMilligram('UGMG', 'ug/mg', 'microgram per milligram'), //#817
  MicrogramPerMilligramCre('UGCR', 'ug/mg{Cre}', 'microgram / milligram Cre'), //#818
  MicrogramPerMilligramCreatinine('UGMC', 'ug/mg{creat}', 'microgram per milligram of creatinine'), //#819
  MicrogramPerMinute('UGM', 'ug/min', 'microgram per minute'), //#820
  MicrogramPerMilliliter('UGML', 'ug/mL', 'microgram per milliliter'), //#821
  MicrogramPerMilliliterFEU('UGFE', 'ug/mL{FEU}', 'microgram / milliliter FEU'), //#822
  MicrogramPerMillimole('UGMM', 'ug/mmol', 'microgram per millimole'), //#823
  MicrogramPerNanogram('UGNG', 'ug/ng', 'microgram per nanogram'), //#824
  MicrogramT4PerDeciliter('UGT4', 'ug{T4}/dL', 'microgram T4 / deciliter'), //#825
  Microkatal('UKAT', 'ukat', 'microkatal'), //#826
  Microliter('UL', 'uL', 'microliter'), //#827
  MicroliterPer2Hour('UL2H', 'uL/(2.h)', 'microliter per 2 hour'), //#828
  MicroliterPerHour('ULH', 'uL/h', 'microliter per hour'), //#829
  Micrometer('UM', 'um', 'micrometer'), //#830
  MicrometerPerSecond('UMS', 'um/s', 'micrometer per second'), //#831
  Micromole('UMOL', 'umol', 'micromole'), //#832
  MicromolePer24Hour('UM24H', 'umol/(24.h)', 'micromole per 24 hour'), //#833
  MicromolePerDay('UMOLD', 'umol/d', 'micromole per day'), //#834
  MicromolePerDeciliter('UMDL', 'umol/dL', 'micromole per deciliter'), //#835
  MicromolePerGram('UMG', 'umol/g', 'micromole per gram'), //#836
  MicromolePerGramCre('UMGC', 'umol/g{Cre}', 'micromole / gram Cre'), //#837
  MicromolePerGramCreatinine('UMGT', 'umol/g{creat}', 'micromole per gram of creatinine'), //#838
  MicromolePerGramHgb('UMHB', 'umol/g{Hb}', 'micromole per gram of hemoglobin'), //#839
  MicromolePerGramHgbAlt('UMHG', 'umol/g{hemoglobin}', 'micromole per gram of hemoglobin'), //#840
  MicromolePerGramHgbAlt2('UMGH', 'umol/g{Hgb}', 'micromole / gram Hgb'), //#841
  MicromolePerHour('UMH', 'umol/h', 'micromole per hour'), //#842
  MicromolePerHourPerGram('UMHG', 'umol/h/g', 'micromole / hour / gram'), //#843
  MicromolePerHourPerLiter('UMHL', 'umol/h/L', 'micromole per hour per liter'), //#844
  MicromolePerHourPerMilligramOfProtein('UMHP', 'umol/h/mg{protein}', 'micromole per hour per milligram of protein'), //#845
  MicromolePerKilogram('UMKG', 'umol/kg', 'micromole per kilogram'), //#846
  MicromolePerLiter('UML', 'umol/L', 'micromole per liter'), //#847
  MicromolePerLiterPerHour('UMLH', 'umol/L/h', 'micromole per liter per hour'), //#848
  MicromolePerLiterOfRedBloodCells('UMLR', 'umol/L{rbc}', 'micromole per liter of red blood cells'), //#849
  MicromolePerMeter('UMM', 'umol/m', 'micromole / meter'), //#850
  MicromolePerMilligram('UMMG', 'umol/mg', 'micromole per milligram'), //#851
  MicromolePerMilligramCre('UMMC', 'umol/mg{Cre}', 'micromole / milligram Cre'), //#852
  MicromolePerMinute('UMM', 'umol/min', 'micromole per minute'), //#853
  MicromolePerMinutePerGram('UMMG', 'umol/min/g', 'micromole per minute per gram'), //#854
  MicromolePerMinutePerGramProtein('UMMP', 'umol/min/g{prot}', 'micromole / minute / gram prot'), //#855
  MicromolePerMinutePerGramProteinAlt('UMMP', 'umol/min/g{protein}', 'micromole per minute per gram of protein'), //#856
  MicromolePerMinutePerLiter('UMML', 'umol/min/L', 'micromole per minute per liter'), //#857
  MicromolePerMilliliter('UMML', 'umol/mL', 'micromole per milliliter'), //#858
  MicromolePerMilliliterPerMinute('UMMM', 'umol/mL/min', 'micromole per milliliter per minute'), //#859
  MicromolePerMillimole('UMMM', 'umol/mmol', 'micromole per millimole'), //#860
  MicromolePerMole('UMML', 'umol/mol', 'micromole per mole'), //#861
  MicromolePerMoleCre('UMMC', 'umol/mol{Cre}', 'micromole / mole Cre'), //#862
  MicromolePerMoleCreatinine('UMMC', 'umol/mol{creat}', 'micromole per mole of creatinine'), //#863
  MicromolePerMoleHgb('UMMH', 'umol/mol{Hb}', 'micromole per mole of hemoglobin'), //#864
  MicromolePerMicromole('UMUM', 'umol/umol', 'micromole per micromole'), //#865
  MicroOhm('UOHM', 'uOhm', 'microOhm'), //#866
  Microsecond('US', 'us', 'microsecond'), //#867
  MicroUnit('UU', 'uU', 'microUnit'), //#868
  MicroUnitPerGram('UUG', 'uU/g', 'micro enzyme unit per gram'), //#869
  MicroUnitPerLiter('UUL', 'uU/L', 'micro enzyme unit per liter'), //#870
  MicroUnitPerMilliliter('UUM', 'uU/mL', 'micro enzyme unit per milliliter'), //#871
  Microvolt('UV', 'uV', 'microvolt'), //#872
  Volt('V', 'V', 'volt'), //#873
  Week('WK', 'wk', 'week'), //#874
  MicronewtonSecond('10UN', '10.uN.s/(cm5.m2)', '10 micronewton second per centimeter to the fifth power per square meter'), //#875
  ThousandPerMicroliter('10UL', '10*4/uL', '10 thousand per microliter'), //#876
  Hour24('24H', '24.h', '24 hour'), //#877
  Ampere('A', 'A', 'Ampère'), //#878
  AspirinResponseUnit('ARU', '{ARU}', 'aspirin response unit'), //#879
  Atmosphere('ATM', 'atm', 'standard atmosphere'), //#880
  AttogramPerCell('AGC', 'ag/{cell}', 'attogram per cell'), //#881
  Becquerel('BQ', 'Bq', 'Becquerel'), //#882
  BindingIndex('BI', '{binding_index}', 'binding index'), //#883
  BodanskyUnit('BDU', '[bdsk\'U]', 'Bodansky unit'), //#884
  CAGRepeats('CAG', '{CAG_repeats}', 'CAG trinucleotide repeats'), //#885
  Calorie('CAL', 'cal', 'calorie'), //#886
  CentimeterOfWaterPerSecondPerMeter('CMS', 'cm[H2O]/s/m', 'centimeter of water per second per meter'), //#887
  Copies('CP', '{copies}', 'copies'), //#889
  CPMPerThousandCells('CPMC', '{CPM}/10*3{cell}', 'counts per minute per thousand cells'), //#892
  DekaliterPerMinute('DALM', 'daL/min', 'dekaliter per minute'), //#893
  DekaliterPerMinutePerSquareMeter('DALSM', 'daL/min/m2', 'dekaliter per minute per square meter'), //#894
  DyneSecondPerCentimeter('DYNC', 'dyn.s/cm', 'dyne second per centimeter'), //#896
  DyneSecondPerCentimeterSquareMeter('DYNSM', 'dyn.s/(cm.m2)', 'dyne second per centimeter per square meter'), //#897
  EIAValue('EVAL', '{EV}', 'EIA value'), //#900
  EnzymeUnitPer10('EU10', 'U/10', 'enzyme unit per 10'), //#901
  EnzymeUnitPer10Billion('EU10B', 'U/10*10', 'enzyme unit per 10 billion'), //#902
  EnzymeUnitPer10GramFeces('EU10F', 'U/(10.g){feces}', 'enzyme unit per 10 gram of feces'), //#903
  EnzymeUnitPerGramCreatinine('UGCT', 'U/g{creat}', 'enzyme unit per gram of creatinine'), //#904
  EnzymeUnitPerGramProtein('UGP', 'U/g{protein}', 'enzyme unit per gram of protein'), //#905
  EnzymeUnitPerLiter25C('UL25', 'U{25Cel}/L', 'enzyme unit per liter at 25 deg Celsius'), //#906
  EnzymeUnitPerLiter37C('UL37', 'U{37Cel}/L', 'enzyme unit per liter at 37 deg Celsius'), //#907
  EnzymeUnitPerTrillionRBCs('U12R', 'U/10*12{RBCs}', 'enzyme unit per trillion red blood cells'), //#908
  Farad('F', 'F', 'Farad'), //#909
  FemtomolePerMilligramCytosolProtein('FMCP', 'fmol/mg{cytosol_protein}', 'femtomole per milligram of cytosol protein'), //#910
  FemtomolePerMilligramProtein('FMP', 'fmol/mg{protein}', 'femtomole per milligram of protein'), //#911
  FluorescentIntensityUnit('FIU', '{FIU}', 'fluorescent intensity unit'), //#912
  Fraction('FRAC', '{fraction}', 'fraction'), //#913
  GAARepeats('GAA', '{GAA_repeats}', 'GAA trinucleotide repeats'), //#914
  GenomesPerMilliliter('GPM', '{genomes}/mL', 'genomes per milliliter'), //#915
  GlobulesPerHighPowerField('GPHP', '{Globules}/[HPF]', 'globules (drops) per high power field'), //#916
  GramMeterPerHeartBeat('GMHB', 'g.m/{beat}', 'gram meter per heart beat'), //#917
  GramCreatinine('GCR', 'g{creat}', 'gram of creatinine'), //#918
  GramHemoglobin('GHB', 'g{Hb}', 'gram of hemoglobin'), //#919
  GramTotalNitrogen('GTN', 'g{total_nit}', 'gram of total nitrogen'), //#920
  GramTotalProtein('GTP', 'g{total_prot}', 'gram of total protein'), //#921
  GramWetTissue('GWT', 'g{wet_tissue}', 'gram of wet tissue'), //#922
  GramPerKilogramPer8Hour('G8H', 'g/kg/(8.h)', 'gram per kilogram per 8 hour'), //#923
  GramPer8HourShift('G8HS', 'g/(8.h){shift}', 'gram per 8 hour shift'), //#924
  GramPerCubicCentimeter('GCM', 'g/cm3', 'gram per cubic centimeter'), //#925
  GramPerGramGlobulin('GGG', 'g/g{globulin}', 'gram per gram of globulin'), //#926
  GramPerKilogramPer8HourShift('G8H', 'g/kg/(8.h){shift}', 'gram per kilogram per 8 hour shift'), //#927
  GramPerMoleCreatinine('GMCT', 'g/mol{creat}', 'gram per mole of creatinine'), //#930
  GramPerSpecimen('GSP', 'g/{specimen}', 'gram per specimen'), //#931
  GramPerTotalOutput('GTO', 'g/{total_output}', 'gram per total output'), //#932
  Gray('GY', 'Gy', 'Gray'), //#934
  HeartBeatsPerMinute('HBPM', '{beats}/min', 'heart beats per minute'), //#935
  Henry('H', 'H', 'Henry'), //#936
  HighPowerField('HPF', '[HPF]', 'high power field'), //#937
  IgGAntiphosphatidylserineUnit('IGGS', '{GPS\'U}', 'IgG antiphosphatidylserine unit'), //#939
  ImmunofluorescenceAssayIndex('IFA', '{IFA_index}', 'immunofluorescence assay index'), //#942
  ImmunofluorescenceAssayTiter('IFAT', '{IFA_titer}', 'Immunofluorescence assay titer'), //#943
  InchOfWater('INH2', '[in_i\'H2O]', 'inch (international) of water'), //#944
  InfluenzaHemagglutinationTiter('IHT', '{HA_titer}', 'influenza hemagglutination titer'), //#946
  InternationalUnitPerLiter37C('IUL37', '[IU]/L{37Cel}', 'international unit per liter at 37 degrees Celsius'), //#948
  InternationalUnitPerMilligramCreatinine('IUMC', '[IU]/mg{creat}', 'international unit per milligram of creatinine'), //#949
  Katal('KAT', 'kat', 'katal'), //#950
  KiloenzymeUnit('KU', 'kU', 'kilo enzyme unit'), //#951
  KiloenzymeUnitPerLiterClass('KULC', 'kU/L{class}', 'kilo enzyme unit per liter class'), //#952
  KilocaloriePerDay('KCD', 'kcal/d', 'kilocalorie per day'), //#953
  KilocaloriePerKilogramPer24Hour('KCK24', 'kcal/kg/(24.h)', 'kilocalorie per kilogram per 24 hour'), //#954
  KilocaloriePerOunce('KCO', 'kcal/[oz_av]', 'kilocalorie per ounce (US & British)'), //#955
  KingArmstrongUnit('KAU', '[ka\'U]', 'King Armstrong unit'), //#956
  LiterPer24Hour('L24H', 'L/(24.h)', 'liter per 24 hour'), //#957
  LiterPerSecondPerSquareSecond('LSS', 'L/s/s2', 'liter per second per square second'), //#958
  LogInternationalUnit('LIU', '{Log_IU}', 'log (base 10) international unit'), //#960
  LogBase10('LOG', '{Log}', 'log base 10'), //#962
  LowPowerField('LPF', '[LPF]', 'low power field'), //#963
  Lumen('LM', 'lm', 'lumen'), //#964
  LumenSquareMeter('LMSM', 'lm.m2', 'lumen square meter'), //#965
  MacLaganUnit('MCU', '[mclg\'U]', 'Mac Lagan unit'), //#967
  Megasecond('MS', 'Ms', 'megasecond'), //#968
  MicrogramPerGramFeces('UGFC', 'ug/g{feces}', 'microgram per gram of feces'), //#969
  MicrogramFibrinogenEquivalentUnitPerMilliliter('UGFE', 'ug{FEU}/mL', 'microgram fibrinogen equivalent unit per milliliter'), //#970
  MicrogramPer100Gram('UG100', 'ug/(100.g)', 'microgram per 100 gram'), //#971
  MicrogramPerCubicMeter('UGM3', 'ug/m3', 'microgram per cubic meter'), //#972
  MicrogramPerDeciliterOfRedBloodCells('UGDR', 'ug/dL{RBCs}', 'microgram per deciliter of red blood cells'), //#973
  MicrogramPerGramDryTissue('UGDT', 'ug/g{dry_tissue}', 'microgram per gram of dry tissue'), //#974
  MicrogramPerGramHair('UGHA', 'ug/g{hair}', 'microgram per gram of hair'), //#976
  MicrogramPerGramHemoglobin('UGHG', 'ug/g{Hb}', 'microgram per gram of hemoglobin'), //#977
  MicrogramPerLiterOfRedBloodCells('UGLR', 'ug/L{RBCs}', 'microgram per liter of red blood cells'), //#979
  MicrogramPerMilliliterClass('UGMC', 'ug/mL{class}', 'microgram per milliliter class'), //#980
  MicrogramPerMilliliterEquivalent('UGME', 'ug/mL{eqv}', 'microgram per milliliter equivalent'), //#981
  MicrogramPerMillimoleCreatinine('UGMC', 'ug/mmol{creat}', 'microgram per millimole of creatinine'), //#982
  MicrogramPerSpecimenAlt('UGSP', 'ug/{specimen}', 'microgram per specimen'), //#983
  MicrogramPerSquareFoot('UGSF', 'ug/[sft_i]', 'microgram per square foot (international)'), //#984
  MicromoleBoneCollagenEquivalentPerMole('UMBE', 'umol{BCE}/mol', 'micromole bone collagen equivalent per mole'), //#985
  MicromolePer2Hour('UM2H', 'umol/(2.h)', 'micromole per 2 hour'), //#986
  MicromolePer8Hour('UM8H', 'umol/(8.h)', 'micromole per 8 hour'), //#987
  MicromolePerDeciliterGlomerularFiltrate('UMGF', 'umol/dL{GF}', 'micromole per deciliter of glomerular filtrate'), //#988
  MicromolePerKilogramFeces('UMKF', 'umol/kg{feces}', 'micromole per kilogram of feces'), //#989
  MicromolePerLiterOfRedBloodCellsAlt('UMRC', 'umol/L{RBCs}', 'micromole per liter of red blood cells'), //#990
  MicromolePerMicromoleCreatinineAlt('UMMC', 'umol/umol{creat}', 'micromole per micromole of creatinine'), //#991
  MicromolePerMilligramCreatinineAlt('UMMC', 'umol/mg{creat}', 'micromole per milligram of creatinine'), //#992
  MicromolePerMillimoleCreatinineAlt('UMMC', 'umol/mmol{creat}', 'micromole per millimole of creatinine'), //#993
  MicromolePerMinutePerGramMucosa('UMMG', 'umol/min/g{mucosa}', 'micromole per minute per gram of mucosa'), //#994
  MilliEnzymeUnitPerMillimoleCreatinine('MUCR', 'mU/mmol{creat}', 'milli enzyme unit per millimole of creatinine'), //#995
  MilliEnzymeUnitPerGramHemoglobin('MUGH', 'mU/g{Hb}', 'milli enzyme unit per gram of hemoglobin'), //#996
  MilliEnzymeUnitPerGramProtein('MUGP', 'mU/g{protein}', 'milli enzyme unit per gram of protein'); //#997

  final String abbreviation;
  final String code;
  final String description;

  const MedicalUnit(this.abbreviation, this.code, this.description);

  String getAbbreviation() {
    return abbreviation;
  }

  String getCode() {
    return code;
  }

  String getDescription() {
    return description;
  }

  @override
  int compareTo(MedicalUnit other) => abbreviation.compareTo(other.abbreviation);


  @override
  String toString() => abbreviation;

  static MedicalUnit? fromCode(String code) {
    for (MedicalUnit unit in MedicalUnit.values) {
      if (unit.code == code) {
        return unit;
      }
    }
    return null;
  }

  static MedicalUnit? fromJson(String code) {
    return fromCode(code);
  }

  String toJson() => code; // or throw an exception, or return an Optional<MedicalUnit>
}

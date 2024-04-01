# model input data processing

pnw_df <- function(
    user_lat = 0,
    user_lon = 0,
    user_aquatic_presence = NA,
    user_ephemeroptera = NA,
    user_per_taxa = NA,
    user_plants = NA,
    user_slope = NA,
    user_fish = NA,
    user_amphibians = NA
){
    df_input <- tibble(
                        lat = user_lat, 
                        lon = user_lon,
                        aqua_presence = user_aquatic_presence,
                        ephemeroptera = user_ephemeroptera,
                        peren_taxa = user_per_taxa,
                        plants = user_plants,
                        slope = user_slope,
                        fish = user_fish,
                        amphibians = user_amphibians,
                )
    df_input
}

gp_df <- function(
  user_lat = 0,
  user_lon = 0,
  user_total_abundance = NA,
  user_hydrophyte = NA,
  user_eph_isa = NA,
  user_upland_rooted = NA,
  user_diff_veg = NA,
  user_sediment_plants = NA,
  user_substrate = NA,
  user_riff_pool = NA,
  user_bank_mean = NA
){

        df_input <- tibble(
                        lat = user_lat, 
                        lon = user_lon,
                        BankWidthMean = user_bank_mean,
                        SubstrateSorting_score = user_substrate,
                        DifferencesInVegetation_score = user_diff_veg,
                        RifflePoolSeq_score = user_riff_pool,
                        SedimentOnPlantsDebris_score = user_sediment_plants,
                        TotalAbundance = user_total_abundance,
                        UplandRootedPlants_score = user_upland_rooted,
                        ephinteph_ISA_abundance = user_eph_isa,
                        hydrophytes_present = user_hydrophyte,
                )

        df_input <- df_input %>% mutate(
                TotalAbund_0_10 = case_when(TotalAbundance==0~0,
                                ((TotalAbundance>0) & (TotalAbundance<=10)~1),
                                TotalAbundance>=10~2),
                UplandRooted_PA = case_when(UplandRootedPlants_score<3~0, T~1),
                ephISAabund_PA = case_when(ephinteph_ISA_abundance==0~0, T~1),
                hydrophytes_2 = case_when(hydrophytes_present<3~0, T~1)
                ) 
        df_input
}       

aw_df <- function(
  user_lat = 0,
  user_lon = 0,
  user_hydrophyte = NA,
  user_eph_isa = NA,
  user_upland_rooted = NA,
  user_diff_veg = NA,
  user_algal_cover = NA,
  user_slope = NA,
  user_riff_pool = NA,
  user_bank_mean = NA
){

        df_input <- tibble(
                        lat = user_lat, 
                        lon = user_lon,
                        BankWidthMean = user_bank_mean,
                        AlgalCover_LiveOrDead_NoUpstream = user_algal_cover,
                        DifferencesInVegetation_score = user_diff_veg,
                        RifflePoolSeq_score = user_riff_pool,
                        Slope = user_slope,
                        UplandRootedPlants_score = user_upland_rooted,
                        perennial_West_abundance_simplified2 = user_eph_isa,
                        hydrophytes_present = user_hydrophyte,
                )
        # Need rafi to provide the code for perennial_West_abundance_simplified2
        df_input <- df_input %>% 
                        mutate(hydrophytes_present_0_1_2_3_4_5 = 
                                        case_when(hydrophytes_present<5~hydrophytes_present,T~5),

                                perennial_ISAsubregion_abundance_simp2_0_5_10_20 = 
                                        case_when(perennial_West_abundance_simplified2==0~0,
                                                perennial_West_abundance_simplified2<5~1,
                                                perennial_West_abundance_simplified2<10~2,
                                                perennial_West_abundance_simplified2<20~3,
                                                T~4),
                        )
        df_input
}  


wm_df <- function(
  user_lat = 0,
  user_lon = 0,
  user_total_abundance = NA,
  user_hydrophyte = NA,
  user_substrate = NA,
  user_eph_isa = NA,
  user_PctShade = NA,
  user_upland_rooted = NA,
  user_diff_veg = NA,
  user_slope = NA,
  user_riff_pool = NA,
  user_bank_mean = NA
){

        df_input <- tibble(
                        lat = user_lat, 
                        lon = user_lon,
                        BankWidthMean = user_bank_mean,
                        TotalAbundance = user_total_abundance,
                        DifferencesInVegetation_score = user_diff_veg,
                        UplandRootedPlants_score = user_upland_rooted,
                        RifflePoolSeq_score = user_riff_pool,
                        PctShading = user_PctShade,
                        Slope = user_slope,
                        SubstrateSorting_score = user_substrate,
                        perennial_West_abundance_simplified2 = user_eph_isa,
                        hydrophytes_present = user_hydrophyte,
                )
        # Need rafi to provide the code for perennial_West_abundance_simplified2
        df_input <- df_input %>% 
                        mutate(
                                hydrophytes_present_0_1_2_3_4_5 = 
                                        case_when(hydrophytes_present<5~hydrophytes_present,
                                        T~5),
                                perennial_ISAsubregion_abundance_simp2_0_5_10_20 = 
                                        case_when(perennial_West_abundance_simplified2==0~0,
                                                perennial_West_abundance_simplified2<5~1,
                                                perennial_West_abundance_simplified2<10~2,
                                                perennial_West_abundance_simplified2<20~3,
                                                T~4),
                                EPT_abundance_0_5_10_20 = 
                                        case_when(TotalAbundance==0~0,
                                                TotalAbundance<5~1,
                                                TotalAbundance<10~2,
                                                TotalAbundance<20~3,
                                                T~4)
                        )

        df_input
}  
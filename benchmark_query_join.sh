
hive -e "set hive.execution.engine=mr;

    SELECT
    a.poi_id
    , d.age
    , d.gender
    , d.income
    , d.ethnicity
    , d.marital_status
    , d.household_children_ind
    , d.household_children_0_2
    , d.household_children_3_5
    , d.household_children_6_10
    , d.household_children_11_15
    , d.household_children_16_17
    , COUNT(a.individual_id) AS impression
    , COUNT(DISTINCT a.individual_id) AS reach
  FROM
    ab_events a
  JOIN demogs d
  ON (a.individual_id = d.individual_id)
  GROUP BY a.poi_id
    , d.age
    , d.gender
    , d.income
    , d.ethnicity
    , d.marital_status
    , d.household_children_ind
    , d.household_children_0_2
    , d.household_children_3_5
    , d.household_children_6_10
    , d.household_children_11_15
    , d.household_children_16_17
 ;

    set hive.execution.engine=tez;

    SELECT
    a.poi_id
    , d.age
    , d.gender
    , d.income
    , d.ethnicity
    , d.marital_status
    , d.household_children_ind
    , d.household_children_0_2
    , d.household_children_3_5
    , d.household_children_6_10
    , d.household_children_11_15
    , d.household_children_16_17
    , COUNT(a.individual_id) AS impression
    , COUNT(DISTINCT a.individual_id) AS reach
  FROM
    ab_events a
  JOIN demogs d
  ON (a.individual_id = d.individual_id)
  GROUP BY a.poi_id
    , d.age
    , d.gender
    , d.income
    , d.ethnicity
    , d.marital_status
    , d.household_children_ind
    , d.household_children_0_2
    , d.household_children_3_5
    , d.household_children_6_10
    , d.household_children_11_15
    , d.household_children_16_17
 ;
"

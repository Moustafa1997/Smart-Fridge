exports.fridgeQueryList = {
  meals: "SELECT * FROM `meals` WHERE 1",
  suggestmeals:"select * from meals where meals.ingredients like concat('%', ( select name from last_reading_for_data where shelf='middle_left_shelf'  ), '%' ) AND meals.ingredients like concat('%', ( select name from last_reading_for_data where shelf='top_left_shelf'  ), '%' ) OR meals.ingredients like concat('%', ( select name from last_reading_for_data where shelf='bottom_left_shelf'  ), '%' )AND meals.ingredients like concat('%', ( select name from last_reading_for_data where shelf='bottom_right_shelf'  ), '%' )AND meals.ingredients like concat('%', ( select name from last_reading_for_data where shelf='top_right_shelf'  ), '%' )OR meals.ingredients like concat('%', ( select name from last_reading_for_data where shelf='middle_right_shelf'  ), '%' ) "
  ,
  GET_PRODUCTS_lIST_QUERY: "SELECT * FROM `last_reading_for_data` WHERE 1",
  SAVE_TL_SHELF_QUERY: "INSERT INTO top_left_shelf (quantity) values (?);",
  SAVE_TR_SHELF_QUERY: "INSERT INTO top_right_shelf (quantity) values (?);",
  SAVE_ML_SHELF_QUERY: "INSERT INTO middle_left_shelf (quantity) values (?);",
  SAVE_MR_SHELF_QUERY: "INSERT INTO middle_right_shelf (quantity) values (?);",
  SAVE_BL_SHELF_QUERY: "INSERT INTO bottom_left_shelf (quantity) values (?);",
  SAVE_BR_SHELF_QUERY: "INSERT INTO bottom_right_shelf (quantity) values (?);",
};

exports.recipesQueryList = {};

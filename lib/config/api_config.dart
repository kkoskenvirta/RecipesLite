const String baseUrl = "https://directus-em2ehfwczq-ew.a.run.app/";

const String assetsPath = "assets/";

const String qualityPath = "?fit=cover&width=800&height=600";

const String recipesPath = "items/recipe/";

const String recipeFields =
    "?fields=*,ingredients.ingredient_id.*,ingredients.id,categories.category_id.*,categories.id,tags.tag_id.*,tags.id,ingredient_groups.id,ingredient_groups.ingredient_group_id.*,ingredient_groups.ingredient_group_id.ingredients.ingredient_id.*,ingredient_groups.ingredient_group_id.ingredients.id,count(favorites)";

const String recipesPathFields =
    "items/recipe/?fields=*,ingredients.ingredient_id.*,ingredients.id,categories.category_id.*,categories.id,tags.tag_id.*,tags.id,ingredient_groups.id,ingredient_groups.ingredient_group_id.*,ingredient_groups.ingredient_group_id.ingredients.ingredient_id.*,ingredient_groups.ingredient_group_id.ingredients.id,count(favorites)";

const String loginPath = "auth/login/";

const String authGooglePath = "auth/login/google";

const String authGoogleRedirectPath = "auth/login/google/callback";

const String signupPath = "users/";

const String categoryPath = "items/category?fields=*,count(recipes)";

const String tagPath = "items/tag";

const String userDataPath = "items/user_data";

const String filesPath = "files/";

# Nice Recipes App

## Since I'm on a free package, the instance spins down after 10 minutes of inactivity. Please allow 1-2 minutes for it to spin up up upon visting.

https://nice-recipes-app.onrender.com

### Description

This is a prototype rails app which finds recipes for users. It addresses the pain point of not knowing what to cook, and focuses on fetching recipes for the users that they can cook with what they have.

### User Journeys

1 - As a home cook, I want to cook with the ingredients I have on hand so that I don't have to go shopping for too many ingredients.

* The central feature of the app is a search bar, where you type ingredients, and then see a list of recipes you can cook with those ingredients included.
  
2 - As a busy person with high standards for food, I want to either prepare food quickly, and know in advance that it will taste good.

* There are search filters to let users filter the recipes by rating / 5, and also by combined prep + cooking time.

3 - As a frequent cook, I want to save the recipes I enjoyed, so that I can find them easily later.

* After you create an account, you have the option of 'favouriting' a recipe. This will make it show up on your profile page.

### Future Features

* Users can contribute their own recipes.
* Recipes have Show pages where users can leave comments and reviews to influence the review score.
* Use more complete data - maybe a weekly task to scrape and ingest into DB a real recipe site

### Notes

* The proxy for the image URLs seems to have issues

### Decisions

* Sorted recipes alphabetically to begin with, simply to display the 'sort by' feature more strongly (pre-sorted by rating is no fun, even if it is more logical)
* Added tests after developing features rather than Test-Driven Development. For a light proof-of-concept like this, iterating in short loops and testing locally was enough. The testing strategy should match the project.
* I considered doing a further refactoring of the `Recipe` model to make use of scopes, so that I could chain an `ingredients` look-up with a `sort_by` ordering, which would be nice. Decided against it, as scopes to me, should be re-used. It would be premature to consider it's re-usability.
* Deployed on Render as... it's free.

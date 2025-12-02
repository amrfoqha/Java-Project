const ingredients = [];
                            const input = document.getElementById("ingredientInput");
                            const form = document.getElementById("ingredientForm");
                            const list = document.getElementById("ingredientsList");
                            const submitBtn = document.getElementById("submitIngredients");
                            const recipeContainer = document.getElementById("recipeContainer");

                            // Add ingredient to list
                            form.addEventListener("submit", (e) => {
                                e.preventDefault();
                                if (input.value.trim() !== "") {
                                    ingredients.push(input.value.trim());
                                    const li = document.createElement("li");
                                    li.textContent = input.value.trim();
                                    list.appendChild(li);
                                    input.value = "";
                                }
                            });

                            // Submit ingredients and fetch recipes
                            submitBtn.addEventListener("click", () => {
                                if (ingredients.length === 0) {
                                    alert("Please add at least one ingredient!");
                                    return;
                                }

                                submitBtn.textContent = "Searching...";

                                submitBtn.disabled = true;

                                fetch("/api/recipes/match", {
                                    method: "POST",
                                    headers: { "Content-Type": "application/json" },
                                    body: JSON.stringify({ ingredients: ingredients })
                                })
                                    .then(response => response.json())
                                    .then(data => {
                                        if (data.length > 0) {
                                            console.log("First recipe:", data[0]);
                                        }
                                        renderRecipes(data);

                                    })
                                    .catch(err => {
                                        console.error(err);
                                        alert("An error occurred while fetching recipes.");
                                    })
                                    .finally(() => {
                                        submitBtn.textContent = "Submit All";
                                        submitBtn.disabled = false;
                                    });
                            });

                            // Render recipes function
                            function renderRecipes(recipes) {
                                recipeContainer.innerHTML = ""; // Clear previous results

                                if (recipes.length === 0) {
                                    recipeContainer.innerHTML = "<p class='text-gray-500'>No recipes found. Try different ingredients.</p>";
                                    return;
                                }

                                recipes.forEach(recipe => {
                                    console.log("Rendering recipe:", recipe);
                                    const card = document.createElement("a");
                                    card.className = "bg-white relative shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]";
                                    card.href = `/recipeDetails/${recipe.id}`;

                                    let categoriesHtml = "";
                                    if (recipe.category) {
                                        // Example: replace any unwanted characters (like quotes) first
                                        let cleanedCategory = recipe.category.replace(/\\|"/g, "");
                                        
                                        // Split by comma and trim each item
                                        const categoriesArray = cleanedCategory.split(",").map(c => c.trim());
                                        
                                        // Generate HTML
                                        categoriesHtml = categoriesArray
                                            .map(cate => `<span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">${cate}</span>`)
                                            .join('');
                                    }

                                    card.innerHTML = `
                    <div>
                        <img src="${recipe.image}" alt="${recipe.image}" loading="lazy"
                            class="w-full h-48 object-cover hover:scale-110 ease-in-out duration-300" />
                        <button
                            class="p-2 absolute top-3 right-3 rounded-full backdrop-blur-sm transition-all bg-white/90 text-gray-600 hover:bg-orange-500 hover:text-white"><svg
                                xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="lucide lucide-bookmark" aria-hidden="true">
                                <path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z">
                                </path>
                            </svg></button>
                        </div>
                        <div class="p-4 ">
                            <h3 class="font-semibold text-lg mb-1">${recipe.title}</h3>
                            <h3 class="font-light text-xs mb-1 text-gray-500">${recipe.description}</h3>


                            <div class="flex items-center text-sm text-gray-500 gap-4 mb-2 mt-3">
                                <span class="flex items-center gap-1"><span><svg
                                            xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                            stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" class="lucide lucide-clock"
                                            aria-hidden="true">
                                            <path d="M12 6v6l4 2"></path>
                                            <circle cx="12" cy="12" r="10"></circle>
                                        </svg></span>
                                    ${recipe.cookingTime}</span>
                                <span class="flex items-center gap-1 text-red-500"><span>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                            stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" class="lucide lucide-flame"
                                            aria-hidden="true">
                                            <path
                                                d="M12 3q1 4 4 6.5t3 5.5a1 1 0 0 1-14 0 5 5 0 0 1 1-3 1 1 0 0 0 5 0c0-2-1.5-3-1.5-5q0-2 2.5-4">
                                            </path>
                                                        </svg>
                                                    </span>
                                                    ${recipe.calories}</span>
                                            </div>


                                            


                                        ${categoriesHtml}
                                        </div>
                                    </a>
                `;

                                    recipeContainer.appendChild(card);
                                });
                            }
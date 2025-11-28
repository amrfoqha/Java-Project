function search() {
    const searchInput = document.getElementById('searchInput').value.trim();
    const results = document.getElementById('result');

    if (!results) return;

    const url = '/search?q=' + encodeURIComponent(searchInput);
    fetch(url)
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            results.innerHTML = '';

            if (!Array.isArray(data) || data.length === 0) {
                results.innerHTML = `
                    <p class="col-span-3 text-center text-gray-500 py-8">
                        No recipes found
                    </p>`;
                return;
            }

            data.forEach(recipe => {
                let categories = [];

                try {
                    if (Array.isArray(recipe.category)) {
                        categories = recipe.category;
                    } else if (typeof recipe.category === 'string') {
                        categories = JSON.parse(recipe.category.replace(/'/g, '"'));
                    }
                } catch (e) {
                    categories = [recipe.category];
                }

                const categoryBadges = categories.map(cat => `
                    <span class="bg-orange-50 text-orange-600 text-xs px-2 py-1 rounded">${cat}</span>
                `).join('');

                const recipeCard = document.createElement('a');
                recipeCard.href = `/recipeDetails/${recipe.id}`;
                recipeCard.className = 'bg-white relative shadow rounded-xl overflow-hidden border border-gray-200 w-[360px] h-[380px]';

                recipeCard.innerHTML = `
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


                                            


                                        ${categoryBadges}
                                        </div>
                                    </a>
                `;

                results.appendChild(recipeCard);
            });
        })
        .catch(error => {
            console.error('Search error:', error);
            results.innerHTML = `
                <p class="col-span-3 text-center text-red-500 py-8">
                    Error loading recipes
                </p>`;
        });
}

document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('searchInput');
    if (!searchInput) return;

    let debounceTimeout;
    searchInput.addEventListener('input', () => {
        clearTimeout(debounceTimeout);
        debounceTimeout = setTimeout(search, 400);
    });
    searchInput.addEventListener('keyup', e => {
        if (e.key === 'Enter') search();
    });
});

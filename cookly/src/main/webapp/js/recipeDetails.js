function addToFavorites(element) {
    const recipeId = element.getAttribute('data-recipe-id');

    fetch("/favorite/" + recipeId, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
    })
    .then(response => {
        if (response.status === 401) {
            alert("You must log in first!");
            return;
        }

        if (response.ok) {
            // Toggle the icon color
            const svg = element.querySelector('svg');
            const currentFill = svg.getAttribute('fill');
            
            if (currentFill === 'red') {
                svg.setAttribute('fill', 'none');
            } else {
                svg.setAttribute('fill', 'red');
            }
        } else {
            alert("Failed to add recipe to favorites.");
        }
    })
    .catch(error => {
        console.error("Error adding recipe:", error);
        alert("Something went wrong.");
    });
}

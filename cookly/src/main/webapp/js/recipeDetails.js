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

function showReviewForm() {
    const form = document.getElementById('reviewForm');
    form.classList.remove('hidden');
}

function hideReviewForm() {
    const form = document.getElementById('reviewForm');
    form.classList.add('hidden');
}

document.addEventListener('DOMContentLoaded', function () {
    const stars = document.querySelectorAll('#starRating .star');
    const ratingInput = document.getElementById('rating');

    stars.forEach(star => {
        star.addEventListener('click', function() {
            const value = star.getAttribute('data-value');
            ratingInput.value = value;
            stars.forEach(s => s.style.color = s.getAttribute("data-value") <= value ? "rgba(226, 230, 21, 1)" : "#d1d5db");
            
        })
    } )
    
});


function saveRecipe(element) {const recipeId = element.getAttribute('data-recipe-id');

    fetch("/addToMarket/" + recipeId, {
        method: "GET",
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
            const el=document.getElementById("addToMarket");
            el.classList.add("hidden");
        } else {
            alert("Failed to add recipe to market.");
        }
    })
    .catch(error => {
        console.error("Error adding recipe:", error);
        alert("Something went wrong.");
    });
}

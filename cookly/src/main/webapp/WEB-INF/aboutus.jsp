<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Smart Recipe Planner</title>
    <!-- Load Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom styles for the Inter font and smooth transitions */
        :root {
            --color-primary: #10B981; /* Emerald 500 */
            --color-secondary: #064E3B; /* Emerald 900 */
        }
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f7fafc;
        }
        .text-primary { color: var(--color-primary); }
        .bg-secondary { background-color: var(--color-secondary); }
        .border-primary { border-color: var(--color-primary); }
        .btn-primary {
            background-color: var(--color-primary);
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #059669; /* Emerald 600 */
            transform: translateY(-1px);
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<main class="min-h-screen">

    <!-- Hero Section: Mission Statement -->
    <section class="bg-secondary text-white py-24 px-4 sm:px-6 lg:px-8">
        <div class="max-w-6xl mx-auto text-center">
            <p class="text-primary text-lg font-semibold mb-3 tracking-wider uppercase">Our Story</p>
            <h1 class="text-4xl sm:text-5xl lg:text-6xl font-extrabold leading-tight mb-6">
                Transforming Mealtime from Chore to Choice.
            </h1>
            <p class="text-xl max-w-3xl mx-auto opacity-80">
                We believe that eating healthy, reducing food waste, and enjoying home-cooked meals shouldn't require endless planning. Our platform leverages intelligent technology to deliver personalized meal plans and recipes tailored perfectly to your life.
            </p>
        </div>
    </section>

    <!-- Our Foundation: Story and Inspiration -->
    <section class="py-20 px-4 sm:px-6 lg:px-8 bg-white">
        <div class="max-w-7xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <!-- Story Text -->
            <div class="lg:order-1">
                <h2 class="text-3xl font-bold mb-4 text-gray-800">The Kitchen of the Future, Today.</h2>
                <p class="text-gray-600 mb-6 leading-relaxed">
                    The idea for the Smart Recipe Planner was born out of frustration: too many meal planning apps offered generic solutions, ignoring dietary complexities, budget constraints, and the reality of a busy schedule. Our founders, a mix of culinary experts and AI engineers, decided to build something better.
                </p>
                <p class="text-gray-600 mb-6 leading-relaxed">
                    Our goal was simple: to create a system that truly understands your pantry, your goals, and your family's preferences. We moved beyond simple filters to develop proprietary algorithms that suggest recipes based on what you *have*, what you *love*, and what your body *needs*.
                </p>
                <p class="text-gray-600 font-semibold leading-relaxed">
                    We're not just a recipe database—we are your personal culinary assistant, committed to making every meal a success.
                </p>
            </div>
            <!-- Placeholder Image (styled to look professional) -->
            <div class="lg:order-2 flex justify-center">
                <img
                        src="https://placehold.co/600x400/D1FAE5/065F46?text=The+Smart+Kitchen"
                        alt="A stylized placeholder image of a modern kitchen being used for cooking"
                        class="rounded-xl shadow-2xl object-cover transform hover:scale-[1.02] transition duration-500 border-4 border-primary"
                />
            </div>
        </div>
    </section>

    <!-- Our Values Section -->
    <section class="py-20 px-4 sm:px-6 lg:px-8 bg-gray-50">
        <div class="max-w-6xl mx-auto text-center">
            <h2 class="text-4xl font-extrabold mb-4 text-gray-800">Our Core Values</h2>
            <p class="text-lg text-gray-500 mb-12">These principles guide every recipe recommendation and product decision we make.</p>

            <div class="grid md:grid-cols-3 gap-8">

                <!-- Value 1: Health & Wellness -->
                <div class="bg-white p-8 rounded-xl shadow-lg hover:shadow-xl transition duration-300">
                    <!-- Icon: Heart SVG -->
                    <svg class="w-10 h-10 text-primary mb-4 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path></svg>
                    <h3 class="text-xl font-semibold mb-3 text-gray-800">Personalized Health</h3>
                    <p class="text-gray-500">
                        We prioritize nutritional balance and dietary requirements, ensuring our smart plans align perfectly with your wellness goals—whether for fitness, allergy management, or simple, clean eating.
                    </p>
                </div>

                <!-- Value 2: Innovation & Efficiency -->
                <div class="bg-white p-8 rounded-xl shadow-lg hover:shadow-xl transition duration-300">
                    <!-- Icon: Lightbulb SVG -->
                    <svg class="w-10 h-10 text-primary mb-4 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.663 17h4.673M12 20.155V21a1 1 0 102 0v-1.845a7.999 7.999 0 004.97-6.281l-.99-4.952a1 1 0 00-.99-.817H6.38a1 1 0 00-.99.817l-.99 4.952A7.999 7.999 0 0012 20.155zM12 3a4 4 0 00-4 4h8a4 4 0 00-4-4z"></path></svg>
                    <h3 class="text-xl font-semibold mb-3 text-gray-800">Smart Technology</h3>
                    <p class="text-gray-500">
                        We leverage AI to optimize your planning, minimize food waste, and save you time. Our technology constantly learns from your feedback to refine suggestions and improve your experience.
                    </p>
                </div>

                <!-- Value 3: Sustainability & Impact -->
                <div class="bg-white p-8 rounded-xl shadow-lg hover:shadow-xl transition duration-300">
                    <!-- Icon: Leaf/Globe SVG -->
                    <svg class="w-10 h-10 text-primary mb-4 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9h-3m-1 9a9 9 0 01-9-9m-3 0h3m-9 0h12m-9 5a4.5 4.5 0 01-4.5-4.5v-1.25a.75.75 0 011.5 0V14h7v-1.25a.75.75 0 011.5 0V14h7v-1.25a.75.75 0 011.5 0V14a4.5 4.5 0 01-4.5 4.5h-12zM12 5.25a.75.75 0 00-1.5 0v3a.75.75 0 001.5 0v-3z"></path></svg>
                    <h3 class="text-xl font-semibold mb-3 text-gray-800">Conscious Cooking</h3>
                    <p class="text-gray-500">
                        Our planning tools are designed to reduce your environmental footprint by minimizing ingredient overlap, helping you use up what you buy, and championing seasonal, local ingredients.
                    </p>
                </div>

            </div>
        </div>
    </section>

    <!-- The People Behind the Platform (CTA) -->
    <section class="py-24 px-4 sm:px-6 lg:px-8 bg-white">
        <div class="max-w-4xl mx-auto text-center">
            <h2 class="text-4xl font-bold mb-4 text-gray-800">Ready to Meet Your Meal Goals?</h2>
            <p class="text-xl text-gray-600 mb-8">
                We are a team of passionate foodies, dedicated developers, and health enthusiasts working every day to make your kitchen smarter and your life easier. Join the thousands of users who are already saving time and eating better.
            </p>
            <a href="/" class="btn-primary inline-flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-full text-white shadow-lg md:py-4 md:text-lg md:px-10">
                Start Your Smart Recipe Today
                <!-- Arrow Right SVG -->
                <svg class="ml-2 -mr-1 w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
            </a>
        </div>
    </section>

</main>

<!-- Simple Footer -->
<footer class="bg-secondary py-8 text-center">
    <p class="text-gray-400 text-sm">&copy; 2025 Smart Recipe Meal Planner. All rights reserved.</p>
</footer>

</body>
</html>

</body>
</html>

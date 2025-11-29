
async function fetchAdvice() {
  try {
    const res = await fetch("https://api.adviceslip.com/advice");
    if (!res.ok) throw new Error("Network response was not ok");
    const data = await res.json();
    document.getElementById("quoteContainer").innerText = '"' + data.slip.advice + '"';
  } catch (err) {
    console.error(err);
    document.getElementById("quoteContainer").innerText = "Failed to load advice.";
  }
}

fetchAdvice();


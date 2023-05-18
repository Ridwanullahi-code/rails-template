// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers";

const harmbugger = document.querySelector('.harmbugger')
const menu = document.querySelector('.menu')

harmbugger.addEventListener('click', () => {
menu.classList.toggle('hidden')
})


document.querySelectorAll('.section')
.forEach(el => {
el.addEventListener('click', (e) => {
const answer = e.currentTarget.children[2]
if (e.target.classList.contains('question')) {
answer.classList.toggle('hidden');
}
})
})

const copyButton = document.querySelector(".copy-button");
const copy = document.querySelector(".referral-link");
// This is the function we wrote earlier
async function copyTextToClipboard(text) {
if ("clipboard" in navigator) {
return await navigator.clipboard.writeText(text);
} else {
return document.execCommand("copy", true, text);
}
}

const handleCopyClick = () => {
copyTextToClipboard(copy.value)
.then(() => {
// If successful, update the button text to 'Copied!'
copyButton.innerHTML = "Copied!";

// Reset the button text to 'Copy link' after a delay
setTimeout(() => {
copyButton.innerHTML = "Copy link";
}, 1500);
})
.catch((err) => {
console.log(err);
});
};

document.querySelectorAll('.message')
.forEach(el => {
setTimeout(() => {
el.style.display = 'none'
}, 3000)
})

// document.getElementById("button-click-me").addEventListener("click", () => {
//     alert("You clicked me")
// });

const button = document.getElementById("button-click-me");
if(button){
    button.addEventListener("click", () => {
        alert("You clicked me");
    })
}
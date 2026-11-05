const form = document.getElementById("regForm");

form.addEventListener("submit", function (event) {

    let helyes = true;

    const nev = document.getElementById("nev");
    const loginnev = document.getElementById("loginnev");
    const jelszo = document.getElementById("jelszo");
    const szerepkor = document.getElementById("szerepkor");
    const mobil = document.getElementById("mobil");
    const email = document.getElementById("email");

    const nevRegex = /^[^\d]+$/;

    if (nev.value.trim() === "" || !nevRegex.test(nev.value)) {
        nev.classList.add("is-invalid");
        nev.classList.remove("is-valid");
        helyes = false;
    }
    else {
        nev.classList.remove("is-invalid");
        nev.classList.add("is-valid");
    }

    if (loginnev.value.trim() === "") {
        loginnev.classList.add("is-invalid");
        loginnev.classList.remove("is-valid");
        helyes = false;
    }
    else {
        loginnev.classList.remove("is-invalid");
        loginnev.classList.add("is-valid");
    }

    if (jelszo.value.trim() === "") {
        jelszo.classList.add("is-invalid");
        jelszo.classList.remove("is-valid");
        helyes = false;
    }
    else {
        jelszo.classList.remove("is-invalid");
        jelszo.classList.add("is-valid");
    }

    if (szerepkor.value === "") {
        szerepkor.classList.add("is-invalid");
        szerepkor.classList.remove("is-valid");
        helyes = false;
    }
    else {
        szerepkor.classList.remove("is-invalid");
        szerepkor.classList.add("is-valid");
    }

    const mobilRegex = /^[0-9+\-\/ ]+$/;

    if (mobil.value.trim() === "" || !mobilRegex.test(mobil.value)) {
        mobil.classList.add("is-invalid");
        mobil.classList.remove("is-valid");
        helyes = false;
    }
    else {
        mobil.classList.remove("is-invalid");
        mobil.classList.add("is-valid");
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[a-zA-Z]{2,}$/;

    if (email.value.trim() === "" || !emailRegex.test(email.value)) {
        email.classList.add("is-invalid");
        email.classList.remove("is-valid");
        helyes = false;
    }
    else {
        email.classList.remove("is-invalid");
        email.classList.add("is-valid");
    }

    if (!helyes) {
        event.preventDefault();
    }

});
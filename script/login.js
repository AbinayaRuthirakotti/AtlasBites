document.getElementById('loginForm').addEventListener('submit', function(e) {
    const username = this.username.value.trim();
    const password = this.password.value.trim();
    if(username === "" || password === "") {
        alert("Please enter both username and password!");
        e.preventDefault();
    }
});
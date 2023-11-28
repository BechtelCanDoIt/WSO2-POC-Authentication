/*
 * Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com).
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

<script>
        function handleLogin(event) {
            event.preventDefault(); // Prevent the form from submitting via the browser

            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;

            // You should send the credentials to your server-side code here
            // Below is a generic example which you'll need to adapt
            fetch('/login', { // Your server-side endpoint
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    username: username,
                    password: password
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.accessToken) {
                    // Login was successful
                    window.location.href = '/home'; // Redirect to the home page
                } else {
                    // Login failed
                    alert('Login failed: ' + data.error_description);
                }
            })
            .catch(error => {
                console.error('Error during login:', error);
            });
        }
    </script>